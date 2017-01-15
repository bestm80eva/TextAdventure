
; machine generate routine from XML file
get_gunk_sub
	pshs d,x,y
	nop ; printl("AS YOU RELUCTANTLY PICK UP THE PAPPERS, THEY DISINTEGRATE INTO GUNK, LEAVING YOU WITH A BLACKENED PAPERCLIP.")
	ldx #description_table
	lda #74 ; AS YOU RELUCTANTLY PICK UP THE PAPPERS, THEY DISINTEGRATE INTO GUNK, LEAVING YOU WITH A BLACKENED PAPERCLIP.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; charred papers.holder=offscreen
	lda #35 ; charred papers
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #0
	sta ,x
	nop ; paperclip.holder=player
	lda #30 ; paperclip
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #1
	sta ,x
	puls y,x,d
	rts

