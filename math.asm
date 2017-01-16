;mod10

;a contains value
;b contains mod
mod8
	pshs x,y
	pshs b
@lp	cmpa ,s
	bmi @x
	suba ,s ; subtract value
	bra @lp
@x  leas 1,s ; remove val we pushed
	puls y,x
	rts

;divide a by b
;result in a
div8
	pshs x,y
	pshu b  ; push divisor
	ldb #0  ; pushs result
	pshu b  ; 
@lp cmpa 1,u
    bmi @x
	suba 1,u
	inc  ,u ; 
	bra @lp
@x  lda ,u  ; put result in reg a
	leau 2,u ; pop 2 params leaving result on stack
	puls y,x
	rts

