;3;;;;;;;;;;;;;;;;;;;;;;;;;
;before action table 
;table format is 
;verb id,obj_id,prep id,obj_id 
;specific cases need to be 
;placed in the table before the
;generic ones.  For example
;'open box', should appear before 'open'
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NO_OBJECT equ 255
ANY_OBJECT equ 254

preactions_table
	;.db look_at_verb_id,ANY_OBJECT,255,255
	;.dw look_at_preaction
	.db west_verb_id,NO_OBJECT,NO_OBJECT,NO_OBJECT
	.dw west_preaction
	.db burn_verb_id,27,NO_OBJECT,NO_OBJECT
	.dw burn_leaves_sub
	.db 255
	
