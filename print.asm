PRINT 
	pshs d,u,x,y
	leax -1,x
	jsr SYSPRINT
	puls y,x,u,d
		rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;prints the words in the obj_word_table for
;and object
;the id of the object in on the user stack
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_obj_name
	pshs d,x,y
	nop ; param on stack is passed to subroutine
	jsr find_obj_word_entry ;put x at start of words 
	lda ,x+
	tfr x,y
	ldx #dictionary
	pshu a ; index to print
	jsr print_table_entry
	lda ,y+
	cmpa #$ff ;last word?
	beq @x
	ldx #space 
	jsr PRINT 
	ldx #dictionary
	pshu a
	jsr print_table_entry ; print second word
	lda ,y+
	cmpa #$ff
	beq @x
	ldx #space
	jsr PRINT
	ldx #dictionary
	pshu a
	jsr print_table_entry	
@x	puls y,x,d
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;user stack contains id of obj to print
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
find_obj_word_entry
	pshs d,y
	pulu a	;get obj id
	ldx #obj_word_table
@lp	ldb ,x  ;get id
	cmpb #$ff	;end of table?
	beq @x
	cmpa ,x  ;get id
	beq @x	;found entry
	leax 4,x ; OBJ_WORD_ENTRY SIZE
	bra @lp
@x	leax 1,x ; skip id byte
	puls y,d
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;prints out non scenery items in the 
;param pushed on u
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_obj_contents
	pshs d,x,y
	nop ; now list all the objects
	ldx #obj_table
@lp lda ,x
	cmpa #$ff
	beq @x
	cmpa #PLAYER
	beq @c
	lda HOLDER_ID,x ;get holder byte
	;cmpa #PLAYER	;is the player the holder?
	cmpa ,u			;compare to parameter
	bne @c
	lda PROPERTY_BYTE_1,x		;get the byte with the scenery bit
	anda #SCENERY_MASK
	cmpa #SCENERY_MASK
	beq @c
	lda ,x	; reload and push object id
	pshu a
	jsr print_obj_name
	jsr PRINTCR
	nop ;	if that is an open container or transprent
	nop ;	print its name
	jsr print_nested_contents
@c  leax OBJ_ENTRY_SIZE,x	 ; skip to next object
	bra @lp	
@x	pulu a ; pop parameter
	puls y,x,d
	rts	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;handles 'look'
;no params
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
list_room_items
	pshs d,x,y
	jsr get_player_room
	pulu a ;get result
	tfr a,b ; save copy of room
	pshu a	;pass room # to sub
	jsr count_visible_items
	pulu a
	cmpa #0
	beq	@x	; quit if no visible objects
	ldx #visible_items
	jsr PRINT
	jsr PRINTCR
	pshu b	;push room #
	jsr print_obj_contents
@x	puls y,x,d
	rts

;print_table_entry
;
;prints the text for a word in a table 
; x contains address of table
; u contains index to print
;[length (minus null)][null terminated text]
;
;this function cleans up the stack
;this routine is called by print_object_name
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_table_entry
	pshs a,x,y
	pulu a	   ;get index to print
	pshu a     ;push a as local var	
	lda #0		;set loop counter to 0
	ldb #0
@lp	cmpa ,u		;done looping?
	beq @d
	pshs a		;save lp counter
	lda ,x		;get length byte
	leax a,x	;skip past text (add it to x)
	leax 2,x	;skip null and length byte
	puls a		;restore lp counter
	inca 
	bra @lp
@d  leax 1,x	;skip length byte
	jsr PRINT   ; x should now be 1 byte behind str 
	pulu a      ; pop local var
	puls y,x,a
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;this subroutine prints the nested contents
;of an object if it has any.
;x contains address of object to examine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
print_nested_contents
	pshs d,x,y
	nop ; check if it has contents
	lda OBJ_ID,x
	pshu a
	jsr count_visible_items
	pulu a
	cmpa #0
	beq @d
	lda PROPERTY_BYTE_1,x
	anda #CONTAINER_MASK
	cmpa #CONTAINER_MASK
	bne @s
	pshs x
	ldx #itcontains
	jsr PRINT
	jsr PRINTCR
	puls x
	lda OBJ_ID,x
	pshu a
	jsr print_obj_contents
@s	lda PROPERTY_BYTE_1,x ; is it a supporter
	anda #SUPPORTER_MASK
	cmpa #SUPPORTER_MASK	
	bne @d
	jsr PRINTCR
	pshs x
	ldx #onitis
	jsr PRINT
	jsr PRINTCR
	puls x
	lda OBJ_ID,x
	pshu a
	jsr print_obj_contents
@d	puls y,x,d
	rts

space .strz " "
visible_items .strz "VISIBLE ITEMS:"