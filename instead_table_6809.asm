;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SentenceTable6809.asm 
; Machine Generated Sentence Table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

actions_table
	.db 37,27,255,255	;burn pile of leaves  
	.dw burn_leaves_sub
	.db 37,1,255,255	;burn player  
	.dw burn_self_sub
	.db 37,254,255,255	;burn *  
	.dw burn_unburnable_sub
	.db 15,43,255,255	;drop nose  
	.dw drop_undropable_sub
	.db 12,37,255,255	;get water  
	.dw fill_helmet_sub
	.db 12,35,255,255	;get charred papers  
	.dw get_gunk_sub
	.db 12,37,9,38	;get water with steel helmet
	.dw fill_helmet_sub
	.db 12,34,255,255	;get filthy toilet  
	.dw get_toilet_sub
	.db 14,1,255,255	;kill player  
	.dw kill_self_sub
	.db 14,254,255,255	;kill *  
	.dw strange_humor_sub
	.db 32,254,255,255	;pour *  
	.dw confused_msg_sub
	.db 35,255,255,255	;jump   
	.dw jump_sub
	.db 42,41,255,255	;unbolt cupola  
	.dw unbolt_cupola_sub
	.db 42,254,255,255	;unbolt *  
	.dw unbolt_unboltable_sub
	.db 22,14,255,30	;unlock door using paperclip
	.dw pick_lock_sub
	.db 22,14,9,30	;unlock door with paperclip
	.dw pick_lock_sub
	.db 22,14,255,255	;unlock door  
	.dw unlock_door_sub
	.db 8,255,255,255	;up   
	.dw instead_up_sub
	.db 30,255,255,255	;wait   
	.dw wait_sub
	.db 255

