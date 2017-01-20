
; machine generate routine from XML file
yell_sub
	pshs d,x,y
	nop ; println("AAAAARRRRRRR.")
	ldx #description_table
	lda #91 ; AAAAARRRRRRR.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

