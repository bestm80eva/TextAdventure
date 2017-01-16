
; machine generate routine from XML file
fill_helmet_sub
	pshs d,x,y
	nop ; test ((player.holder == flooded tunnel))
	lda #21
	pshs a    ; push right side
	lda #1
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
	nop ; test ((water.holder == flooded tunnel))
	lda #21
	pshs a    ; push right side
	lda #37
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
	lbne @b
	nop ; test ((electrolyte.holder != steel helmet))
	lda #38
	pshs a    ; push right side
	lda #46
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
	lbeq @c
	nop ; println("THE HELMET IS NOW FILLED WITH SALT WATER.")
	ldx #description_table
	lda #96 ; THE HELMET IS NOW FILLED WITH SALT WATER.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; electrolyte.holder = steel helmet
	lda #46 ; electrolyte
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #38
	sta ,x
	bra @d ; skip else 
@c	nop ; close (electrolyte.holder != steel helmet)
	nop ; {			println("THE HELMET IS ALREADY FULL.")
	ldx #description_table
	lda #97 ; THE HELMET IS ALREADY FULL.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@d	nop ; end else
	bra @e ; skip else 
@b	nop ; close (water.holder == flooded tunnel)
	nop ; {		println("THERE IS NO WATER HERE.")
	ldx #description_table
	lda #98 ; THERE IS NO WATER HERE.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@e	nop ; end else
	bra @f ; skip else 
@a	nop ; close (player.holder == flooded tunnel)
	nop ; {	println("THERE IS NO WATER HERE.")
	ldx #description_table
	lda #98 ; THERE IS NO WATER HERE.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@f	nop ; end else
	puls y,x,d
	rts

