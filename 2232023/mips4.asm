	.data
	
	.text
main:
	li $v0, 5
	syscall
	move $t0, $v0
	#given a number find it's power of two
	
	#$s1 * 2 repeat until it is greater than $t0
	li $s0, 0 #counter
	li $s1, 1 #num
loop:	
	beq $s1, $t0, goodending
	slt $s2, $s1, $t0
	beq $s2, $0, end
	addi $s0, $s0, 1
	sll $s1, $s1, 1
	
	j loop
goodending:
	li $v0, 1
	move $a0, $s0
	syscall
	
end:
	li $v0, 10
	syscall