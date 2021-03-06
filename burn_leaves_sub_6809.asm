
; machine generate routine from XML file
burn_leaves_sub
	pshs d,x,y
	nop ; test ((cigarette lighter.holder == player))
	lda #1 ; player
	pshs a    ; push right side
	lda #36 ; cigarette lighter
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
	nop ; test ((pile of leaves.holder != player))
	lda #1 ; player
	pshs a    ; push right side
	lda #27 ; pile of leaves
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
	lbeq @b
	nop ; test ((player.holder == base of shaft))
	lda #23 ; base of shaft
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
	nop ; printl("FUELED BY THE DRAFT FROM ABOVE, THE LEAVES EVAPORATE IN CLOUD OF ACRID SMOKE WHICH RISES QUICKLY UP THE SHAFT.")
	ldx #description_table
	lda #71 ; FUELED BY THE DRAFT FROM ABOVE, THE LEAVES EVAPORATE IN CLOUD OF ACRID SMOKE WHICH RISES QUICKLY UP THE SHAFT.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; add(score,10)
	pshs a
	lda score
	pshu a ; push var value
	lda #10 ; push val to add
	adda ,u ; add it 
	sta score ; store it back
	pulu a ; remove temp
	puls a
	nop ; on ladder.up=top of shaft
	lda #24 ; on ladder
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 12,x   ;up
	lda #25
	sta ,x
	nop ; leaves_burned=1
	nop ; pile of leaves.holder=offscreen
	lda #27 ; pile of leaves
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #0
	sta ,x
	bra @d ; skip else 
@c	nop ; close (player.holder == base of shaft)
	nop ; test ((player.holder == on ladder))
	lda #24 ; on ladder
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
	lbne @e
	nop ; printl("YOU CAN'T DO THAT WHILE ON A LADDER")
	ldx #description_table
	lda #72 ; YOU CAN'T DO THAT WHILE ON A LADDER
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	bra @f ; skip else 
@e	nop ; close (player.holder == on ladder)
	nop ; {				printl("THE LEAVES SMOLDER A BIT, THEN GO OUT DUE TO THE HIGH HUMIDITY.")
	ldx #description_table
	lda #73 ; THE LEAVES SMOLDER A BIT, THEN GO OUT DUE TO THE HIGH HUMIDITY.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@f	nop ; end else
@d	nop ; end else
	bra @g ; skip else 
@b	nop ; close (pile of leaves.holder != player)
	nop ; {		printl("THE LEAVES (WHICH YOU ARE CARRYING) IGNTIE. UNFORTUNATELY, THE FIRE RAPIDLY SPREADS TO YOU.")
	ldx #description_table
	lda #74 ; THE LEAVES (WHICH YOU ARE CARRYING) IGNTIE. UNFORTUNATELY, THE FIRE RAPIDLY SPREADS TO YOU.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; printl("NEXT TIME TRY DROPPING THE LEAVES.")
	ldx #description_table
	lda #75 ; NEXT TIME TRY DROPPING THE LEAVES.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; kill_player()
	jsr kill_player_sub
@g	nop ; end else
	bra @h ; skip else 
@a	nop ; close (cigarette lighter.holder == player)
	nop ; {	printl("YOU HAVE NO IGNITION SOURCE.")
	ldx #description_table
	lda #76 ; YOU HAVE NO IGNITION SOURCE.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@h	nop ; end else
	puls y,x,d
	rts

