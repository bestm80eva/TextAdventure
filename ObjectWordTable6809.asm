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
	.db 22,35,36,255   ;   LARGE CHAMBER
	.db 23,37,12,38   ;   BASE OF SHAFT
	.db 24,39,40,255   ;   ON LADDER
	.db 25,16,12,38   ;   TOP OF SHAFT
	.db 26,16,12,41   ;   TOP OF HILL
	.db 27,42,12,43   ;   PILE OF LEAVES
	.db 28,44,255,255   ;   TABLE
	.db 29,45,46,255   ;   RUBBER STAMP
	.db 30,47,255,255   ;   PAPERCLIP
	.db 31,50,255,255   ;   LOCK
	.db 32,51,255,255   ;   FLASHLIGHT
	.db 33,54,55,255   ;   WHITE CUBE
	.db 34,57,58,255   ;   FILTHY TOILET
	.db 35,60,61,255   ;   CHARRED PAPERS
	.db 36,63,64,255   ;   CIGARETTE LIGHTER
	.db 37,65,255,255   ;   WATER
	.db 38,66,67,255   ;   STEEL HELMET
	.db 39,68,255,255   ;   MACHINE
	.db 40,69,255,255   ;   BATTERY
	.db 41,70,255,255   ;   CUPOLA
	.db 42,71,255,255   ;   WRENCH
	.db 43,72,255,255   ;   NOSE
	.db 44,73,255,255   ;   SUN
	.db 45,74,75,255   ;   VOLT METER
	.db 46,77,255,255   ;   ELECTROLYTE
	.db 47,78,79,255   ;   WOODEN CRATE
	.db 48,80,81,255   ;   SPLINTERED WOOD
	.db 49,82,83,255   ;   GOLD BARS
	.db 50,84,255,255   ;   CREVICE
	.db 51,86,255,255   ;   BOLTS
	.db 52,17,255,255   ;   DEBRIS
	.db 53,4,255,255   ;   FOREST
	.db 1,2,3,255   ;   synonyms for PLAYER
	.db 30,48,49,255   ;   synonyms for PAPERCLIP
	.db 32,52,53,255   ;   synonyms for FLASHLIGHT
	.db 33,56,255,255   ;   synonyms for WHITE CUBE
	.db 34,59,255,255   ;   synonyms for FILTHY TOILET
	.db 35,62,255,255   ;   synonyms for CHARRED PAPERS
	.db 45,76,255,255   ;   synonyms for VOLT METER
	.db 50,85,255,255   ;   synonyms for CREVICE
	.db 52,87,17,42   ;   synonyms for DEBRIS
	.db 53,88,89,255   ;   synonyms for FOREST
	.db 255
obj_table_size	.db 54
