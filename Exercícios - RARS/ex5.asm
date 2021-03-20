#Exercício 5 - Transformar os caracteres minúsculos de uma frase em maiúsculos.

#Procedimento:

#1. Ler uma frase do teclado (chamada do sistema). Não usar caracteres especiais ou acentuados e restringir-se a um máximo de 30 caracteres.

#2. Percorrer a frase e transformar as letras minúsculas em maiúsculas.

#Não altera letras maiúsculas, dígitos ou caracteres especiais.

#3. Imprimir a frase resultante na tela. 

#Termine o programa com a chamada do sistema.

.data

rsp:  .space 30
size: .word 30

.text

li a7, 8 #le a string
la a0, rsp #le o endereço inicial da string 
la t0, rsp #salva o endereço inicial para ser alterado
lw a1, size #le o tamanho da string
ecall
add t2, t2, zero #inicia o contador de caracteres t2 em 0

li t1, 97 #salva o 97, ASCII de a minúsculo para verificar se é maiúsculo
li s1, 123# s1 =123


TESTE:
    beq t2, a1, FIM # if t2 == a1 then target
    lbu s2, 0(t0) #loada o valor no endereço    
    bge s2, t1, TESTE97 # se t0 for maior que 97 (minúsculo), vai para a função que torna ele minúsculo
    addi t0, t0, 1 #Incrementa o endereço
    addi t2, t2, 1 #incrementa o contador
    jal TESTE  # jump to TESTE and save position to ra
    
TESTE97:
        blt s2, s1, MAIUSCULO # if t0 < s1 then target
        addi t0, t0, 1 #Incrementa o endereço
        addi t2, t2, 1 #incrementa o contador
        jal TESTE  # jump to T and save position to ra
        
        
MAIUSCULO:
    lb s0, 0(t0) #carrega o byte do endereço indicado
    addi s0, s0, -32 #para mudar o ASCII de minúsculo para maiúsculo, subtrai 32
    sb s0, 0(t0) #armazena o caractere alterado
    addi t0, t0, 1 #incrementa o endereço
    addi t2, t2, 1 #incrementa o contador
    jal TESTE  # jump to TESTES and save position to ra

FIM:
    li a7, 4 #printa a string
    ecall
    li a7, 10 
    ecall
