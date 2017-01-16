;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SentenceTable6809.asm 
; Machine Generated Sentence Table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

postactions_table
	.db 15,47,255,255	;drop wooden crate  
	.dw after_drop_crate_sub
	.db 40,34,255,255	;flush filthy toilet  
	.dw flush_toilet_sub
	.db 40,254,255,255	;flush *  
	.dw flush_unflushable_sub
	.db 255

