#Implementar de forma recursiva o código abaixo. A função deve 

#ler um número inteiro positivo do teclado e imprimir os valores 

#que atendem a condição de teste. Os números são impressos sem 

#separação e na mesma linha. 

#Encerre o programa com a chamada do sistema.

##void rec(int x) {
## if (x <= 0)
##    return;
##  if ((x & 5) == 5)
##    std::cout << x;
##  rec(x-1);
##}

.text 
	li a7, 5
	ecall

	jal rec

	li a7, 10
	ecall


rec:
li a1, 5
addi sp, sp, -4
sw ra, 0(sp)
ble a0, zero, retorna
andi t1, a0, 5
bne  t1, a1, n_print 
li a7, 1
ecall

n_print:
addi a0, a0, -1
jal rec

retorna:
 lw ra, 0(sp)
 addi sp, sp, 4
 ret

 
