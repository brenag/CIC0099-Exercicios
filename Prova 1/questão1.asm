#Escreva uma função que lê um float do teclado e extrai o valor do campo 

#de sinal do número, imprimindo-o na tela. Utilizar a instrução fmv.x.s para 

#transferir o float lido do teclado no registrador fa0 para um registrador do RARS.

#Encerre o programa com a chamada do sistema.

li a7, 6
ecall 
fmv.x.s s0, fa0
bgez s0, positivo
addi a0, zero, 1 
jal fim 
positivo: 
	add a0, zero, zero
	jal fim  
fim:
	li a7, 1
	ecall 
	li a7, 10
	ecall
