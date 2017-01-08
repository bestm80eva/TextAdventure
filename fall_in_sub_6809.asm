fall_in_sub
	pshs d,x,y
	nop ; test ((player.holder==east tunnel))
	lda #10
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
	bne @A
	nop ; print("AS YOU SQUEEZE THROUGH THE GAP, THE ROCKS GIVE WAY AND YOU FALL MANY FEET TO THE DAMP GROUND AT THE BOTTOM.")
	ldx #description_table
	lda #51 ; AS YOU SQUEEZE THROUGH THE GAP, THE ROCKS GIVE WAY AND YOU FALL MANY FEET TO THE DAMP GROUND AT THE BOTTOM.
	pshu a
	jsr print_table_entry
@A	nop ; close (player.holder==east tunnel)
	puls y,x,d
	rts
