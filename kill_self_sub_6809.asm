
; machine generate routine from XML file
kill_self_sub
	pshs d,x,y
	nop ; printl("THERE ARE SEVERAL ENTERTAINING WAYS TO DIE IN THIS ADVENTURE...NO NEED TO SPEED THINGS ALONG.")
	ldx #description_table
	lda #113 ; THERE ARE SEVERAL ENTERTAINING WAYS TO DIE IN THIS ADVENTURE...NO NEED TO SPEED THINGS ALONG.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	puls y,x,d
	rts

