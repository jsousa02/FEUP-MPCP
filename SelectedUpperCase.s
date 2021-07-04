.text
.global SelectedUpperCase
.type SelectedUpperCase, "function"

SelectedUpperCase:	MOV 	W9, 0 
OUTER:			LDRB 	W10, [X0] 
			CBZ 	W10, END 
			ADD 	X0, X0, 1 
			MOV 	X13, X1 

INNER:			LDRB 	W12, [X13] 
			CBZ 	W12, OUTER 
			CMP 	W10, W12 ª
			B.EQ 	SWITCH
			ADD 	X13, X13, 1
			B 	INNER

SWITCH:			SUB 	W12, W12, 32 
			STRB	W12, [X13] 
			ADD 	X13, X13, 1 
			ADD 	W9, W9, 1 
			B 	INNER

END: 			MOV 	W0, W9
			RET
