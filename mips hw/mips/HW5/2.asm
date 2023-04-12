	.data
msg:	.asciiz "the random number is "
oddMsg:	.asciiz "\nodd"
evenMsg:.asciiz "\neven"
yesMsg:	.asciiz "\nyes"
noMsg:	.asciiz "\nno"
	.text
main:
	li $v0, 42
	li $a1, 999
	syscall
	
	addi $t0, $a0, 2
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0,1
	move $a0, $t0
	syscall
	
	#1 shift r then l method
	srl $t1, $t0, 1
	sll $t1, $t1, 1
	
	beq $t1,$t0,even1
	la $a0,oddMsg
	j end1
even1:
	la $a0,evenMsg
end1:
	li $v0, 4
	syscall
	
	#31 shift method
	
	sll $t1, $t0, 31
	
	beq $t1,$zero,even2
	la $a0,oddMsg
	j end2
even2:
	la $a0,evenMsg
end2:
	li $v0, 4
	syscall
	
	#div by 2 method
	li $t1, 2
	div $t0, $t1
	mfhi $t1
	
	beq $t1,$zero,even3
	la $a0,oddMsg
	j end3
even3:
	la $a0,evenMsg
end3:
	li $v0, 4
	syscall
	
	#div by 3 and 5 check
	li $s0, 3
	li $s1, 5
	
	div $t0, $s0
	mfhi $s0
	div $t0, $s1
	mfhi $s1
	
	la $a0, noMsg
	beq $s0,$zero,div3
	j end4
div3:
	beq $s1,$zero,div5
	j end4
div5:
	la $a0, yesMsg
end4:
	li $v0, 4
	syscall
	
	#div by 7 or 9, not both
	li $s0, 7
	li $s1, 9
	
	div $t0, $s0
	mfhi $s0
	div $t0, $s1
	mfhi $s1
	
	la $a0, noMsg
	beq $s0,$zero, div7
	beq $s1,$zero, div9
	j end
div7:
	beq $s1,$zero, end
	la $a0, yesMsg
	j end
div9:
	la $a0, yesMsg
end:
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall