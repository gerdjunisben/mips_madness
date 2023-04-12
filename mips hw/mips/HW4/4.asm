	.data
newLine:.asciiz "\n"
msg1:	.asciiz " - "
msg2:	.asciiz " = "
	.text
main:	li $a1, 901
	li $v0, 42
	syscall 
	addi $a0, $a0, 100
	
	
	li $v0, 1
	syscall
	
	
	li $v0, 34
	syscall
	
	li $v0, 35
	syscall
	
	move $t0, $a0
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	li $v0, 42
	syscall 
	addi $a0, $a0, 100
	
	li $v0, 1
	syscall
	
	
	li $v0, 34
	syscall
	
	li $v0, 35
	syscall
	
	move $t1, $a0
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	sub $t2, $t0,$t1
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0,msg1
	li $v0, 4
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	la $a0,msg2
	li $v0, 4
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	li $t1, 7
	div $t0, $t1
	
	
	#quotient
	li $v0, 1
	mflo $a0
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	
	#remainder
	li $v0, 1
	mfhi $a0
	syscall
	
	
	
	li $v0, 10
	syscall
	