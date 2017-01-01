;;;;;;;;;;;;;;;;;;;;;;;;;;
;vars.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;

;x is on stack
;y is the value
setvar
	pshs d,y
	sty ,x
	puls y,d
	rts

;x is the address to test
;y is the value	
;0 or 1 is returned on the stack
testvar
	pshs d,x,y
	lda #0
	cmpy ,x
	bne @x
	lda #1
@x	pshu a
	puls y,x,d
	rts
	
;x contains address of the var
;y contains value	
addtovar
	pshs d,x,y
	ldx ,x
	leax ,y
	stx ,x
	puls y,x,d
	rts

subtractfromvar
	pshs d,x,y
	puls y,x,d
	rts
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;built-in vars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
var_moves .dw 0
var_score .dw 0
var_health .dw 100
var_prev_room .dw 0
turns_without_light .db 0