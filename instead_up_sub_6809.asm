
; machine generate routine from XML file
instead_up_sub
	pshs d,x,y
	nop ; test ((player.holder == TOP OF SHAFT))
	lda #25 ; TOP OF SHAFT
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
	nop ; test ((wooden crate.holder==player))
	lda #1 ;player
	pshs a    ; push right side
	lda #47 ; wooden crate
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
	nop ; println("YOU CAN'T FIT THROUGH THE OPENING WHILE CARRYING THE CRATE.")
	ldx #description_table
	lda #68 ; YOU CAN'T FIT THROUGH THE OPENING WHILE CARRYING THE CRATE.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	bra @c ; skip else 
@b	nop ; close (wooden crate.holder==player)
	nop ; {		move()
	jsr move_player
@c	nop ; end else
	bra @d ; skip else 
@a	nop ; close (player.holder == TOP OF SHAFT)
	nop ; {	move()
	jsr move_player
@d	nop ; end else
	puls y,x,d
	rts

