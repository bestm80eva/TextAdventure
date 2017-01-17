
; machine generate routine from XML file
after_drop_crate_sub
	pshs d,x,y
	nop ; test ((player.holder == top of shaft))
	lda #25
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
	nop ; println("THE CRATE FALLS DOWN THE SHAFT AND SMASHES AT THE BOTTOM.")
	ldx #description_table
	lda #107 ; THE CRATE FALLS DOWN THE SHAFT AND SMASHES AT THE BOTTOM.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; wooden crate.holder=offscreen
	lda #47 ; wooden crate
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #0
	sta ,x
	nop ; splintered wood.holder=base of shaft
	lda #48 ; splintered wood
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #23
	sta ,x
	nop ; gold bars.holder=base of shaft
	lda #49 ; gold bars
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #23
	sta ,x
	bra @b ; skip else 
@a	nop ; close (player.holder == top of shaft)
	nop ; test ((player.holder == on ladder))
	lda #24
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
	lbne @c
	nop ; println("THE CRATE FALLS DOWN THE SHAFT, NEARLY SMASHING.")
	ldx #description_table
	lda #108 ; THE CRATE FALLS DOWN THE SHAFT, NEARLY SMASHING.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; wooden crate.holder=base of shaft
	lda #47 ; wooden crate
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #23
	sta ,x
@c	nop ; close (player.holder == on ladder)
@b	nop ; end else
	puls y,x,d
	rts

