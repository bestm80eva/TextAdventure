
; machine generate routine from XML file
wait_sub
	pshs d,x,y
	nop ; printl("TIME PASSES...")
	ldx #description_table
	lda #110 ; TIME PASSES...
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

