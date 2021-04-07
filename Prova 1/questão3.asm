#Faça uma função que recebe o endereço em memória de um string em a0, conta o número de
#dígitos presentes no string e retorna esse valor em a0.
#Escreva apenas a função. A entrada e saída é feita no cabeçalho da resposta.

#Encerre o programa com a chamada do sistema.

#Parâmetros da função:

#a0 : endereço do primeiro caracter do string.

#Valor de retorno:

#a0: número de dígitos presentes no string.

.data 
str:	.space 32
nl:	    .word 10

.text
	li a7, 8
	la a0, str
	li a1, 32
	ecall
	
	jal digitos
	
	li a7, 1
	ecall
	
	li a7, 10
	ecall
	
	
digitos:
	li t0, 48
	li t1, 57
	lw a3, nl
	add t3, ra, zero
	jal loop 

loop: 	
	lb a2, (a0)
	beq a2, a3, fim
	bgt a2, t1, no
	bge a2, t0, aumenta
	addi a0, a0, 1
	j loop
aumenta: 
	addi a0, a0, 1
	addi t2, t2, 1
	j loop
no: 
	addi a0, a0, 1
	j loop
fim: 
	add a0, t2, zero
	jr t3