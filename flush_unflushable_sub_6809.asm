
; machine generate routine from XML file
flush_unflushable_sub
	pshs d,x,y
	nop ; printl("YOU HAVE A STRANGE FASCINATION WITH FLUSHING THINGS.")
	ldx #description_table
	lda #110 ; YOU HAVE A STRANGE FASCINATION WITH FLUSHING THINGS.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

