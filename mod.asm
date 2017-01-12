;mod.asm

;top of stack is number
;under it is divisor
;the result is returned on the stack
mod2b
	pshs d,x,y
	pulu d ; get number
@lp cmpd ,u
	blt @x
	subd ,u
	bra @lp
@x	pulu x	; pop divisor
	pshu d ; put result on stack
	puls y,x,d
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;user stack contains divisor (16 bit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
randmod
	pshs d,x,y
	jsr rand	; puts number on stack	
	jsr mod2b   ; leaves number on stack
	puls y,x,d
	rts
	