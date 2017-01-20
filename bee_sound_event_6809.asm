
; machine generate routine from XML file
bee_sound_event
	pshs d,x,y
	nop ; test ((player.holder==on ladder))
	lda #24 ;on ladder
	pshs a    ; push right side
	lda #1 ; player
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
	nop ; test ((on ladder.up != top of shaft))
	lda #25 ; top of shaft
	pshs a    ; push right side
	lda #24 ; on ladder
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 12,x  ; up
	lda ,x
	cmpa ,s ; compare to right side
	pshu cc ; save flags
	leas 1,s ; pop right side
	pulu cc ; restore flags
	lbeq @b
	nop ; printl("HIGH ABOVE, YOU CAN HEAR BUZZING.")
	ldx #description_table
	lda #66 ; HIGH ABOVE, YOU CAN HEAR BUZZING.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@b	nop ; close (on ladder.up != top of shaft)
@a	nop ; close (player.holder==on ladder)
	puls y,x,d
	rts

