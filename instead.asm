;;;;;;;;;;;;;;;;;;;;;;;;;;
;instead.asm
;
;instead table follows format:
;verb, obj, prep, obj, address of subroutine
;ff
;;;;;;;;;;;;;;;;;;;;;;;;;;

take_gunk_sub
	pshs d,x,y
	ldx #gunkmsg
	jsr PRINT
	jsr PRINTCR
	nop ; move gunk to offscreen
	lda #35
	pshu a
	lda #HOLDER_ID
	pshu a
	lda #0
	pshu a
	jsr set_object_attribute
	nop ; move paperclip to player
	lda #30
	pshu a
	lda #HOLDER_ID
	pshu a
	lda #PLAYER
	pshu a
	jsr set_object_attribute
	puls y,x,d
	rts
	
gunkmsg .strz "AS YOU RELUCTANTLY PICK UP THE GUNK, IT DISINTEGRATES, LEAVING YOU WITH A PAPERCLIP."
