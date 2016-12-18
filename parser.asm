
;;;;;;;;;;;;;;;;;;;;;;;;;;
;PARSER
;;;;;;;;;;;;;;;;;;;;;;;;;;
SPACE equ 40d

START
ORG 0x400
	ldy input
	jsr clear_buffers
	clr hit_end
	ldy input
	jsr tokenize	
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;nulls out the 50 characters in the
;5x10 buffer for the words in the
;sentence entered by the user
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clear_buffers
	ldx #0
	lda #0
	ldy 0
@lp	sta $word1,y+
	cpy 50d
	bne @lp
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; advance y
; while y is pointing to a space
; advance it.  This handles more than
; one space between words
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
advance_y
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;count_words
;
;determines number of words by counting spaces
;after the loop has run, word_count is set
;registers are saved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
count_words
	pshs x,y,d
	clr $word_count
	inc $word_count  ; wc is 1 + number of spaces
	leay input
@lp	lea ,y+
	cmpa 0 ; null terminator
	beq @x	
	cmpa #SPACE 
	bne @lp	; normal char, keep going
	inc word_count	
	bra @lp
	puls d,y,x
@x	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; reads all the words into the buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
read_words
	clr word_count
	leay $input
	leax $word1
	lda 0
@lp	pshs a,x
	jsr read_word
	puls x,a
	leax 10,x ; jump to next buffer	
	dec a
	cmpa #0
	bne @lp
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; y contains address to read from
; x contains the address to store to
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
read_word
@lp	lea ,y+
	cmpa 0  ;hit end
	beq @n
	cmpa #SPACE  ;hit end
	beq @x		
	sta ,x+		;normal char
	bra @lp
@n	lda #1		;set flag saying we hit end
	sta hit_end
@x	ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;advances register x to start of the next word
;if a null terminator is hit the hit_end byte is set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
skip_spaces
	pshs a
@lp	lda ,x+
	cmpa SPACE
	brz @lp
	cmpa #0 ; null terminator?
	bnz @x  ; no, done
	lda #1	; yes, flag hit end 
	sta hit_end	;
@x	puls a
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;advances register x to end of the word
;it is currently positioned on
;if a null terminator is hit the hit_end byte is set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
skip_word
	pshs a
@lp	lda ,x+
	cmpa SPACE	; space?
	brz @x	; done?
	cmpa #0 ; null terminator?
	bnz @x  ; no, done
	lda #1	; yes, flag hit end 
	sta hit_end	;
@x	puls a
	ret

	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;word_in_table
;
;x contains address of word
;y contains start of table
;returns 1 or 0 on the stack
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
word_in_table
	clr wrd_ix
	ldy PREP_TABLE+1
@lp	pshu x	; save 
	pshu y
	jsr streq  
	puls a  ; pull result into reg a
	pulu x	; restore
	pulu y
	inc wrd_ix	;
	cmpa #1			
	beq @y			;equal! set flag and quit
	leay -1,y		;back up to get amt to skip
	lda -1,y		;get the length at that byte
	leay a,y		;skip ahead by that amount
	leay 1,y		;account for 1st byte
	lda ,y			;is that byte 0 (the end of the list)
	cmpa #0			
	bne	@lp			;if no, keep checking
	lda #0			;not found, return 0
@y  pshs a 			;push return val onto stack
@x	ret	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;streq - test two strings for equality
;
;	x,y contain strings to compare
;	assumes string in y is null terminated
;	registers are clobbered
;	1 or 0 is put on the stack
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
streq
	lda ,x
	cmpa ,y			;compare 2 chars
	bne @n	
	leax 1,x		; they were equal, go to next char
	leay 1,y		; they were equal, go to next char
	lda ,y			; check to see if y is null
	cmpa #0			; null?
	bne @lp			; if no repeat loop
	lda #1			; yes, push 1 and return
	bra @x				
@n 	lda #0  		; push 0 and return
@x	pshs a
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;strcat
;assumes x and y are null terminated
;
;x string 1
;y string 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
strcat_with_space
	; find end of str x
	; replace null with space
	; 
	ret


	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Remove articles
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;find_starts
;
;this subroutine searches the input buffer and
;populates the table of start addresses for
;each word
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
find_starts
	ldx input
	ldy $wrdstrt1
	clr word_count
	clr hit_end
@lp	jsr skip_spaces	;  skip leading space
	stx ,y++		;  store word's addr in table
	jsr skip_word	;  now skip to next word
	inc word_count	;  
	lda hit_end		;
	cmpa #1			
	bnz @x			;  yes	
	lda word_count	;  did we hit end of input?   	
	cmpa #MAX_WORDS	;  no, did we hit max words?
	bnz @lp 		;  no, keep looping	
@x	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_ret
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;scroll text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
scroll
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;get_obj_id_for_word
;
;look up the object # for a word
;the address of the word is in X
;the address of the storage location is in Y
;If the word isn't in the dictionary, FF will be returned
;on the user stack
;
;register a is preserved
;
;foreach row
;get number of words in entry
;foreach word
;	compare the word to that entry
;	if its equal,put the entry number in the Y
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
get_obj_id_for_word
	pshs a,y
	ldy #dictionary
	jsr word_in_table		;search for word (X)in the dictionary(Y)
	pulu a
	cmpa #0					;was it found?
	beq @nf					;no
	lda $wrd_ix				;yes - get the index
	ldy obj_word_table      ;no, search for object with that word
@ot	lda ,y+	;how many words are there in this entry?
	sta lp_wrds
	clr $wrd_counter
@in lda ,y+ ;
	cmpa $wrd_ix;	;is it to word# we're looking for
	beq @fd			;found? yes
	lda $wrd_counter;	
	cmpa $lp_wrds	;out of words?
	bne  @in		;keep checking
	inc $wrd_counter
	lda ,y			;check for 0 at end of table
	cmpa #0
	bne @ot			;go to next entry in object word table
@rr	bra @err
@fd	lda $wrd_counter
	bra @x
@nf lda #ff	
@x	pshu a
	puls y,a
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Prints the string in X to the cursor location
; If the string is about to go off the screen
; the text will scroll up to make room.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printstr
	pshs x
	puls x
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;prep table
;1st byte is length number
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PREP_TABLE
.db 2
.strz "IN"
.db 2+
.strz "AT"
.db 2
.strz "TO"
.db 6
.strz "INSIDE"
.db 3
.strz "OUT"
.db 0
;;;;;;;;;;;;;;;;;;;;;;;
;article table
;1st byte is length number
;;;;;;;;;;;;;;;;;;;;;;;
ARTICLE_TABLE
.db 3
.strz "THE"
.db 1
.strz "A"
.db 2
.strz "AN"
.db 0
;;;;;;;;;;;;;;;;;;;;;;;
;data area
;;;;;;;;;;;;;;;;;;;;;;;
word_count .db 0	 
hit_end .db 0
is_prep .db 0
str_cmp_rslt .db 0
word1 zmb 10,0
word2 zmb 10,0
word3 zmb 10,0
word4 zmb 10,0
word5 zmb 10,0
input .rsb 80,0
wrdstrt1 zmw;
wrdstrt2 zmw;
wrdstrt3 zmw;
wrdstrt4 zmw;
wrdstrt5 zmw;
wrdstrt5 zmw;
junk .strz "YOU ARE LIKELY TO BE EATEN BY A GRUE"
cursor .db 0x0400; cursor location
lp_wrds .db 0x00;
wrd_ix	.db 0x00
wrd_counter .db 0x00
END START
