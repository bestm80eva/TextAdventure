
; machine generate routine from XML file
jump_sub
	pshs d,x,y
	nop ; test ((player.holder==top of shaft))
	lda #25 ;top of shaft
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
	nop ; println("FOR SOME INEXPLICABLE REASON YOU DECIDE TO JUMP OFF THE LADDER.")
	ldx #description_table
	lda #103 ; FOR SOME INEXPLICABLE REASON YOU DECIDE TO JUMP OFF THE LADDER.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; println("UNFORTUNATELY, THE ROCK FLOOR AT THE BOTTOM OF THE SHAFT ISN'T QUITE AS FORGIVING AS YOU HAD ANTICIPATED.")
	ldx #description_table
	lda #104 ; UNFORTUNATELY, THE ROCK FLOOR AT THE BOTTOM OF THE SHAFT ISN'T QUITE AS FORGIVING AS YOU HAD ANTICIPATED.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; kill_player()
	jsr kill_player_sub
	bra @b ; skip else 
@a	nop ; close (player.holder==top of shaft)
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
	lbne @c
	nop ; println("YOU LAND WITH A THUD AT THE BOTTOM OF THE SHAFT.")
	ldx #description_table
	lda #105 ; YOU LAND WITH A THUD AT THE BOTTOM OF THE SHAFT.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; player.holder = base of shaft
	lda #1 ; player
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #23
	sta ,x
	bra @d ; skip else 
@c	nop ; close (player.holder==on ladder)
	nop ; {	println("WHEEEE!")
	ldx #description_table
	lda #106 ; WHEEEE!
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@d	nop ; end else
@b	nop ; end else
	puls y,x,d
	rts

