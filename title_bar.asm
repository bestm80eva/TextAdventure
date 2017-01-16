;title_bar.asm

draw_bar
	pshs d,x,y
	lda #0
	ldb #32 ; blank
	ldx #1024
@lp stb a,x
	inca
	cmpa #32 ; end of line
	beq @d	;break
	bra @lp ; loop
@d  nop
	jsr print_room
	puls y,x,d
	rts
	
print_room
	pshs d,x,y
	ldy 136 ; COCO cursor
	pshs y	; save cursor pos
	ldx #1024
	stx 136 ; top left
	jsr get_player_room ;get obj and leave it on stack
	jsr print_obj_name
	jsr invert_room
	puls y		; restore cursor pos
	sty 136
	puls y,x,d
	rts

invert_room
	pshs d,x,y
	ldx #1024
	lda #0
@lp cmpa #16
	beq @x
	ldb a,x
	cmpb #32 ; don't invert blank
	beq @s
	subb #64 ;invert char
	stb a,x ;store it back to mem
@s  inca	
 	bra @lp
@x	puls y,x,d
	rts
	
	
