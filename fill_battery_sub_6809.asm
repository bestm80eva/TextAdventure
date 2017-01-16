
; machine generate routine from XML file
fill_battery_sub
	pshs d,x,y
	nop ; test ((steel helmet.holder==player))
	lda #1
	pshs a    ; push right side
	lda #38
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
	nop ; test ((electrolyte.holder == steel helmet))
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
	lbne @b
	nop ; println("AS THE BATTERY BEGINS CHARGES, THE PUMPS GRADUALY BEING WORKING.")
	ldx #description_table
	lda #79 ; AS THE BATTERY BEGINS CHARGES, THE PUMPS GRADUALY BEING WORKING.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; battery.description="THE BATTERY IS FULL OF ELECTROLYTE."
	lda #40 ; battery
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 3,x   ;description
	lda #80
	sta ,x
	nop ; water.holder=offscreen
	lda #37 ; water
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #0
	sta ,x
	nop ; electrolyte.holder=battery
	lda #46 ; electrolyte
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #40
	sta ,x
	nop ; flooded tunnel.nw=base of shaft
	lda #21 ; flooded tunnel
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 11,x   ;nw
	lda #23
	sta ,x
	nop ; flooded tunnel.w="YOU CAN'T GO THAT WAY."
	lda #21 ; flooded tunnel
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 7,x   ;w
	lda #81
	sta ,x
	nop ; flooded tunnel.sw=large chamber
	lda #21 ; flooded tunnel
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 10,x   ;sw
	lda #22
	sta ,x
	nop ; volt meter.description = "THE NEEDLE INDICATES CURRENT IS FLOWING."
	lda #45 ; volt meter
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 3,x   ;description
	lda #82
	sta ,x
	nop ; flooded tunnel.description = "THIS IS A LOW POINT AT THE END OF AN E-W TUNNEL. THE MAIN TUNNEL LEADS EAST. SMALLER PASSAGES LEAD NORTHWEST AND SOUTHWEST."
	lda #21 ; flooded tunnel
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 3,x   ;description
	lda #83
	sta ,x
	bra @c ; skip else 
@b	nop ; close (electrolyte.holder == steel helmet)
	nop ; {		println("THE HELMET IS EMPTY.")
	ldx #description_table
	lda #84 ; THE HELMET IS EMPTY.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@c	nop ; end else
	bra @d ; skip else 
@a	nop ; close (steel helmet.holder==player)
	nop ; {	println("YOU DON'T HAVE THE HELMET.")
	ldx #description_table
	lda #85 ; YOU DON'T HAVE THE HELMET.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@d	nop ; end else
	puls y,x,d
	rts

