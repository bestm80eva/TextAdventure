
; machine generate routine from XML file
before_west_sub
	pshs d,x,y
	nop ; test ((player.holder == TOP OF DEBRIS))
	lda #9
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
	nop ; printl("AS YOU SQUIRM THROUGH THE NARROW GAP, THE ROCKS GIVE WAY CAUSING YOU TO FALL MANY FEET TO THE TUNNEL FLOOR.")
	ldx #description_table
	lda #52 ; AS YOU SQUIRM THROUGH THE NARROW GAP, THE ROCKS GIVE WAY CAUSING YOU TO FALL MANY FEET TO THE TUNNEL FLOOR.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@a	nop ; close (player.holder == TOP OF DEBRIS)
	puls y,x,d
	rts

