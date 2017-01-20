
; machine generate routine from XML file
strange_humor_sub
	pshs d,x,y
	nop ; printl("YOU HAVE A STRANGE SENSE OF HUMOR.")
	ldx #description_table
	lda #113 ; YOU HAVE A STRANGE SENSE OF HUMOR.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

