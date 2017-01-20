;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SentenceTable6809.asm 
; Machine Generated Sentence Table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

preactions_table
	.db 32,38,255,255	;fill steel helmet  
	.dw fill_helmet_sub
	.db 32,38,10,37	;fill steel helmet with water
	.dw fill_helmet_sub
	.db 32,40,10,46	;fill battery with electrolyte
	.dw fill_battery_sub
	.db 37,31,255,255	;pick lock  
	.dw pick_lock_sub
	.db 37,31,10,30	;pick lock with paperclip
	.dw pick_lock_sub
	.db 37,43,255,255	;pick nose  
	.dw pick_nose_sub
	.db 37,254,255,255	;pick *  
	.dw pick_unpickable_sub
	.db 33,46,8,40	;pour electrolyte into battery
	.dw fill_battery_sub
	.db 33,38,8,40	;pour steel helmet into battery
	.dw fill_battery_sub
	.db 39,32,255,255	;turn on flashlight  
	.dw flashlight_on_sub
	.db 40,32,255,255	;turn off flashlight  
	.dw flashlight_off_sub
	.db 3,255,255,255	;west   
	.dw before_west_sub
	.db 255

