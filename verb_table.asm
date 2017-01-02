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
	.db 0
	.db 4
	.strz "TAKE"
	.db 0
	.db 7
	.strz "PICK UP"
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
	.db 7
	.db 2	
	.strz "NE"
	.db 7
	.db 9
	.strz "NORTHEAST"
	.db 7
	.db 12
	.strz "GO NORTHEAST"	
	.db 8
	.db 2	
	.strz "SE"
	.db 8
	.db 9
	.strz "SOUTHEAST"
	.db 8
	.db 12
	.strz "GO SOUTHEAST"	
	.db 9
	.db 2
	.strz "SW"
	.db 9
	.db 9
	.strz "SOUTHWEST"
	.db 9
	.db 12
	.strz "GO SOUTHWEST"	
	.db 10
	.db 2
	.strz "NW"
	.db 10
	.db 9
	.strz "NORTHWEST"
	.db 10
	.db 12
	.strz "GO NORTHWEST"	
	.db 11
	.db 1
	.strz "U"
	.db 11
	.db 2
	.strz "UP"
	.db 11
	.db 5
	.strz "GO UP"	
	.db 12
	.db 1
	.strz "D"
	.db 12
	.db 4
	.strz "DOWN"
	.db 12
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
	.strz "SMELL"
	.db 20
	.db 5
	.strz "SNIFF"	
	.db 21
	.db 6
	.strz "LISTEN"
	.db 22 
	.db 4 
	.strz "QUIT"
	.db 22
	.db 1
	.strz "Q"
	.db 23
	.db 5
	.strz "ENTER"
	.db 23
	.db 5
	.strz "GO IN"
	.db 23
	.db 7
	.strz "GO INTO"	
	.db 24
	.db 4
	.strz "BURN"	
	.db 0 ;two zeros at end
	.db 0
