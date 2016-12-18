;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;handles quitting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
quit_sub
	nop ; confirm?
	ldx #bye
	jsr PRINT
	jsr PRINTCR
	lbra @quit ; reset stacks and exit
	rts
	
bye .strz "BYE."	