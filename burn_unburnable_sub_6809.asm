
; machine generate routine from XML file
burn_unburnable_sub
	pshs d,x,y
	nop ; printl("ARE YOU SOME SORT OF ARSONIST?")
	ldx #description_table
	lda #113 ; ARE YOU SOME SORT OF ARSONIST?
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

