get_gunk_sub
	pshs d,x,y
	nop ; print("YOU RELUCTANTLY PICK UP THE GUNK, IT DISINTERGRATES, LEAVING YOU WITH A PAPERCLIP.")
	ldx #description_table
	lda #56 ; YOU RELUCTANTLY PICK UP THE GUNK, IT DISINTERGRATES, LEAVING YOU WITH A PAPERCLIP.
	pshu a
	jsr print_table_entry
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
