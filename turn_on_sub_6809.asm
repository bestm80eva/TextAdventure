
; machine generate routine from XML file
turn_on_sub
	pshs d,x,y
	nop ; println("YOU CAN'T TURN THAT ON.")
	ldx #description_table
	lda #107 ; YOU CAN'T TURN THAT ON.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

