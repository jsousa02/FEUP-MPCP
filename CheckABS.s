.text
.global CheckABS
.type CheckABS, "function"

CheckABS: MOV W11, 0 // CONTADOR
CICLO: 	  CMP W1, 0 // TAMANHO DA SEQUENCIA
		  B.EQ FIM
		  LDR W9, [X2] // ELEMENTO DO ARRAY
		  CMP W9, 0
		  B.LT NEGATIVO // SE FOR NEGATIVO, DESCOBRE-SE O SEU VALOR ABSOLUTO
		  CMP W9, W0
		  B.GT MAIOR
		  SUB W1, W1, 1 // CASO NAO SEJA MAIOR, AVANÇAR PARA O PROXIMO ELEMENTO
		  ADD X2, X2, 4
		  B CICLO
NEGATIVO: SUB W9, WZR, W9 // VALOR ABSOLUTO
		  CMP W9, W0 // COMPARAR O VALOR ABSOLUTO COM O VALOR DADO
		  B.GT MAIOR
		  SUB W1, W1, 1
		  ADD X2, X2, 4
		  B CICLO
MAIOR: 	  MOV W9, 0
		  STR W9, [X2]
	   	  ADD X2, X2, 4 // AVANÇAR PARA O PROXIMO ELEMENTO
	   	  SUB W1, W1, 1 // SUBTRAIR 1 AO TAMANHO DO ARRAY
	   	  ADD W11, W11, 1 // SOMAR 1 AO CONTADOR
	   	  B CICLO
FIM: 	  MOV W0, W11
	 	  ret
