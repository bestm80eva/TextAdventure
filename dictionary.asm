;;;;;;;;;;;;;;;;;;;;;;;
;dictionary.asm
;;;;;;;;;;;;;;;;;;;;;;;
;byte 2 (PROPERTY_BYTE_2 on the 'right')

PORTABLE_MASK equ 1
EDIBLE_MASK equ 2
DRINKABLE_MASK equ 4
FLAMABLE_MASK equ 8
LIGHTABLE_MASK equ 16
LIT_MASK equ 32	
EMITTING_LIGHT_MASK equ 32
DOOR_MASK equ 64
USED_MASK equ 128
;DRINKABLE_MASK equ 128


; byte 1 (PROPERTY_BYTE_1)
SCENERY_MASK equ 1
SUPPORTER_MASK equ 2
CONTAINER_MASK equ 4
TRANSPARENT_MASK equ 8
OPENABLE_MASK equ 16
OPEN_MASK equ 32
LOCKABLE_MASK equ 64
LOCKED_MASK equ 128
OPEN_CONTAINER_MASK equ (OPEN_MASK|CONTAINER_MASK) ;


OBJ_ID equ 0
HOLDER_ID equ 1
NAME_ID equ  2
DESC_ID equ 3
NORTH equ 4
SOUTH equ 5
EAST equ 6
WEST equ 7
NORTHEAST equ 8
SOUTHEAST equ 9
SOUTHWEST equ 10
NORTHWEST equ 11
UP equ 12
DOWN equ 13
OUT equ 14


OBJ_ENTRY_SIZE equ 18
PROPERTY_BYTE_1 equ 16
PROPERTY_BYTE_2 equ 17
dictionary
	.db 5
	.strz "RUSTY" 
	.db 4
	.strz "IRON" 
	.db 4
	.strz "LAMP" 
	.db 5
	.strz "SWORD" 
	.db 6
	.strz "WOODEN" ; 4
	.db 5
	.strz "TABLE"  ; 5
	.db 5
	.strz "SMALL" ; 6
	.db 3
	.strz "BOX"		;7
	.db 5
	.strz "HEAVY"	;8	
	.db 4
	.strz "DOOR"	;9
	.db 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;table can hold at most 3 words 
;obj id,wrd1,wrd2,wrd3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
obj_word_table
	.db 4,0,2,255	; RUSTY LAMP
	.db 5,1,3,255	; IRON SWORD	
	.db 6,4,5,255	; WOODEN TABLE
	.db 7,6,7,255	; SMALL BOX
	.db 9,8,9,255	; HEAVY DOOR
obj_table_size .db 5


;id,holder id,name id,description id,n,s,e,w,ne,se,sw,nw,u,d,out,size 	
;18 bytes per entry
obj_table
	.db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,0				; offscreen
	.db 0,0 ;properties
	
	.db 1,2,0,0,0,0,0,0,0,0,0,0,0,0,255,0				; player
	.db 0,0	;properties
	
	.db 2,0,255,2,3,255,254,255,255,255,255,255,255,255,255,0	; room 1
	.db 0,LIT_MASK	;properties
	
	.db 3,0,255,3,255,2,255,8,255,255,255,255,255,255,255,0	; room 2
	.db 0,LIT_MASK	;properties
	
	.db 4,1,0,1,255,255,255,255,255,255,255,255,255,255,255,0	; rusty lamp
	.db 0,LIT_MASK+PORTABLE_MASK ;	properties
	
	.db 5,3,0,1,255,255,255,255,255,255,255,255,255,255,255,0	; iron sword
	.db 0,PORTABLE_MASK	;properties
	
	.db 6,3,0,0,255,255,255,255,255,255,255,255,255,255,255,0	; wooden table
	.db SUPPORTER_MASK,0	;properties
	
	.db 7,3,0,0,255,255,255,255,255,255,255,255,255,255,255,0	; box
	.db OPEN_MASK,CONTAINER_MASK	;properties
	
	.db 8,0,0,4,255,255,2,9,255,255,255,255,255,255,255,0	; cave
	.db 0,0	;properties
	
	.db 9,0,0,5,255,255,8,10,255,255,255,255,255,255,255,0	; door
	.db SCENERY_MASK+OPEN_MASK,DOOR_MASK	;properties
	
	.db 10,0,0,6,255,255,9,255,255,255,255,255,255,255,255,0	; storage room
	.db 0,LIT_MASK	;properties
	.db	255
	
