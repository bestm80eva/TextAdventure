
; machine generate routine from XML file
flashlight_on_sub
	pshs d,x,y
	nop ; test ((flashlight.lit==1))
	lda #1
	pshs a    ; push right side
	lda #32
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax PROPERTY_BYTE_2,x  ; 
	lda ,x  ; get property byte
	anda #32 ; isolate lit  bit 
	asra ; right justify bit
	asra ; right justify bit
	asra ; right justify bit
	asra ; right justify bit
	asra ; right justify bit
	cmpa ,s ; compare to right side
	pshu cc ; save flags
	leas 1,s ; pop right side
	pulu cc ; restore flags
	lbne @a
	nop ; printl("IT'S ALREADY ON.")
	ldx #description_table
	lda #65 ; IT'S ALREADY ON.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; flashlight.lit=0
	nop ; set flashlight.lit=0
	lda #32 ; flashlight
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax PROPERTY_BYTE_2,x
	lda ,x  ; get property byte
	ldb #32 ; get the mask for lit
	comb 32 ; invert it
	pshs b
	anda ,s   ; clear the bit
	leas 1,s ; pop stack
	sta ,x  ; store it
	bra @b ; skip else 
@a	nop ; close (flashlight.lit==1)
	nop ; {	printl("CLICK.")
	ldx #description_table
	lda #66 ; CLICK.
	pshu a
	jsr print_table_entry
	jsr PRINTCR
	nop ; flashlight.lit=1
	nop ; set flashlight.lit=1
	lda #32 ; flashlight
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax PROPERTY_BYTE_2,x
	lda ,x  ; get property byte
	ldb #32 ; get the mask for lit
	comb 32 ; invert it
	pshs b
	anda ,s   ; clear the bit
	leas 1,s ; pop stack
	ora #32   ; set the lit bit
	sta ,x  ; store it
	nop ; look()
	jsr look_sub
@b	nop ; end else
	puls y,x,d
	rts

