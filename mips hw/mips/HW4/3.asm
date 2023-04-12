	.data
msg:	.asciiz "the random number is "
x:	.word	0
newLine:.asciiz "\n"
	.text
main:	#set upper bound to 201, range [0,201)
	li $a1, 201
	li $v0, 42
	syscall 
	#sub 100, new range [-100,101)
	subi $t0, $a0, 100
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	sw $t0, x

	#mult command
	li $t1, 3
	mult $t0, $t1
	
	
	li $v0, 1
	mflo $a0
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	#shift left 1 then add original effectively multiplying by 2 then adding 1
	sll $t2, $t0, 1
	add $t2, $t2, $t0
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	
	#literally adding 3 together :(
	add $t3, $t0, $t0
	add $t3, $t3, $t0
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	
	
	
	li $v0, 10
	syscall
	
	
	
	
