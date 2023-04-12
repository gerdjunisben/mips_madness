	.data
nl:	.asciiz "\n"
	.text
main:	
	li $v0, 42
	li $a1, 91
	syscall
	addi $t0, $a0, 10
	li $s0, 0 #max
	move $s1, $t0 #min
	li $s2, 0 #average
	li $s3, 1 #counter
	li $s4, 20 #maxCount
	
	
loop:	
	add $s2, $s2, $t0
	slt $s5, $s0, $t0 
	beq $s5, $zero, noNewMax
	move $s0, $t0
noNewMax:
	slt $s5, $t0, $s1 
	beq $s5, $zero, noNewMin
	move $s1, $t0
noNewMin:
	slt $s5, $s4, $s3 
	syscall
	addi $t0, $a0, 10
	addi $s3, $s3, 1
	beq $s5, $zero, loop
end:
	li $v0, 1
	move $a0, $s0
	syscall
	
	la $a0,nl
	li $v0, 4
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	la $a0,nl
	li $v0, 4
	syscall
	
	li $v0, 1
	div $s2, $s4
	mflo $a0
	syscall
	
	
	li $v0, 10
	syscall