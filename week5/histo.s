.text
.global histo
.type histo, "function"

histo:	MOV 	W9, 16 
	MOV	W12, 0 
	MOV	X15, X1 
	MOV	X19, 0
	MOV 	X20, 0
	MOV	W14, 0

OUTER:	CMP	W12, 20
	B.GT	END
	UDIV	W10, W0, W9 
	MOV	X1, X15 

		
INNER:	CBZ	W10, SWITCH
	LDR	Q0,  [X1]
	DUP	V1.16B, W12 
	CMEQ	V2.16B, V0.16B, V1.16B 
	SADDLV	H13, V2.16B 
	SMOV	W13, V13.H[0]
	SUB	W13, WZR, W13 
	ADD	W14, W14, W13 
	SADDLV	H16, V0.16B 
	SMOV	W20, V16.H[0]
	ADD	W19, W19, W16 
	ADD	X1, X1, 16 
	SUB	W10, W10, 1
	B	INNER

SWITCH:	STR	X14, [X2], 1
	ADD	W12, W12, 1 
	MOV	W14, 0 
	MOV	W11, W19 
	MOV	W19, 0 
	B	OUTER

END:	UCVTF	S6, W0 
	UCVTF	S19, W11 
	FDIV	S0, S19, S6 
	RET
