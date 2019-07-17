.data 
array: .word 7,7,7,7,7 #array contents 
size: .word 5 #size of array 
secondmin: .word 0
result: .asciiz "no second smallets"
.globl exit
.text 

secondMax:
la $t0, array #array address
la $t1, size #size
lw $s5, 0($t0)     # set min, $s5 to array[0]

addi $t0, $t0, 4 #Increment to next element in array
addi $t1, $t1, -1 #Decrement the size 
loop1:
lw $t4, ($t0) #array[n]
bge $t4,$s5,loop2 #if t4 is greater than or equal to s5(min)
lw $t4, secondmin #print the second small 
li $v0, 1
syscall  
li $v0, 10

loop2:
add $t1, $t1, -1 
addi $t0, $t0, 4 
beqz $t1,exit #if size is not equal to 0 
exit:
la $a0, result
addi $v0, $0, 4
syscall
 

