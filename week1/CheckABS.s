.text
.global CheckABS
.type CheckABS, "function"

CheckABS: MOV	W11, 0 
LOOP: 	  CMP 	W1, 0 
	  B.EQ 	END
	  LDR 	W9, [X2] 
	  CMP 	W9, 0
	  B.LT 	NEGATIVE
	  CMP 	W9, W0
	  B.GT 	GREATER
	  SUB 	W1, W1, 1 
	  ADD 	X2, X2, 4
	  B 	LOOP
NEGATIVE: SUB 	W9, WZR, W9 
	  B.GT 	GREATER
	  SUB 	W1, W1, 1
	  ADD 	X2, X2, 4
	  B 	LOOP
GREATER:  MOV 	W9, 0
	  STR 	W9, [X2]
	  ADD 	X2, X2, 4 
	  SUB 	W1, W1, 1 
	  ADD 	W11, W11, 1 
	  B   	LOOP
END: 	  MOV 	W0, W11
	  RET
