
; machine generate routine from XML file
unbolt_sub
	pshs d,x,y
	nop ; println("YOU CAN'T UNBOLT THAT.")
	ldx #description_table
	lda #75 ; YOU CAN'T UNBOLT THAT.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

