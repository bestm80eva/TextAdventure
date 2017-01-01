;;;;;;;;;;;;;;;;;;;;;;;;;;
;instead.asm
;
;instead table follows format:
;verb, obj, prep, obj, address of subroutine
;ff
;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;run_instead_action
;
;returns 1 if handled, 0 if not
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
run_instead_actions
	pshs d,x,y
	lda #0
	pshu a 	; push 0 (not handled)
	ldx #instead_actions_table
	lda ,x
	cmpa #$ff
	beq @x
	ldy #sentence
	ldb #0
@lp	lda b,x
	cmpa b,y
	bne @c
	incb
	cmpb #4
	bne @lp
	nop ; if got here, found a match, run rule
	jsr [4,x] 
	lda #1
	sta ,u	;return 1 on stack
	bra @x
@c	leax 6,x ; skip to next record
	bra @lp	
@x  puls y,x,d
	rts