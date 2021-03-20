#Exercício 6 - Ler um inteiro do teclado e imprimir o número de bits em 1 em sua representação binária. 

#Encerrar o programa com a chamada do sistema.

li a7, 5 # a7 = 5 
ecall
addi t0, t0, 1 #inicia a mÃ¡scara
addi s1, s1, 1
addi s2, s2, 32

LOOP: and t1, t0, a0
    bgtu t1, zero, UM # se t0 >zero vai para a funÃ§Ã£o que incrementa o Ã­ndice
    beq s2, s1, FIM # if t0 =s t1 then target
    slli t0, t0, 1 #shifta a mÃ¡scara 1 bit pra esquerda
    addi s1, s1, 1 #incrementa o contador
    jal LOOP
    
UM: addi t2, t2, 1 #incrementa o contador de Bits 1
    beq s2, s1, FIM # if t0 =s t1 then target
    slli t0, t0, 1 #shifta a mÃ¡scara 1 bit pra esquerda
    addi s1, s1, 1 #incrementa o contador
    jal LOOP

FIM:add a0, t2, zero #passa o conteÃºdo de t2 pra a0
    li a7, 1  
    ecall
    li a7, 10  
    ecall