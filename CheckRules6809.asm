;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; check rules table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

check_table
	.db 34 ; burn
	.dw check_dobj_supplied
	.db 34 ; burn
	.dw check_see_dobj
	.db 20 ; close
	.dw check_dobj_supplied
	.db 20 ; close
	.dw check_see_dobj
	.db 22 ; drink
	.dw check_dobj_supplied
	.db 22 ; drink
	.dw check_see_dobj
	.db 15 ; drop
	.dw check_dobj_supplied
	.db 15 ; drop
	.dw check_see_dobj
	.db 15 ; drop
	.dw check_have_dobj
	.db 21 ; eat
	.dw check_dobj_supplied
	.db 21 ; eat
	.dw check_see_dobj
	.db 10 ; enter
	.dw check_dobj_supplied
	.db 10 ; enter
	.dw check_see_dobj
	.db 17 ; examine
	.dw check_see_dobj
	.db 17 ; examine
	.dw check_dobj_supplied
	.db 37 ; flush
	.dw check_see_dobj
	.db 12 ; get
	.dw check_dobj_supplied
	.db 12 ; get
	.dw check_see_dobj
	.db 12 ; get
	.dw check_dont_have_dobj
	.db 14 ; kill
	.dw check_dobj_supplied
	.db 14 ; kill
	.dw check_see_dobj
	.db 19 ; open
	.dw check_dobj_supplied
	.db 19 ; open
	.dw check_see_dobj
	.db 33 ; pick
	.dw check_dobj_supplied
	.db 33 ; pick
	.dw check_see_dobj
	.db 23 ; put
	.dw check_dobj_supplied
	.db 23 ; put
	.dw check_see_dobj
	.db 23 ; put
	.dw check_prep_supplied
	.db 23 ; put
	.dw check_iobj_supplied
	.db 35 ; turn on
	.dw check_dobj_supplied
	.db 35 ; turn on
	.dw check_see_dobj
	.db 35 ; turn on
	.dw check_have_dobj
	.db 39 ; unbolt
	.dw check_dobj_supplied
	.db 39 ; unbolt
	.dw check_see_dobj
	.db 255
