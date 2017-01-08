;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OBJECT WORD TABLE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

obj_word_table
	.db 0,0,255,255   ;   OFFSCREEN
	.db 1,1,255,255   ;   PLAYER
	.db 2,2,3,255   ;   FOREST PATH
	.db 3,4,5,255   ;   GUARD HUT
	.db 4,6,5,255   ;   INSIDE HUT
	.db 5,7,8,255   ;   TUNNEL ENTRACE
	.db 6,9,10,11   ;   SOUTHEAST OF HILLSIDE
	.db 7,12,10,11   ;   SOUTHWEST OF HILLSIDE
	.db 8,13,11,255   ;   EASTERN HILLSIDE
	.db 9,14,10,15   ;   TOP OF DEBRIS
	.db 10,16,7,255   ;   EAST TUNNEL
	.db 11,7,17,255   ;   TUNNEL JUNCTION
	.db 12,18,19,255   ;   SMALL OFFICE
	.db 13,20,255,255   ;   BATHROOM
	.db 14,21,255,255   ;   DOOR
	.db 15,22,23,255   ;   STORAGE ROOM
	.db 16,24,25,7   ;   DOWNWARD SLOPING TUNNEL
	.db 17,26,27,17   ;   FOUR WAY JUNCTION
	.db 18,28,7,255   ;   SOUTH TUNNEL
	.db 19,29,30,255   ;   VAST WORKHALL
	.db 20,31,23,255   ;   PUMP ROOM
	.db 21,32,7,255   ;   FLOODED TUNNEL
	.db 22,22,33,255   ;   STORAGE CHAMBER
	.db 23,34,10,35   ;   BASE OF SHAFT
	.db 24,36,37,255   ;   ON LADDER
	.db 25,14,10,35   ;   TOP OF SHAFT
	.db 26,14,10,38   ;   TOP OF HILL
	.db 27,39,10,40   ;   PILE OF LEAVES
	.db 28,41,255,255   ;   TABLE
	.db 29,42,255,255   ;   DOCUMENTS
	.db 30,43,255,255   ;   PAPERCLIP
	.db 31,46,255,255   ;   LOCK
	.db 32,47,255,255   ;   FLASHLIGHT
	.db 33,50,51,255   ;   WHITE CUBE
	.db 34,53,54,255   ;   FILTHY TOILET
	.db 35,56,57,255   ;   CHARRED PAPERS
	.db 36,59,60,255   ;   CIGARETTE LIGHTER
	.db 37,61,255,255   ;   WATER
	.db 38,62,63,255   ;   STEEL HELMET
	.db 39,64,255,255   ;   MACHINE
	.db 40,65,255,255   ;   BATTERY
	.db 30,44,45,255   ;   synonyms for PAPERCLIP
	.db 32,48,49,255   ;   synonyms for FLASHLIGHT
	.db 33,52,255,255   ;   synonyms for WHITE CUBE
	.db 34,55,255,255   ;   synonyms for FILTHY TOILET
	.db 35,58,255,255   ;   synonyms for CHARRED PAPERS
	.db 255
obj_table_size	.db 41
