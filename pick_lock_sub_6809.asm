
; machine generate routine from XML file
pick_lock_sub
	pshs d,x,y
	nop ; test ((paperclip.holder == player))
	lda #1
	pshs a    ; push right side
	lda #30
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
	nop ; printl("AFTER SEVERAL ATTEMPTS, YOU MANAGE TO UNLOCK AND OPEN THE DOOR.")
	ldx #description_table
	lda #66 ; AFTER SEVERAL ATTEMPTS, YOU MANAGE TO UNLOCK AND OPEN THE DOOR.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; door.open=true
	nop ; set door.open=1
	lda #14 ; door
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax PROPERTY_BYTE_1,x
	lda ,x  ; get property byte
	ldb #32 ; get the mask for open
	comb 32 ; invert it
	pshs b
	anda ,s   ; clear the bit
	leas 1,s ; pop stack
	ora #32   ; set the open bit
	sta ,x  ; store it
	nop ; door.openable=true
	nop ; set door.openable=1
	lda #14 ; door
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax PROPERTY_BYTE_1,x
	lda ,x  ; get property byte
	ldb #16 ; get the mask for openable
	comb 16 ; invert it
	pshs b
	anda ,s   ; clear the bit
	leas 1,s ; pop stack
	ora #16   ; set the openable bit
	sta ,x  ; store it
	nop ; door.locked=false
	nop ; set door.locked=0
	lda #14 ; door
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax PROPERTY_BYTE_1,x
	lda ,x  ; get property byte
	ldb #128 ; get the mask for locked
	comb 128 ; invert it
	pshs b
	anda ,s   ; clear the bit
	leas 1,s ; pop stack
	sta ,x  ; store it
	nop ; door.lockable=false
	nop ; set door.lockable=0
	lda #14 ; door
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax PROPERTY_BYTE_1,x
	lda ,x  ; get property byte
	ldb #64 ; get the mask for lockable
	comb 64 ; invert it
	pshs b
	anda ,s   ; clear the bit
	leas 1,s ; pop stack
	sta ,x  ; store it
	bra @b ; skip else 
@a	nop ; close (paperclip.holder == player)
	nop ; {	printl("YOU HAVE NOTHING TO DO THAT WITH.")
	ldx #description_table
	lda #67 ; YOU HAVE NOTHING TO DO THAT WITH.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
@b	nop ; end else
	puls y,x,d
	rts

