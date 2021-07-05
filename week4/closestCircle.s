.data
.global min
min: .double 10000

.text
.global closestCircle
.type closestCircle, "function"

closestCircle:	MOV	W9, 2 
		MUL	W10, W0, W9 
		MOV 	W11, 3 
		MUL	W12, W2, W11 
		MOV	X6, X3 
		MOV	W17, W2

OUTER:		CBZ	W0, END
		LDR	S0, [X1], 4 
		LDR 	S1, [X1], 4 
		FCVT	D2, S0 
		FCVT	D3, S1 
		SUB	W0, W0, 1
		MOV	X3, X6 
		MOV	W14, 0 
		MOV	W2, W17
		MOV	W15, 0 
		LDR	D11, min

INNER:		CBZ	W2, SWITCH
		LDR	D4, [X3], 8 
		LDR	D5, [X3], 8 
		LDR	D6, [X3], 8 
		FSUB	D9, D2, D4
		FSUB	D10, D3, D5
		FMUL	D9, D9, D9
		FMUL	D10, D10, D10
		FADD	D10, D10, D9
		FSQRT 	D10, D10
		FSUB	D10, D10, D6 
		FCMP	D10, 0.0
		B.LE	INVALID
		FCMP	D10, D11
		B.LE	CHANGE_MIN
		SUB	W2, W2, 1
		ADD	W14, W14, 1
		B	INNER

CHANGE_MIN:	FMOV	D11, D10
		MOV	W13, W14 
		ADD	W14, W14, 1 
		SUB	W2, W2, 1
		B	INNER

INVALID:	SUB  	W2, W2, 1
		ADD	W14, W14, 1 
		ADD	W15, W15, 1 
		B	INNER

SWITCH:		CMP	W15, W17
		B.EQ	OUTER
		STR	W13, [X4], 4
		B 	OUTER

END:		RET
