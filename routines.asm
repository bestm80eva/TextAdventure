
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;look_at_sub
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
look_at_sub
	pshs d,x,y
	nop ; check for light
	lda sentence+1
	cmpa #$ff
	lbeq print_ret_bad_examine 
	jsr is_adjacent_door
	pulu a
	cmpa #1
	beq @s
	ldx #obj_table+OBJ_ENTRY_SIZE
	lda HOLDER_ID,x
	pshu a ; push player's room
	lda sentence+1
	pshu a ; push object to look attribute
	jsr is_visible_child_of
	pulu a
	lbeq print_ret_not_visible
@s	lda sentence+1
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	pshu x
	lda DESC_ID,x
	pshu a
	ldx #description_table
	jsr print_table_entry
	tfr y,x
	lda sentence+1
	pshu a
	jsr count_visible_items
	pulu a
	pulu x
	cmpa #0
	beq @x
	jsr print_nested_contents
@x	jsr PRINTCR
	puls y,x,d
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	called by jump table
;   new room is on user stack
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_player
	pshs a,x,y
	jsr get_move_direction ; convert verb to get move direction
	pulu b
	nop 	; now get player's current room
	jsr get_player_room ;get player's current room
	pulu a		; get player's current room
	nop ; now get that room's direction attribute
	pshu a 		; put object id back on stack (yes, this is redundant)
	pshu b		; put the direction on the stack	
	jsr get_object_attribute 
	pulu a 		; get new room
	sta new_room
	cmpa #127	; is it a room or a nogo message?
	bhi @ng
	nop ; is it a door?
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x
	ldb PROPERTY_BYTE_2,x
	andb #DOOR_MASK
	cmpb #DOOR_MASK
	bne @g		;not a door-jump
	ldb PROPERTY_BYTE_1,x
	andb #OPEN_MASK
	cmpb #OPEN_MASK
	beq @d		;open - go through door
	jsr print_object_closed
	bra @x	;
	nop		; door is open, get room it leads to
@d	jsr get_move_direction ; convert verb to get move direction
	pulu b
	ldb b,x
	stb new_room
@g	ldb #PLAYER
	pshu b 		;push player id	
	lda new_room
	pshu a		;push new room	
	jsr move_object
	jsr look_sub	
	bra @x
@ng nop		;convert a to a positive #
	coma	;take two's complement of a
	inca
	pshu a
	ldx #nogo_table	
	jsr print_table_entry
	jsr PRINTCR
@x	puls y,x,a
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;converts the verb in $sentence to the attribute
;number for that direction.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
get_move_direction
	pshs d,x,y
	lda #$ff
	pshu a			;push return value
	ldx #direction_map
@lp lda ,x
	cmpa #$ff
	beq @x
	cmpa sentence	
	bne @s
	lda 1,x ; skip id byte to get value
	sta ,u	;store return value
	bra @x
@s	leax 2,x	;go to next table entry
	bra @lp
@x	puls y,x,d
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;move_object
;param 1 is the object to move
;param 2 (top of u) is the object to move it to 
; (the new parent)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
move_object
	pshs d,x,y
	pulu b	;new room
	pulu a	;get object id
	pshu a 	;put object on stack (yes this is silly)
	lda #HOLDER_ID
	pshu a  ;put attr # on stack
	pshu b  ;put new val on stack
	jsr set_object_attribute	;
	puls y,x,d
	rts

get_sub
	pshs d,x,y
	nop	; can the player see it
	nop	; is the object portable
	lda sentence+1
	ldb #OBJ_ENTRY_SIZE
	mul
	tfr d,x
	leax obj_table,x 
	lda PROPERTY_BYTE_2,x
	anda #PORTABLE_MASK
	cmpa #PORTABLE_MASK
	lbne print_ret_not_portable
	nop ; check that the player can see it
	lda sentence+1
	pshu a
	lda #PLAYER
	pshu a
	jsr move_object
	ldx #taken
	jsr PRINT
	jsr PRINTCR
	lda sentence+1
	pshu a
	jsr unset_initial_description
@x	puls y,x,d
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;returns 1 if top of stack is a
;child of the object of the 2nd
;arg on stack
;NOT WRITTEN YET!!!!!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
is_self_or_child_of
	pshs d,x,y
	pulu b ; the parent id
	pulu a ; the child id
	puls y,x,d
	lda #0
	pshu a
	rts
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;maps verb ids to direction codes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
direction_map
	.db north_verb_id,NORTH
	.db south_verb_id,SOUTH
	.db east_verb_id,EAST
	.db west_verb_id,WEST
	.db ne_verb_id,NORTHEAST
	.db se_verb_id,SOUTHEAST
	.db sw_verb_id,SOUTHWEST
	.db nw_verb_id,NORTHWEST
	.db up_verb_id,UP
	.db down_verb_id,DOWN
	.db out_verb_id,OUT
	.db 255	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;if the player is a parent of the object,
;set its initial desc to 255 (none)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
unset_initial_description
	pshs d,x,y
	pulu a 
	ldx #obj_table
	ldb #OBJ_ENTRY_SIZE
	mul
	leax d,x
	leax INITIAL_DESC_ID,x
	lda #255
	sta ,x
	puls y,x,d
	rts
	
new_room .db  255
	
taken .strz "TAKEN."
itcontains .strz "IT CONTAINS..."
onitis .strz "ON IT IS..."