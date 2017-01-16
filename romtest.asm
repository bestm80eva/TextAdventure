;romtest.asm
;test program to see if coco ROM routines
;can be used to read/write text
; answer is yes!
DEVNUM equ 0x006f	; 	addr of dev
SYSPRINT equ $b99c	;	Out String: Prints ASCIIZ string ptd to by X to DEVNUM
PRINTCR equ $b958 ; print cr/nl
GETLINE equ $a390 ;
KBBUF	equ $02dd	; keyboard buffer 
	org 0xE00
start

;	include verb_ids.asm
	include objdefs.asm
main
	ldu #0x7FFF ; setup user stack
	clr DEVNUM 	; set device to screen (not needed? )
	tfr u,x 
	stx sys_stack_save
	ldx #welcome
	jsr PRINT
	jsr PRINTCR
	jsr look_sub 
	jsr draw_bar
@lp	jsr GETLINE		; get user command
	jsr parse
	jsr PRINTCR
	jsr encode_sentence
	jsr draw_bar
	bra @lp
@quit lds sys_stack_save
@x	rts

	include parser.asm	
	include random.asm
	include mod.asm
	include routines.asm
	include preactions.asm
	include printrets.asm
	include look.asm
	include inventory.asm
	include print.asm
	include put.asm
	include open.asm
	include light.asm
	include locks.asm
	include smell.asm
 	include listen.asm
	include enter_sub.asm
	include title_bar.asm
	;include instead.asm
	;include before_rules.asm
	;include after_rules.asm
	;include dictionary.asm
	include Dictionary6809.asm
	include ObjectTable6809.asm
	include ObjectWordTable6809.asm
	include DescriptionTable6809.asm
	include NogoTable6809.asm
	include sentence_table.asm
	include verbTable6809.asm
	include PrepTable6809.asm
	include checks.asm
	include before_table_6809.asm
	include instead_table_6809.asm
	;include postactions_table.asm
	include after_table_6809.asm
	include events.asm
	include events6809.asm ; machine generated
	include CheckRules6809.asm
	include vars.asm
	

;;;;;;;;;;;;;;;;;;;;;;;
;article table
;1st byte is length number
;;;;;;;;;;;;;;;;;;;;;;;
article_table
	.db 3
	.strz "THE"
	.db 1
	.strz "A"
	.db 2
	.strz "AN"
	.db 0

word1 rmb 32
word2 rmb 32
word3 rmb 32
word4 rmb 32
word5 rmb 32
word6 rmb 32
word7 rmb 32
word8 rmb 32
hit_end .db 0
word_count .db 0
word_start .dw 0x0000
word_end .dw 0x0000
first_char .db 0
last_char .db 0
table_index .db 0
user_stack_save .dw 0x0000
sys_stack_save .dw 0x0000
welcome .strz "WELCOME TO TEST-PROJECT LAND. 2016, EVAN C. WRIGHT"

	end start
