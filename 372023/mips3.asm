	.data
	
	.text
main:
	li $s0, 1
	
	li $v0, 5
	syscall
	move $a0, $v0
	
	jal factorial
	
	li $v0, 1
	syscall
	
	li $v0, 10 
	syscall

factorial:	#simpler solution
	beq $s0, $a0, end
	
	subi $sp, $sp, 8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	
	subi $a0, $a0, 1
	jal factorial
	
	lw $t0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	mul $a0, $a0, $t0
end:	
	jr $ra
