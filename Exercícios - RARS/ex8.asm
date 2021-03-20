#Exercício 8 - Ao ler um string do teclado com a chamada de sistema a7 = 8, a função retorna o string com o caracter 

#Faça uma função que recebe o endereço em memória de um string em a0 e substitui o caracter '\n' por zero, indicando o fim do string.


.data 
str:	.space 32
nl:	    .word 10

.text
	li a7, 8  #le a string
	la a0, str #define o endereço que começa a string
	li a1, 30 #define o numero de caracteres a serem lidos
	ecall
	
	lw  a1, nl #define o caractere do '\n'
	jal limpa #chama a função limpa
	
	li a7, 4 #printa a string
	la a0, str
	ecall
	
	li a7, 10 #encerra o programa
	ecall
	
######################## Escreva a função limpa a seguir #######################	
limpa:
    add s3, ra, zero #salva o endereço de retorno para a main
    add s1, a0, zero # salva o endereço inicial da string em s1 pra trabalhar com ele
    LOOP:
    	lbu t0, 0(s1) #armazena o byte de s1
    	
    	beq t0, a1, FIM # testa se t0 é '\n' e se for, vai para fim
    	addi s1, s1, 1 #incrementa o endereço
    	jal LOOP
FIM:
    add s2, s2, zero #inicia s2 e o define como '\0'
    sb s2, 0(s1) # salva o '\0' no endereço do '\n'
    jalr s3 #retorna para a main pelo endereço salvo 
    
