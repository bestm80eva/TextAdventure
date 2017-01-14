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
	cmpa #ANY_OBJECT ; skip "*"
	beq @sk 
	ldy #sentence
	leay b,y
	cmpa 0,y ;compare it to sentence
	bne @c   ;if no match, continue
@sk	incb
	cmpb #4  ;done?
	bne @l2  ;loop
	nop ; if got here sentence matches
	jsr [4,x]
	lda #1		;put a 1 on return stack
	sta ,u
	bra @x
@c  leax 6,x	; entries are 6 bytes
	bra @lp
@x	puls y,x,d
	rts

;west_preaction
;		pshs d,x,y
;		jsr get_player_room
;		pulu a
;		cmpa #9
;		bne @x
;		ldx #msg1
;		jsr PRINT
;		jsr PRINTCR
;@x		puls y,x,d
;		rts



;onladder .strz "THIS IS REALLY NOT A WISE PLACE TO TRY THAT."
;noburn .strz "THE LEAVES START TO SMOLDER, BUT QUICKLY DIE OUT IN THE HIGH UNDERGOUND HUMIDITY."	
;brnstr .strz "FUELED BY A DRAFT FROM ABOVE, THE LEAVES RAPIDLY BURN, PRODUCING A CLOUD OF ACRID SMOKE, WHICH RISES UP THE SHAFT."	
