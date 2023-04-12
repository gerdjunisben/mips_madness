	.data
arr:	.space	80
size:	.word	20
nl:	.asciiz "\n"
space:  .asciiz " "
	.text
main:
	la $a0, size
	lw $a1, 0($a0)
	la $a2, arr
	
	move $s2, $a2
	li $s1,1
	addi $a1, $a1, 1
loop:
	slt $s0 , $s1 , $a1
	beq $s0, $zero, endloop
	
	
	sw $s1, 0($s2)
	
	addi $s1, $s1, 1
	addi $s2, $s2, 4


	j loop
endloop:
	subi $a1, $a1, 1
	
	
	jal displayarray
	
	li $a3, 40 #amount of swaps
	jal shuffle
	
	li $v0, 4
	la $a0, nl
	syscall
	
	jal displayarray
	
	li $v0, 10
	syscall
	
	
displayarray:
	move $t2, $a2
	li $t0, 0
loop2:
	slt $t1, $t0, $a1  #counter<size then 1
	beq $t1, $zero, end
	lw $t1, 0($t2)
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t2, $t2, 4
	addi $t0 , $t0, 1
	
	j loop2

end:
	jr $ra
	
shuffle:
	move $t5, $a2
	move $t6, $a2
	slt $t1, $t0, $a3  #counter<swaps then 1
	beq $t1, $zero, end
	
	li $v0, 42
	syscall
	move $t1,$a0
	syscall
	move $t2, $a0
	
	sll $t1, $t1, 2
	sll $t2, $t2, 2
	
	add $t5, $t5, $t1
	add $t6, $t6, $t2
	
	lw $t3, 0($t5)
	lw $t4, 0($t6)
	
	sw $t4, 0($t5)
	sw $t3, 0($t6)
	
	addi $t0 , $t0, 1
	j shuffle
	
	
	
	
