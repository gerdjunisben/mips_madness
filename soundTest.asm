	.data
song:	.byte	'E','D','C','D','E','E','E','D','D','D','E','G','G','E','D','C','D','E','E','E','E','D','D','E','D','C'
songLen:.word	26
	.text
main:
	li $t0, 0
	la $s0, song
	la $s1, songLen
	lw $s1, 0($s1)
	li $v0,33
	li $a1, 700
	li $a2, 0
	li $a3, 100
loop:	
	beq $t0,$s1,end
	lb $t1, 0($s0)
	li $t2, 'a'
	li $t3, 'g'
	slt $t4, $t1, $t2
	slt $t5, $t3, $t1
	add $t6, $t5, $t4
	beq $t6, $zero, lower
	
	li $t2, 'A'
	li $t3, 'G'
	slt $t4, $t1, $t2
	slt $t5, $t3, $t1
	add $t6, $t5, $t4
	beq $t6, $zero, upper
	
lower:
	subi $t1, $t1, 'a'
	sll $t1, $t1, 1
	addi $t1, $t1, 57
	li $t2, 61
	li $t3, 65
	slt $t4, $t3, $t1   #64<num
	slt $t5, $t1, $t2   #num <61
	add $t5, $t5, $t4
	beq $t5, $zero, uhh1
	subi $t1, $t1, 1
uhh1:
	j play
	
upper:
	subi $t1, $t1, 'A'
	sll $t1, $t1, 1
	addi $t1, $t1, 69
	li $t2, 73
	li $t3, 77
	slt $t4, $t3, $t1
	slt $t5, $t1, $t2
	add $t5, $t5, $t4
	bne $t5, $zero, uhh2
	subi $t1, $t1, 1
uhh2:
	j play
play:
	move $a0, $t1
	syscall
	li $v0, 1
	syscall
	li $v0, 33
	li $t1,0
	addi $s0, $s0, 1
	addi $t0, $t0, 1
	j loop
end:
	
	li $v0, 10
	syscall
	
