
; machine generate routine from XML file
kill_player_sub
	pshs d,x,y
	nop ; println("***YOU HAVE DIED***")
	ldx #description_table
	lda #107 ; ***YOU HAVE DIED***
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; player.holder=2
	lda #1 ; player
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #2
	sta ,x
	nop ; flashlight.holder=1
	lda #32 ; flashlight
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 1,x   ;holder
	lda #1
	sta ,x
	nop ; look()
	jsr look_sub
	puls y,x,d
	rts

