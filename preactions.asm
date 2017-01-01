;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; run_actions.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; x contains address of table
; with actions.
;
; registers are clobbered
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
run_actions
    
@lp	lda ,x
	cmpa #$ff  ; hit end?
	beq @x
	ldb #0
@l2	lda b,x  ;get a byte from table
	ldy #sentence
	leay b,y
	cmpa 0,y ;compare it to sentence
	bne @c   ;if no match, continue
	incb
	cmpb #4  ;done?
	bne @l2  ;loop
	nop ; if got here sentence matches
	jsr [4,x]
@c  leax 6,x	; entries are 6 bytes
	bra @lp
@x	rts

west_preaction
		pshs d,x,y
		jsr get_player_room
		pulu a
		cmpa #9
		bne @x
		ldx #msg1
		jsr PRINT
		jsr PRINTCR
@x		puls y,x,d
		rts

;verify the object isn't 255
;verify there is light
;verify the object is visible
look_at_preaction
	nop ; check syntax
	lda sentence+1
	cmpa #255
	bne @s
	leas 4,s ; pop return addresses off stack
	lbra print_ret_bad_examine
@s	nop ; check visible
	lda sentence+1
	jsr get_player_room
	pulu a
	pshu a 
	lda sentence+1
	pshu a
	jsr is_visible_child_of
	pulu a
	cmpa #0
	bne @s2
	leas 4,s ; pop return address off stack
	lbra print_ret_not_visible
@s2	rts  ; return back to run preactions

msg1 .strz "AS YOU SQUEEZE THROUGHT THE GAP, THE ROCKS GIVE WAY AND YOU FALL MANY FEET TO THE DAMP GROUND AT THE BOTTOM."	
