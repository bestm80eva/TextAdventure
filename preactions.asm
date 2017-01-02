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
	pshs d,x,y
	lda #0	; push a 0 onto the stack
	pshu a	
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
	lda #1		;put a 1 on return stack
	sta ,u
@c  leax 6,x	; entries are 6 bytes
	bra @lp
@x	puls y,x,d
	rts

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

burn_leaves_sub
	pshs d,x,y
	nop ; does the player have the lighter?
	nop ; is the player holding the leaves?
	jsr get_player_room
	pulu a
	cmpa #23  ; base of shaft
	bne @nb
	ldx #brnstr
	jsr PRINT
	jsr PRINTCR
	nop ; move leaves offscreen
	lda #27
	pshu a
	lda #HOLDER_ID
	pshu a
	lda #0
	pshu a
	jsr set_object_attribute
	nop ; connect 'on ladder' up to 
	lda #24 ; object`
	pshu a
	lda #UP
	pshu a
	lda #25
	pshu a
	jsr set_object_attribute
    bra @x	
@nb cmpa #24  ; on ladder
	beq @ol
	ldx #noburn
	jsr PRINT
	jsr PRINTCR
	bra @x
@ol	ldx #onladder 
	jsr PRINT
	jsr PRINTCR
@x	puls y,x,d
	rts

onladder .strz "THIS IS REALLY NOT A WISE PLACE TO TRY THAT."
noburn .strz "THE LEAVES START TO SMOLDER, BUT QUICKLY DIE OUT IN THE HIGH UNDERGOUND HUMIDITY."	
brnstr .strz "FUELED BY A DRAFT FROM ABOVE, THE LEAVES RAPIDLY BURN, PRODUCING A CLOUD OF ACRID SMOKE, WHICH RISING UP THE SHAFT."	
