
; machine generate routine from XML file
pick_nose_sub
	pshs d,x,y
	nop ; printl("THERE ARE BETTER WAYS TO WASTE TIME.")
	ldx #description_table
	lda #113 ; THERE ARE BETTER WAYS TO WASTE TIME.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

