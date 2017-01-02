;;;;;;;;;;;;;;;;;;;
;instead table
;if an instead rule can 
;be found, default processing won't happen
;;;;;;;;;;;;;;;;;;;

actions_table
	.db get_id,35,NO_OBJECT,NO_OBJECT
	.dw take_gunk_sub
	.db 255
	
	
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