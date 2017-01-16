
; machine generate routine from XML file
unlock_door_event
	pshs d,x,y
	nop ; printl("THE KEY HAS LONG SINCE BEEN LOST.")
	ldx #description_table
	lda #64 ; THE KEY HAS LONG SINCE BEEN LOST.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

