	.data
msg:	.asciiz	" is the random number"
	.text
main:
	jal funct1
	
	li $v0, 10
	syscall
funct1:
	li $v0, 42
	li $a1, 10
	syscall
	
	addi $sp, $sp, -4  	#allocates a byte (you may allocate more if you want to store more registries)
	sw $ra, 0($sp)     	#saves the return address in the byte
	jal funct2	    	#jump and link
	lw $ra, 0($sp)		#loads return address back from memory
	addi $sp, $sp, 4	#unallocates the byte
		
	jr $ra
funct2:
	li $v0, 1
	syscall
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal funct3
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
funct3:
	li $v0, 4
	la $a0, msg
	syscall
	
	jr $ra
	