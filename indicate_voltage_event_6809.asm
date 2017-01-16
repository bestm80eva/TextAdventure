
; machine generate routine from XML file
indicate_voltage_event
	pshs d,x,y
	nop ; test ((electrolyte.holder==battery))
	lda #40
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
	lbne @a
	nop ; volt meter.description = "THE NEEDLE INDICATES CURRENT IS FLOWING."
	lda #45 ; volt meter
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	leax 3,x   ;description
	lda #58
	sta ,x
@a	nop ; close (electrolyte.holder==battery)
	puls y,x,d
	rts

