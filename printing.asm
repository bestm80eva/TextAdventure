EOS equ 1536
LAST_LINE equ (1024+480)
SPACE EQU 32
VRAM equ 0x400	


	org 0x0E00
START

main
	ldx #grue
	lda #0
@lp	pshs a,x
	jsr print_str
	puls x,a
	inca 
	cmpa #25
	bne @lp
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;scroll_if_needed
;
;check if cursor is at the bottom right
;of the screen.  If so, call scroll_up
;and back the cursor up to the beginning 
;of the line
;
;all registers are preserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
scroll_if_needed
	pshs a,x,y
	ldx cursorPos
	cmpx #EOS	
	ble @x			;cursor past end of screen?
	jsr scroll		
	ldy cursorPos	;back cursor up to star
	leay -32,y
	sty cursorPos
@x	puls y,x,a
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;scroll
;scrolls screen up on line
;bottom line is replace with blanks.
;The top line is lost
;
;all registers are preserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
scroll
	pshs a,x,y
	ldx #VRAM
	ldy #(VRAM+32)
@lp	lda ,y+
	sta ,x+
	cmpy #EOS
	bne @lp
	lda #SPACE		; replace the last line with blanks
	ldx #LAST_LINE
@l2 sta ,x+
	cmpx #EOS
	ble @l2			; <=
	puls y,x,a
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;print_newline
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_newline
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;print_object_name
;
;prints the full name of the object
;stored in x
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_object_name
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;locate_word
;
;locates a word in table by index
;(stored in register a).  The address
;of the word is stored in word_to_print
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
locate_word
	lda #0
	pshs a		; local var for loop counter
	ldy #dictionary
@lp	cmpa [-1,s]  ; looped enough?
	beq  @x		; found index, done
	lda ,x+		; skip to next word. get length
	pshs y
	tfr a,b		; put a in low byte
	ldb #0		; put 0 in hi byte
	tfr d,y		; move to y
	leax ,y		; skip by length of word (add y to x)
	puls y
	leax 1,x	; skip null (should)
	inc [-1,s]	; increment loop counter
	bra @lp
@x  leax 1,x	; skip length byte
	stx	word_to_print 
	puls a		; pop local var (lp counter)
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;print_table_entry
;
;prints the text for a word in a table 
; p1,2 (address of table)
; p3 index
; table format:
;[length (minus: null)][null terminated text]
;this function cleans up the stack
;this routine is called by print_object_name
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_table_entry
	pshs a,x,y
	ldx [-3,u]
@lp	cmpa [-1,u]  ;set loop counter to 0
	beq @d
	lda ,x		;get length byte
	leax a,x	;skip past text (add it to x)
	leax 1,x	;skip null
	inca 
	bra @lp
@d  jsr PRINT   ; x should now be 1 byte behind str 
	pulu y		; clean up the user stack
	pulu a
	puls y,x,a
	rts
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;print_str
;
;prints the word whose address 
;is stored in x. Assumes word is null 
;terminated.
;registers are preserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_str
	pshs a,x,y
@lp	jsr scroll_if_needed
	lda ,x+				; get next char
	cmpa #0				; null?
	beq	@x				
	sta [cursorPos]		; write char
	ldy cursorPos		;increment cursorPos
	leay 1,y		
	sty cursorPos	
	bra @lp				
@x	puls y,x,a
	rts
	
cursorPos .dw  VRAM	; the position to print the next char
word_to_print .dw  0x0000	;addr of word to print		
grue .strz "YOU ARE LIKELY TO BE EATEN BY A GRUE"
dictionary .db 0x00	; not ready yet
	END START