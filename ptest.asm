;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PARSER TEST
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WORD_SPACES EQU 5
WORD_SIZE EQU 32
SPACE EQU 0x20 
	ORG 0x0E00
START
	jsr copy_data ; just for testing
	jsr parse
	jsr compress_verb
@lp	bra @lp
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;moves data from variable segment to its location 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
copy_data
	ldx #0
@lp	lda vars,y
	sta 0x400,y
	leax 1,x
	cmpx #(end_vars-word1)
	bne @lp
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;nulls out the 50 characters in the
;5x10 buffer for the words in the
;sentence entered by the user
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clear_buffers
	ldx #0
	lda #0
	ldy #word1
@lp	sta ,y+
	cmpy #(hit_end-1) ; hit end of buffer?
	bne @lp
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; scans until a non-space or null is found
; sets hit_end if null is found
; search starts at addr stored in x
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
find_start
	clr hit_end
@lp lda ,x+
	sta first_char
	cmpa #0x20	; space?
	beq @lp
	cmpa #0 ; null?
	bne @x	; not null, we're done 
	lda #1	; hit null
	sta hit_end
@x	leax -1,x ; back up one byte (to count for x+)
	stx word_start
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; scans until a space or null is found
; sets the hit_end byte to 1 if a null is hit
; search starts at word_start.
; end is replaced a null
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
find_end
	lda #0	;assume we won't hit null
	sta hit_end 
	ldx word_start
@lp	lda ,x+
	cmpa #0x20 ; space
	beq @x	; hit a space, done
	cmpa #0 ; null?
	bne @lp	; no keep, scanning 
	lda #1	; hit null, set flag
	sta hit_end
@x	stx word_end
	lda #0		; replace end with null terminator
	sta -1,x
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compress_verb
; checks to see if the 2nd word is a prep
; if it is, that word is concatenated onto 
; the first work.  This accomodates verbs 
; like "look at"
; registers an unaffected
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
compress_verb
	pshs a,x,y
	ldx #word2
	ldy #prep_table
	jsr word_in_table
	pulu a
	cmpa #1 
	bne @x			; not a prep, we're done
	ldx #word1		
	stx word_start
	jsr find_end	; find end (sets word_end)
	ldy word_end
	leay -1,y
	sty word_end
	lda [word_end]	; test - make sure its a null
	lda #0x20 		; replace null with space
	sta [word_end]
	ldy word_end    ; set location to copy from
	leay 1,y		; move past the space
	ldx #word2		; set location to copy to (y)
	jsr strcpy		; copy word 2 to end of word 1
	ldx	#0			; shift all words down (move each byte 32 down)
@lp	lda word3,x		; grab a byte 
	sta word2,x  	; store it
	leax 1,x		; go to next byte
	cmpx #(WORD_SIZE*(WORD_SPACES-1))
	bne @lp			
@x	puls a,y,x
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; strcpy
; moves the string from wrd_start to wrd_end
; to the buffer stored in y
; tbd: limit the number of chars copied
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
strcpy_old
	pshs y
	ldx word_start
@lp	lda ,x+
	sta ,y+
	cmpx word_end
	bne @lp
	puls y
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; strcpy
; copies string from x to y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
strcpy
	pshs x,y
@lp	lda ,x+
	sta ,y+
	cmpa #0 ; was last char a null
	beq @x
	bra @lp
@x	puls y,x
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;streq - test two strings for equality
;
;	x,y contain strings to compare
;	assumes strings are is null terminated
;	registers are clobbered
;	1 or 0 is put on user stack
;
;   cmpare two chars.
;   are they equal?
;	if no - return 0
;	if null - return 1
;   if not null loop 
;   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
streq
	pshs x,y
@lp	lda ,x			; get char
	cmpa ,y		; are chars equal?
	bne @n			; no - return 0	
	cmpa #0			; equal. null?
	beq @y			; yes (both nulls), push 1 and return
	leax 1,x		; go to next char
	leay 1,y
	bra @lp				
@y  lda #1			; push 1 and return
	bra @x
@n 	lda #0  		; push 0 and return
@x	pshu a
	puls y,x
	rts	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;word_in_table
;
;x contains address of word
;y contains start of table
;returns 1 or 0 on the user stack
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
word_in_table
@lp	leay 1,y 		;increment y to skip length byte
	pshu x,y		; save regs
	jsr streq  		;compare
	pulu a  		; pull result into reg a
	pulu y,x		; restore regs
	cmpa #1			;check result
	beq @y			;equal! set flag and quit
	leay -1,y		;back up to get amt to skip
	lda ,y			;get the length at that byte
	leay a,y		;skip ahead by that amount
	leay 2,y		;account for 1st byte and null at end
	lda ,y			;is that byte 0 (the end of the list)
	cmpa #0			
	bne	@lp			;if no, keep checking
	lda #0			;not found, return 0
@y  pshu a 			;push return val onto stack
	sta in_tbl		;debug
@x	rts		
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;parse
;breaks up the text in "input" into words
;stored in the buffers
;y is used to hold the string storage location
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
parse
	jsr clear_buffers
	clr word_count	
	ldy #word1			;set place to put strings
	ldx #input			;load pos of str to scan
	stx word_start	
@lp	jsr find_start
	lda hit_end
	cmpa #1				; hit end (no more wrds)
	beq @x
	jsr find_end		; scan to end
	pshu x,y
	ldx word_start
	ldy #article_table	; is the word an article?
	jsr word_in_table	; 
	pulu a				; get rslt
	pulu y,x
	cmpa #1				; was it an article?
	beq @lp				; yes, skip and go to next word
	pshu x
	ldx word_start
	jsr strcpy			; copies x to y
	pulu x
	inc word_count 		; inc word count
	leay 32,y			; move location to store str by (WORD_SIZE)
	lda hit_end			; hit end?
	cmpa #1
	beq @x				; yes - done	
	lda #WORD_SPACES	; have we used all the storage locations
	cmpa word_count
	beq @x				;out of spaces for words 
	bra @lp
@x	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wrd1	.strz "AN"
wrd2	.strz "WORD2"
;;;;;;;;;;;;;;;;;;;;;;;
;article table
;1st byte is length number
;;;;;;;;;;;;;;;;;;;;;;;
article_table
	.db 3
	.strz "THE"
	.db 1
	.strz "A"
	.db 2
	.strz "AN"
	.db 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
prep_table
	.db 2
	.strz "IN"
	.db 2
	.strz "AT"
	.db 2
	.strz "ON"
	.db 2
	.strz "TO"
	.db 6
	.strz "INSIDE"
	.db 3
	.strz "OUT"
	.db 5
	.strz "UNDER"
	.db 0	
vars
	ORG 0x400
word1 rmb 32
word2 rmb 32
word3 rmb 32
word4 rmb 32
word5 rmb 32
hit_end .db 0
word_count .db 0
word_start .dw 0x0000
word_end .dw 0x0000
first_char .db 0
last_char .db 0
input .strz "LOOK AT THE LAMP"
	.strz "IN TABLE"
in_tbl .db 0
	.strz "EQ1"
equal1 .db 0
	.strz "EQ2"
equal2 .db 0


end_vars
	END START