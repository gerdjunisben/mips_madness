	.data
arr:	.space	80
length:	.word	20
returnarr: .space 8
returnlength: .word 2
msg1:	.asciiz	"there are "
msg2:	.asciiz	" even numbers and "
msg3:	.asciiz	" odd numbers in the array."
	.text
main:
	la $s0, arr
	lw $s1, length
	
	li $t0, 0
	move $t1, $s0
	
loop:	slt $t2, $t0, $s1
	beq $t2, $zero, end
	
	li $a0, 10
	li $a1,100
	jal rand
	
	sw $v0, 0($t1)
	
	addi $t0, $t0,1
	addi $t1, $t1,4
	j loop
end:
	move $a0, $s0
	move $a1, $s1
	jal countevenodd
	move $t0, $v0
	
	li $v0,4
	la $a0, msg1
	syscall
	
	li $v0, 1
	lw $a0, 4($t0)
	syscall
	
	li $v0,4
	la $a0, msg2
	syscall
	
	li $v0, 1
	lw $a0, 0($t0)
	syscall
	
	li $v0,4
	la $a0, msg3
	syscall
	
	
	li $v0,10
	syscall



countevenodd:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	la $t0, returnarr
	lw $t1, returnlength
	move $t2, $a0
	move $t6, $a1
	li $t3, 0
	
	
loop2:  slt $t4, $t3, $t6
	beq $t4, $zero, end2
	
	lw $t4, 0($t2)
	
	
	move $a0, $t4
	jal isEven
	beq $v0, $zero, even
	lw $t5, 0($t0)
	addi $t5, $t5, 1
	sw $t5, 0($t0)
	
	j end3
even:
	lw $t5, 4($t0)
	addi $t5, $t5, 1
	sw $t5, 4($t0)
end3:
	
	addi $t2, $t2,4
	addi $t3, $t3,1
	j loop2
end2:
	move $v0, $t0


	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
	
	
rand:
	subi $sp, $sp, 8
	sw $t0, 4($sp)
	sw $ra, 0($sp)
	
	
	
	slt $t0, $a1, $a0  #upper < lower = 1
	beq $t0, $zero, upGTlow
	move $t0, $a0
	move $a0, $a1
	move $a1, $t0
upGTlow:
	move $a2, $a0
	sub $a1, $a1, $a2
	addi $a1, $a1, 1
	
	li $v0, 42
	syscall
	
	add $a0, $a0, $a2
	
	move $v0, $a0
	
	lw $t0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	
	jr $ra
	
	
	
isEven:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	sll $a0, $a0, 31
	move $v0, $a0
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra