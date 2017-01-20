;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SentenceTable6809.asm 
; Machine Generated Sentence Table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

actions_table
	.db 38,27,255,255	;burn pile of leaves  
	.dw burn_leaves_sub
	.db 38,1,255,255	;burn player  
	.dw burn_self_sub
	.db 38,254,255,255	;burn *  
	.dw burn_unburnable_sub
	.db 31,254,255,255	;climb *  
	.dw climb_sub
	.db 15,43,255,255	;drop nose  
	.dw drop_undropable_sub
	.db 24,33,255,255	;eat white cube  
	.dw eat_salt_sub
	.db 24,254,255,255	;eat *  
	.dw eat_inedible_sub
	.db 12,37,255,255	;get water  
	.dw fill_helmet_sub
	.db 12,35,255,255	;get charred papers  
	.dw get_gunk_sub
	.db 12,37,10,38	;get water with steel helmet
	.dw fill_helmet_sub
	.db 12,34,255,255	;get filthy toilet  
	.dw get_toilet_sub
	.db 14,1,255,255	;kill player  
	.dw kill_self_sub
	.db 14,254,255,255	;kill *  
	.dw strange_humor_sub
	.db 20,31,10,30	;open lock with paperclip
	.dw unlock_door_sub
	.db 20,41,10,42	;open cupola with wrench
	.dw unbolt_cupola_sub
	.db 16,32,255,255	;light flashlight  
	.dw flashlight_on_sub
	.db 16,36,255,255	;light cigarette lighter  
	.dw pick_lock_sub
	.db 33,254,255,255	;pour *  
	.dw confused_msg_sub
	.db 26,37,0,38	;put water in steel helmet
	.dw fill_helmet_sub
	.db 26,46,0,40	;put electrolyte in battery
	.dw fill_helmet_sub
	.db 26,33,0,38	;put white cube in steel helmet
	.dw wont_fit_sub
	.db 26,47,0,38	;put wooden crate in steel helmet
	.dw wont_fit_sub
	.db 36,255,255,255	;jump   
	.dw jump_sub
	.db 43,41,255,255	;unbolt cupola  
	.dw unbolt_cupola_sub
	.db 43,254,255,255	;unbolt *  
	.dw unbolt_unboltable_sub
	.db 22,14,255,30	;unlock door using paperclip
	.dw pick_lock_sub
	.db 22,14,10,30	;unlock door with paperclip
	.dw pick_lock_sub
	.db 22,14,255,255	;unlock door  
	.dw unlock_door_sub
	.db 44,30,6,31	;use paperclip on lock
	.dw unlock_door_sub
	.db 44,30,6,14	;use paperclip on door
	.dw unlock_door_sub
	.db 44,34,255,255	;use filthy toilet  
	.dw use_toilet_sub
	.db 44,42,6,51	;use wrench on bolts
	.dw unbolt_cupola_sub
	.db 44,254,255,255	;use *  
	.dw use_unusable_sub
	.db 8,255,255,255	;up   
	.dw instead_up_sub
	.db 30,255,255,255	;wait   
	.dw wait_sub
	.db 255

