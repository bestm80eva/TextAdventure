
; machine generate routine from XML file
drink_electrolyte_sub
	pshs d,x,y
	nop ; println("THE SALTY CAVE WATER TASTES UNPLEASANT.")
	ldx #description_table
	lda #81 ; THE SALTY CAVE WATER TASTES UNPLEASANT.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

