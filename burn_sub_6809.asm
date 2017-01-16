
; machine generate routine from XML file
burn_sub
	pshs d,x,y
	nop ; println("YOU CAN'T BURN THAT.")
	ldx #description_table
	lda #79 ; YOU CAN'T BURN THAT.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

