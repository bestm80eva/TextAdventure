
; machine generate routine from XML file
disolve_salt_event
	pshs d,x,y
	nop ; test ((white cube.holder==water))
	lda #37
	pshs a    ; push right side
	lda #33
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
	nop ; printl("THE LARGE BLOCK OF SALT DISOLVES IN THE WATER.")
	ldx #description_table
	lda #62 ; THE LARGE BLOCK OF SALT DISOLVES IN THE WATER.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; white cube.holder=offscreen
	lda #33 ; white cube
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #0
	sta ,x
@a	nop ; close (white cube.holder==water)
	puls y,x,d
	rts

