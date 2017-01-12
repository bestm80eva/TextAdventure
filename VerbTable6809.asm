;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; VerbTable6809.asm 
; Machine Generated Verb Table
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

n_verb_id equ 0
s_verb_id equ 1
e_verb_id equ 2
w_verb_id equ 3
ne_verb_id equ 4
se_verb_id equ 5
sw_verb_id equ 6
nw_verb_id equ 7
up_verb_id equ 8
down_verb_id equ 9
enter_verb_id equ 10
out_verb_id equ 11
get_verb_id equ 12
inventory_verb_id equ 13
drop_verb_id equ 14
look_verb_id equ 15
examine_verb_id equ 16
look_in_verb_id equ 17
open_verb_id equ 18
close_verb_id equ 19
eat_verb_id equ 20
drink_verb_id equ 21
put_verb_id equ 22
quit_verb_id equ 23
smell_verb_id equ 24
listen_verb_id equ 25
wear_verb_id equ 26
yell_verb_id equ 27
jump_verb_id equ 28
pick_verb_id equ 29
burn_verb_id equ 30


verb_table
	.db 0
	.db 1
	.strz "N"
	.db 0
	.db 8
	.strz "GO NORTH"
	.db 0
	.db 5
	.strz "NORTH"
	.db 1
	.db 1
	.strz "S"
	.db 1
	.db 8
	.strz "GO SOUTH"
	.db 1
	.db 5
	.strz "SOUTH"
	.db 2
	.db 1
	.strz "E"
	.db 2
	.db 7
	.strz "GO EAST"
	.db 2
	.db 4
	.strz "EAST"
	.db 3
	.db 1
	.strz "W"
	.db 3
	.db 7
	.strz "GO WEST"
	.db 3
	.db 4
	.strz "WEST"
	.db 4
	.db 2
	.strz "NE"
	.db 4
	.db 12
	.strz "GO NORTHEAST"
	.db 4
	.db 9
	.strz "NORTHEAST"
	.db 5
	.db 2
	.strz "SE"
	.db 5
	.db 12
	.strz "GO SOUTHEAST"
	.db 5
	.db 9
	.strz "SOUTHEAST"
	.db 6
	.db 2
	.strz "SW"
	.db 6
	.db 12
	.strz "GO SOUTHWEST"
	.db 6
	.db 9
	.strz "SOUTHWEST"
	.db 7
	.db 2
	.strz "NW"
	.db 7
	.db 12
	.strz "GO NORTHWEST"
	.db 7
	.db 9
	.strz "NORTHWEST"
	.db 8
	.db 2
	.strz "UP"
	.db 8
	.db 5
	.strz "GO UP"
	.db 8
	.db 1
	.strz "U"
	.db 9
	.db 4
	.strz "DOWN"
	.db 9
	.db 7
	.strz "GO DOWN"
	.db 9
	.db 1
	.strz "D"
	.db 10
	.db 5
	.strz "ENTER"
	.db 10
	.db 5
	.strz "GO IN"
	.db 10
	.db 7
	.strz "GO INTO"
	.db 10
	.db 9
	.strz "GO INSIDE"
	.db 11
	.db 3
	.strz "OUT"
	.db 12
	.db 3
	.strz "GET"
	.db 12
	.db 4
	.strz "TAKE"
	.db 12
	.db 4
	.strz "GRAB"
	.db 12
	.db 7
	.strz "PICK UP"
	.db 13
	.db 9
	.strz "INVENTORY"
	.db 13
	.db 1
	.strz "I"
	.db 14
	.db 4
	.strz "DROP"
	.db 15
	.db 4
	.strz "LOOK"
	.db 15
	.db 1
	.strz "L"
	.db 16
	.db 7
	.strz "EXAMINE"
	.db 16
	.db 1
	.strz "X"
	.db 16
	.db 7
	.strz "LOOK AT"
	.db 17
	.db 7
	.strz "LOOK IN"
	.db 17
	.db 7
	.strz "INSPECT"
	.db 17
	.db 6
	.strz "SEARCH"
	.db 18
	.db 4
	.strz "OPEN"
	.db 19
	.db 5
	.strz "CLOSE"
	.db 19
	.db 4
	.strz "SHUT"
	.db 20
	.db 3
	.strz "EAT"
	.db 21
	.db 5
	.strz "DRINK"
	.db 22
	.db 3
	.strz "PUT"
	.db 22
	.db 5
	.strz "PLACE"
	.db 23
	.db 4
	.strz "QUIT"
	.db 24
	.db 5
	.strz "SMELL"
	.db 24
	.db 5
	.strz "SNIFF"
	.db 25
	.db 6
	.strz "LISTEN"
	.db 26
	.db 4
	.strz "WEAR"
	.db 27
	.db 4
	.strz "YELL"
	.db 27
	.db 5
	.strz "SHOUT"
	.db 27
	.db 6
	.strz "SCREAM"
	.db 28
	.db 4
	.strz "JUMP"
	.db 29
	.db 4
	.strz "PICK"
	.db 30
	.db 4
	.strz "BURN"
	.db 0,0
