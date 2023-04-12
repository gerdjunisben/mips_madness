	.data
var1:	.word	10
var2:	.word	20

 	.text
main:
	#Take input for var1 and var2
	la $a1, var1
	lw $a0, 0($a1)
	li $v0, 5
	syscall 
	
	
	
	move $t0, $a0
	
	la $a1, var2
	lw $a0, 0($a1)
	li $v0, 5
	syscall 
	
	move $t1, $a0
	#Swap
	
	la $a0, var2
	
	sw $t0, 0($a0)
	
	la $a0, var1
	
	sw $t1, 0($a0)
	
	
	
	
	li $v0, 10
	syscall 
