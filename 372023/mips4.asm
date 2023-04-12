	.data
msg1:	.asciiz	"Enter lower bound then upper bound"
	.text
main:
	li $v0,4
	la $a0, msg1
	syscall
	
	li $v0,5 
	syscall
	move $a0, $v0
	
	li $v0,5
	syscall
	move $a1, $v0
	
	jal funct1
	
	li $v0, 10
	syscall
funct1:	
	subi $sp, $sp, 4
	sw $ra, 0($sp)

	li $v0, 42
	slt $t0, $a0, $zero  #lower<zero = 1
	bne $t0, $zero, negative
	sub $a1, $a1, $a0
	addi $a1, $a1, 1
	move $t0, $a0
	syscall
	sub  $a0, $a0, $t0
	j bend
negative:
	abs $a0, $a0
	mul $a0, $a0, 2
	add $a1, $a1, $a0
	addi $a1, $a1, 1
	move $t0, $a0
	syscall
	add $a0, $a0, $t0
bend:
	
	
	jal funct2
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
funct2:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	li $v0 1
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	