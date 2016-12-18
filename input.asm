BUF_SIZE equ 33
KBSCAN	equ 1000
VRAM 	equ	0x0400
LAST_LINE equ (VRAM+(32*15))
EOS equ 1535

main
@lp
	jsr read_line
	bra @lp
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;clears the input buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clr_buf
	lda #0
	ldx #0
@lp sta input_buffer,x
	leax 1,x
	cmpx #33
	bne @lp
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;new_line
;moves the cursor down a line 
;(to the next multiple of 32)
;registers are preserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
new_line
@lp	ldx cursorPos	; inc cursor pos
	leax 1,x	
	stx cursorPos	; write it back
	jsr x_mod_32 ; at start of line?
	cmpx #0
	bne @lp		 ; no, keep moving forward	
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
backspace
	pshs a,x,y
	lda char_count
	cmpa #0
	beq @x
@x	puls y,x,a
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;x_mod_32
;contents of x are moded by 32 
;rslt stays in x
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
x_mod_32
@lp	cmpx #32
	blt @x
	leax -32,x		; not done, subtract 32
	bra @lp
@x	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;reads a line of text from the console
;
;the user is not allowed to enter more
;than one line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
read_line
	pshs a,x,y
	ldx cursorPos		;
	stx cursor_start	;
@lp	jsr KBSCAN	;get a char
	cmpa #0
	bne @lp		
	cmpa #NL	; carriage return?
	beq @x
	sta [cursorPos] 			; regular char	
	ldx cursorPos				; increment cursor
	leax 1,x
	stx cursorPos
@x	ldx [cursor_start]		; move chars from screen to buffer	
	ldy #0
@l2	lda ,x					; get a char	
	sta input_buffer,y		; move it to buffer
	leax 1,x				;
	leay 1,y				;
	cmpx [cursorPos]		; have we copied all the chars?
	bne @l2					; 
	jsr new_line			; drop cursor down a line 			
	ldx [cursorPos]			; past bottom of the screen?
    cmpx #EOS
	ble @sk
	jsr scroll				; scroll screen up
	ldx cursorPos			; subtract 32 from cursor pos
	leax -32,x				;
	stx cursorPos			
@sk	puls y,x,a				; done
	rts

	include "utils.asm"
	
cursorPos .dw  VRAM	; the position to print the next char	
char_count .db 0x00		; index of char being typed in 	
cursor_start .dw 0x0000
newline_mask	.dw 0xE0	; %11100000 ; 
input_buffer 	rmb 32 	