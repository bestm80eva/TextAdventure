;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; check rules table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

check_table
	.db 30 ; burn
	.dw check_dobj_supplied
	.db 30 ; burn
	.dw check_see_dobj
	.db 19 ; close
	.dw check_dobj_supplied
	.db 19 ; close
	.dw check_see_dobj
	.db 21 ; drink
	.dw check_dobj_supplied
	.db 21 ; drink
	.dw check_see_dobj
	.db 14 ; drop
	.dw check_dobj_supplied
	.db 14 ; drop
	.dw check_see_dobj
	.db 14 ; drop
	.dw check_have_dobj
	.db 20 ; eat
	.dw check_dobj_supplied
	.db 20 ; eat
	.dw check_see_dobj
	.db 10 ; enter
	.dw check_dobj_supplied
	.db 10 ; enter
	.dw check_see_dobj
	.db 33 ; flush
	.dw check_see_dobj
	.db 12 ; get
	.dw check_dobj_supplied
	.db 12 ; get
	.dw check_see_dobj
	.db 12 ; get
	.dw check_dont_have_dobj
	.db 18 ; open
	.dw check_dobj_supplied
	.db 18 ; open
	.dw check_see_dobj
	.db 29 ; pick
	.dw check_dobj_supplied
	.db 29 ; pick
	.dw check_see_dobj
	.db 34 ; unbolt
	.dw check_dobj_supplied
	.db 34 ; unbolt
	.dw check_see_dobj
	.db 255
