
; machine generate routine from XML file
get_gunk_sub
	pshs d,x,y
	nop ; printl("AS YOU RELUCTANTLY PICK UP THE PAPPERS, THEY DISINTEGRATE, LEAVING YOU WITH A BLACKENED PAPERCLIP.")
	ldx #description_table
	lda #77 ; AS YOU RELUCTANTLY PICK UP THE PAPPERS, THEY DISINTEGRATE, LEAVING YOU WITH A BLACKENED PAPERCLIP.
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
	nop ; add(score,5)
	pshs a
	lda score
	pshu a ; push var value
	lda #5 ; push val to add
	adda ,u ; add it 
	sta score ; store it back
	pulu a ; remove temp
	puls a
	puls y,x,d
	rts

