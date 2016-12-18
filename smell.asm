;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;smell routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
smell_sub
	pshs d,x,y
	ldx #defaultsmell
	jsr PRINT
	jsr PRINTCR
	puls y,x,d
	rts
	
defaultsmell .strz	"YOU SMELL NOTHING UNEXPECTED."