
; machine generate routine from XML file
unbolt_cupola_sub
	pshs d,x,y
	nop ; test ((wrench.holder == player))
	lda #1 ; player
	pshs a    ; push right side
	lda #42 ; wrench
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
	nop ; test ((player.holder == top of shaft))
	lda #25 ; top of shaft
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
	lbne @b
	nop ; test ((cupola.holder==top of shaft))
	lda #25 ;top of shaft
	pshs a    ; push right side
	lda #41 ; cupola
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
	nop ; printl("WITH SOME DIFFICULTY, YOU MANAGE TO REMOVE THE BOLTS. AS YOU PUSH THE CUPOLA UP, IT FALLS OUT OF THE WAY.")
	ldx #description_table
	lda #92 ; WITH SOME DIFFICULTY, YOU MANAGE TO REMOVE THE BOLTS. AS YOU PUSH THE CUPOLA UP, IT FALLS OUT OF THE WAY.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; cupola.holder=top of hill
	lda #41 ; cupola
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #26
	sta ,x
	nop ; cupola.initial_description="THERE IS A HEAVY, METAL CUPOLA ON THE GROUND."
	lda #41 ; cupola
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 2,x   ;initial_description
	lda #93
	sta ,x
	nop ; cupola.description="THE HEAVY METAL LID HAS STARTED RUSTING WITH AGE."
	lda #41 ; cupola
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 3,x   ;description
	lda #94
	sta ,x
	nop ; top of shaft.description="YOU ARE AT THE TOP OF A VENTILATION SHAFT. ABOVE, AN OPEN HOLE LEADS OUTSIDE."
	lda #25 ; top of shaft
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 3,x   ;description
	lda #95
	sta ,x
	nop ; cupola.scenery=0
	nop ; set cupola.scenery=0
	lda #41 ; cupola
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax PROPERTY_BYTE_1,x
	lda ,x  ; get property byte
	ldb #1 ; get the mask for scenery
	comb 1 ; invert it
	pshs b
	anda ,s   ; clear the bit
	leas 1,s ; pop stack
	sta ,x  ; store it
	nop ; top of shaft.up = top of hill
	lda #25 ; top of shaft
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 12,x   ;up
	lda #26
	sta ,x
	bra @d ; skip else 
@c	nop ; close (cupola.holder==top of shaft)
	nop ; {				println("YOU'VE ALREADY DONE THAT.")
	ldx #description_table
	lda #96 ; YOU'VE ALREADY DONE THAT.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@d	nop ; end else
	bra @e ; skip else 
@b	nop ; close (player.holder == top of shaft)
	nop ; {		printl("YOU CAN'T DO THAT HERE.")
	ldx #description_table
	lda #97 ; YOU CAN'T DO THAT HERE.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@e	nop ; end else
	bra @f ; skip else 
@a	nop ; close (wrench.holder == player)
	nop ; {	printl("YOU DON'T HAVE ANYTHING TO DO THAT WITH.")
	ldx #description_table
	lda #98 ; YOU DON'T HAVE ANYTHING TO DO THAT WITH.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@f	nop ; end else
	puls y,x,d
	rts

