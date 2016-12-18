;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;verbs.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;verb table
;needs to have two zeros to mark end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
verb_table
	.db 0	;id
	.db 3	;len
	.strz "GET"
	.db 1
	.db 1 
	.strz "L"
	.db 1 
	.db 4 
	.strz "LOOK"
	.db 2
	.db 1
	.strz "I"
	.db 2
	.db 9
	.strz "INVENTORY"
	.db 3
	.db 1
	.strz "N"
	.db 3
	.db 5
	.strz "NORTH"
	.db 3
	.db 8
	.strz "GO NORTH"	
	.db 4
	.db 1
	.strz "S"
	.db 4
	.db 5
	.strz "SOUTH"
	.db 4
	.db 8
	.strz "GO SOUTH"	
	.db 5
	.db 1	
	.strz "E"
	.db 5
	.db 4
	.strz "EAST"
	.db 5
	.db 7
	.strz "GO EAST"	
	.db 6
	.db 1	
	.strz "W"
	.db 6
	.db 4
	.strz "WEST"
	.db 6
	.db 7
	.strz "GO WEST"	
	.db 8
	.db 2	
	.strz "NE"
	.db 8
	.db 9
	.strz "NORTHEAST"
	.db 8
	.db 12
	.strz "GO NORTHEAST"	
	.db 9
	.db 2	
	.strz "SE"
	.db 9
	.db 9
	.strz "SOUTHEAST"
	.db 9
	.db 12
	.strz "GO SOUTHEAST"	
	.db 10
	.db 2
	.strz "SW"
	.db 10
	.db 9
	.strz "SOUTHWEST"
	.db 10
	.db 11
	.strz "GO SOUTWEST"	
	.db 11
	.db 2
	.strz "NW"
	.db 11
	.db 9
	.strz "NORTHWEST"
	.db 11
	.db 12
	.strz "GO NORTHWEST"	
	.db 12
	.db 1
	.strz "U"
	.db 12
	.db 2
	.strz "UP"
	.db 12
	.db 5
	.strz "GO UP"	
	.db 13
	.db 1
	.strz "D"
	.db 13
	.db 4
	.strz "DOWN"
	.db 13
	.db 7
	.strz "GO DOWN"	
	.db 14
	.db 3
	.strz "OUT"	
	.db 15
	.db 4
	.strz "DROP"
	.db 16
	.db 1
	.strz "X"
	.db 16
	.db 7
	.strz "EXAMINE"	
	.db 16
	.db 7
	.strz "LOOK AT"
	.db 17
	.db 3
	.strz "PUT"
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
	.db 5
	.strz "smell"
	.db 20
	.db 5
	.strz "sniff"	
	.db 21
	.db 21
	.strz "listen"
	.db 0 ;two zeros at end
	.db 0
