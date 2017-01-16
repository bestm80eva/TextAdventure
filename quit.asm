;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;handles quitting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
quit_sub
	nop ; confirm?
	ldx #bye
	jsr PRINT
	jsr PRINTCR
;	lda #0  ; put a null in the 
;	sta $02dd  ; text input buffer to suppress a "SYNTAX ERROR"
	lbra quit ; reset stacks and exit
	rts
	
bye .strz "BYE."	
