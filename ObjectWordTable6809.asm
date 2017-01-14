;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OBJECT WORD TABLE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

obj_word_table
	.db 0,0,255,255   ;   OFFSCREEN
	.db 1,1,255,255   ;   PLAYER
	.db 2,4,5,255   ;   FOREST PATH
	.db 3,6,7,255   ;   GUARD HUT
	.db 4,8,7,255   ;   INSIDE HUT
	.db 5,9,10,255   ;   TUNNEL ENTRACE
	.db 6,11,12,13   ;   SOUTHEAST OF HILLSIDE
	.db 7,14,12,13   ;   SOUTHWEST OF HILLSIDE
	.db 8,15,13,255   ;   EASTERN HILLSIDE
	.db 9,16,12,17   ;   TOP OF DEBRIS
	.db 10,18,9,255   ;   EAST TUNNEL
	.db 11,9,19,255   ;   TUNNEL JUNCTION
	.db 12,20,21,255   ;   SMALL OFFICE
	.db 13,22,255,255   ;   BATHROOM
	.db 14,23,255,255   ;   DOOR
	.db 15,24,25,255   ;   STORAGE ROOM
	.db 16,26,27,9   ;   DOWNWARD SLOPING TUNNEL
	.db 17,28,29,19   ;   FOUR WAY JUNCTION
	.db 18,30,9,255   ;   SOUTH TUNNEL
	.db 19,31,32,255   ;   VAST WORKHALL
	.db 20,33,25,255   ;   PUMP ROOM
	.db 21,34,9,255   ;   FLOODED TUNNEL
	.db 22,24,35,255   ;   STORAGE CHAMBER
	.db 23,36,12,37   ;   BASE OF SHAFT
	.db 24,38,39,255   ;   ON LADDER
	.db 25,16,12,37   ;   TOP OF SHAFT
	.db 26,16,12,40   ;   TOP OF HILL
	.db 27,41,12,42   ;   PILE OF LEAVES
	.db 28,43,255,255   ;   TABLE
	.db 29,44,255,255   ;   DOCUMENTS
	.db 30,45,255,255   ;   PAPERCLIP
	.db 31,48,255,255   ;   LOCK
	.db 32,49,255,255   ;   FLASHLIGHT
	.db 33,52,53,255   ;   WHITE CUBE
	.db 34,55,56,255   ;   FILTHY TOILET
	.db 35,58,59,255   ;   CHARRED PAPERS
	.db 36,61,62,255   ;   CIGARETTE LIGHTER
	.db 37,63,255,255   ;   WATER
	.db 38,64,65,255   ;   STEEL HELMET
	.db 39,66,255,255   ;   MACHINE
	.db 40,67,255,255   ;   BATTERY
	.db 41,68,255,255   ;   CUPOLA
	.db 42,69,255,255   ;   WRENCH
	.db 43,70,255,255   ;   NOSE
	.db 1,2,3,255   ;   synonyms for PLAYER
	.db 30,46,47,255   ;   synonyms for PAPERCLIP
	.db 32,50,51,255   ;   synonyms for FLASHLIGHT
	.db 33,54,255,255   ;   synonyms for WHITE CUBE
	.db 34,57,255,255   ;   synonyms for FILTHY TOILET
	.db 35,60,255,255   ;   synonyms for CHARRED PAPERS
	.db 255
obj_table_size	.db 44
