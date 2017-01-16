
; machine generate routine from XML file
flush_toilet_sub
	pshs d,x,y
	nop ; test ((paperclip.holder==offscreen))
	lda #0
	pshs a    ; push right side
	lda #30
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x  ; holder
	lda ,x
	cmpa ,s ; compare to right side
	pshu cc ; save flags
	leas 1,s ; pop right side
	pulu cc ; restore flags
	lbne @a
	nop ; printl("THE REMAINING WATER IN THE TANK WASHES AWAY THE PAPER LEAVING A PAPERCLIP AT THE BOTTOM OF THE BOWL.")
	ldx #description_table
	lda #86 ; THE REMAINING WATER IN THE TANK WASHES AWAY THE PAPER LEAVING A PAPERCLIP AT THE BOTTOM OF THE BOWL.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; paperclip.holder=filthy toilet
	lda #30 ; paperclip
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #34
	sta ,x
	nop ; charred papers.holder=offscreen
	lda #35 ; charred papers
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #0
	sta ,x
	bra @b ; skip else 
@a	nop ; close (paperclip.holder==offscreen)
	nop ; {	println("NOTHING HAPPENS.")
	ldx #description_table
	lda #87 ; NOTHING HAPPENS.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@b	nop ; end else
	puls y,x,d
	rts

