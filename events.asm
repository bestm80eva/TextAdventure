;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;events to run every turn
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
do_events
	pshs d,x,y
	;if player can't see, inc turns without light
	jsr get_player_room ; get room and leave it on stack
	jsr ambient_light 
	pulu a
	cmpa #0
	bne @l
	lda turns_without_light
	inca 
	sta turns_without_light
	cmpa #5
	lbeq no_light_death  ; will return
	bra @d
@l  lda #0						;set turns w/o light back to 0
	sta turns_without_light
@d  nop ; end else	
	jsr disolve_salt_sub
	puls y,d,x
	rts

disolve_salt_sub
	pshs d,x,y
	lda #33		;salt
	pshu a
	lda #HOLDER_ID
	pshu a
	jsr get_object_attribute
	pulu a
	cmpa #37  ; WATER
	bne @x
	ldx #saltstr
	jsr PRINT
	jsr PRINTCR
	nop	; move salt offscreen
	lda #33
	pshu a
	lda #HOLDER_ID
	pshu a
	lda #0 ; offscreen
	pshu a
	jsr set_object_attribute
@x	puls y,d,x
	rts

saltstr .strz "THE LARGE BLOCK OF SALT DISOLVES IN THE WATER."
	
	
no_light_death
	ldx #nld
	jsr PRINT
	jsr PRINTCR
	ldx #died
	jsr PRINT
	jsr PRINTCR
	lda #2			;put player back in room 2
	ldx #obj_table
	leax OBJ_ENTRY_SIZE,x
	leax HOLDER_ID,x
	sta ,x 
	jsr look_sub
	puls y,d,x
	rts
	
died .strz "***YOU HAVE DIED***"	
nld .strz "AS YOU FUMBLE AROUND IN THE DARKNESS, THE UNSTABLE CANVERN COLLAPSES, KILLING YOU INSTANTLY.  OF LITTLE SOLACE IS THE THOUGHT THAT YOUR INVENTORY MIGHT BE OF USE TO FUTURE ADVENTURES EXPLORING THE CAVERNS."	