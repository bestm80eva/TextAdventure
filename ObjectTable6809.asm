;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OBJECT_TABLE
; FORMAT: ID,HOLDER,INITIAL DESC,DESC,N,S,E,W,NE,SE,SW,NW,UP,DOWN,OUT,MASS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

obj_table
	.db 0,0,2,1,1,2,3,4,5,6,7,8,9,10,255,12,13   ; OFFSCREEN
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 1,2,255,3,0,0,0,0,0,0,0,0,0,0,255,0,0   ; PLAYER
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 2,0,255,4,5,254,254,254,254,254,254,254,255,255,255,255,0   ; FOREST PATH
	.db 0    ;  flags 1 - 8
	.db EMITTING_LIGHT_MASK ; flags 9-16
	.db 3,2,6,5,255,255,255,2,255,255,255,255,255,255,4,2,0   ; GUARD HUT
	.db 0    ;  flags 1 - 8
	.db EMITTING_LIGHT_MASK ; flags 9-16
	.db 4,0,255,7,253,253,253,2,253,253,253,253,253,255,255,2,0   ; INSIDE HUT
	.db 0    ;  flags 1 - 8
	.db EMITTING_LIGHT_MASK ; flags 9-16
	.db 5,0,255,8,252,2,6,7,251,250,250,251,251,255,255,255,0   ; TUNNEL ENTRACE
	.db 0    ;  flags 1 - 8
	.db EMITTING_LIGHT_MASK ; flags 9-16
	.db 6,0,255,9,251,255,249,5,8,249,249,251,251,255,255,255,0   ; SOUTHEAST OF HILLSIDE
	.db 0    ;  flags 1 - 8
	.db EMITTING_LIGHT_MASK ; flags 9-16
	.db 7,0,255,10,248,249,5,249,249,249,249,251,251,255,255,255,0   ; SOUTHWEST OF HILLSIDE
	.db 0    ;  flags 1 - 8
	.db EMITTING_LIGHT_MASK ; flags 9-16
	.db 8,0,255,11,248,255,249,9,249,249,6,251,251,255,255,255,0   ; EASTERN HILLSIDE
	.db 0    ;  flags 1 - 8
	.db EMITTING_LIGHT_MASK ; flags 9-16
	.db 9,0,255,12,255,255,8,10,255,255,6,255,247,8,255,8,0   ; TOP OF DEBRIS
	.db 0    ;  flags 1 - 8
	.db EMITTING_LIGHT_MASK ; flags 9-16
	.db 10,0,255,13,255,255,245,11,255,255,255,255,246,255,255,255,0   ; EAST TUNNEL
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 11,0,255,14,255,12,10,17,255,255,255,255,255,255,255,255,0   ; TUNNEL JUNCTION
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 12,0,255,15,11,13,14,255,255,255,255,255,255,255,255,255,0   ; SMALL OFFICE
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 13,0,255,16,12,255,255,255,255,255,255,255,255,255,255,255,0   ; BATHROOM
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 14,12,255,17,12,255,15,12,255,255,255,255,255,255,255,255,0   ; DOOR
	.db SCENERY_MASK|OPENABLE_MASK|LOCKABLE_MASK ; flags 1-8
	.db DOOR_MASK ; flags 9-16
	.db 15,0,255,18,255,255,255,12,255,255,255,255,255,255,255,255,0   ; STORAGE ROOM
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 16,0,255,19,20,255,17,21,255,255,255,255,255,255,255,255,0   ; DOWNWARD SLOPING TUNNEL
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 17,0,255,20,19,18,11,16,255,255,255,255,255,255,255,255,0   ; FOUR WAY JUNCTION
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 18,0,255,21,17,244,255,255,255,255,255,255,255,255,255,255,0   ; SOUTH TUNNEL
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 19,0,255,22,255,17,255,255,255,255,255,255,255,255,255,255,0   ; VAST WORKHALL
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 20,0,255,23,255,16,255,255,255,255,255,255,255,255,255,255,0   ; PUMP ROOM
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 21,0,255,24,255,17,16,255,255,255,22,23,255,255,255,255,0   ; FLOODED TUNNEL
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 22,0,255,25,255,255,255,255,21,255,255,255,255,255,255,255,0   ; STORAGE CHAMBER
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 23,0,255,26,243,243,243,243,255,21,255,255,24,255,255,255,0   ; BASE OF SHAFT
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 24,0,255,27,255,255,255,255,255,255,255,255,242,23,255,255,0   ; ON LADDER
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 25,0,255,28,255,255,255,255,255,255,255,255,241,23,255,26,0   ; TOP OF SHAFT
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 26,0,255,29,255,255,255,255,255,255,255,255,255,240,255,255,0   ; TOP OF HILL
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 27,10,30,0,255,255,255,255,255,255,255,255,255,240,255,255,0   ; LEAVES
	.db 0    ;  flags 1 - 8
	.db PORTABLE_MASK|FLAMMABLE_MASK|LIGHTABLE_MASK ; flags 9-16
	.db 28,12,31,0,255,255,255,255,255,255,255,255,255,240,255,255,0   ; TABLE
	.db SUPPORTER_MASK ; flags 1-8
	.db 0    ;  flags 9 - 16
	.db 29,12,33,32,255,255,255,255,255,255,255,255,255,255,255,255,0   ; DOCUMENTS
	.db 0    ;  flags 1 - 8
	.db PORTABLE_MASK ; flags 9-16
	.db 30,0,255,0,255,255,255,255,255,255,255,255,255,240,255,255,0   ; PAPERCLIP
	.db 0    ;  flags 1 - 8
	.db PORTABLE_MASK ; flags 9-16
	.db 31,12,255,34,255,255,255,255,255,255,255,255,255,240,255,255,0   ; LOCK
	.db SCENERY_MASK ; flags 1-8
	.db 0    ;  flags 9 - 16
	.db 32,4,36,35,255,255,255,255,255,255,255,255,255,240,255,255,0   ; FLASHLIGHT
	.db 0    ;  flags 1 - 8
	.db PORTABLE_MASK|LIGHTABLE_MASK|EMITTING_LIGHT_MASK ; flags 9-16
	.db 33,15,38,37,255,255,255,255,255,255,255,255,255,240,255,255,0   ; WHITE CUBE
	.db 0    ;  flags 1 - 8
	.db PORTABLE_MASK ; flags 9-16
	.db 34,13,40,39,255,255,255,255,255,255,255,255,255,240,255,255,0   ; FILTHY TOILET
	.db CONTAINER_MASK ; flags 1-8
	.db 0    ;  flags 9 - 16
	.db 35,34,255,41,255,255,255,255,255,255,255,255,255,240,255,255,0   ; CHARRED PAPERS
	.db 0    ;  flags 1 - 8
	.db PORTABLE_MASK ; flags 9-16
	.db 36,19,43,42,255,255,255,255,255,255,255,255,255,255,255,255,0   ; LIGHTER
	.db 0    ;  flags 1 - 8
	.db PORTABLE_MASK ; flags 9-16
	.db 37,21,44,0,255,255,255,255,255,255,255,255,255,255,255,255,0   ; WATER
	.db CONTAINER_MASK ; flags 1-8
	.db 0    ;  flags 9 - 16
	.db 38,18,46,45,255,255,255,255,255,255,255,255,255,255,255,255,0   ; HELMET
	.db CONTAINER_MASK ; flags 1-8
	.db PORTABLE_MASK ; flags 9-16
	.db 39,20,47,0,255,255,255,255,255,255,255,255,255,255,255,255,0   ; MACHINE
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 40,20,49,48,255,255,255,255,255,255,255,255,255,255,255,255,0   ; BATTERY
	.db 0    ;  flags 1 - 8
	.db 0    ;  flags 9 - 16
	.db 255
