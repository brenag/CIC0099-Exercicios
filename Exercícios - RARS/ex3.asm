#Exercício 3 - Ler uma sequência de inteiros do teclado, somá-los e imprimir o resultado. 

#O primeiro número lido indica o número de inteiros que devem ser lidos e somados.

#Termine o programa com a chamada do sistema.

li a7, 5
ecall

add t0, a0, zero 

#addi t1, t1, 0

OPERADOR:beq t0, t1, FIM # if t0 == t1 then target

li a7, 5 #le o numero
ecall

add t2, t2, a0 #soma o número lido no temporário

addi t1, t1, 1
jal OPERADOR  # jump to OPERADOR and save position to ra


FIM:add a0, t2, zero # passa a soma final para o registrador definitivo

li a7, 1 #imprime a soma
ecall

li a7, 10 #encerra o programa
ecall
