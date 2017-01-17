
; machine generate routine from XML file
pick_unpickable_sub
	pshs d,x,y
	nop ; printl("YOU CAN'T PICK THAT.")
	ldx #description_table
	lda #114 ; YOU CAN'T PICK THAT.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

