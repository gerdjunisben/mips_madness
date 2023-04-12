	.data
evenmsg:.asciiz "number is even"
oddmsg: .asciiz	 "number is odd"
	.text
main:
	#generate random
	li $v0, 42
	la $a1, 21
	syscall
	
	jal funct1

	li $v0, 10
	syscall
	
funct1: #check number is even or odd, pass message address, take random number
	subi $sp, $sp, 4
	sw $ra, 0($sp)
		
	sll $a0, $a0, 31
	beq $a0, $zero, even
	la $a0, oddmsg
	j branchend
even:
	la $a0, evenmsg
branchend:
	
	jal funct2
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
funct2: #display message
	subi $sp, $sp, 4   #unneeded but good practice
	sw $ra, 0($sp)

	li $v0, 4
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra