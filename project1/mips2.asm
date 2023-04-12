	.data
input:	.space	128
inputLength: 	.word  	16
output:	.space	128
outputLength:	.word	16
	.text
main:
	la $a0, input
	la $a1, inputLength
	lw $a1, 0($a1)
	li $v0, 8
	syscall
	move $s7, $a0
	
	li $a2, '2'
	jal validate
	
	
	move $a0, $v0
	li $v0, 1
	syscall
	move $a0, $s7
	
	li $a2, 2
	jal toDecimal
	
	move $a0, $v0
	li $v0,1
	syscall

	jal decimalToHex
	
	la $a1, outputLength
	lw $a1, 0($a1)
	move $a0, $v0
	jal display
	
	li $v0,10
	syscall
	
toDecimal: #$a0 is a string, $a1 is the length, $a2 is what we are converting from, returns decimal number into $v0
	subi $sp $sp, 4
	sw $ra, 0($sp)
	li $t0, 0 #counter
	ori $t7, 0x000a
loopA:
	lb $t1,0($a0)
	beq $t1, $t7, endA
	
	
	li $s0, '9'
	li $s1,'0'
	slt $t3, $s0, $t1  #9<char
	slt $t4, $t1, $s1  #char<0
	add $t3, $t4, $t3
	beq $t3, $zero, digit
	
	li $s0, 'F'
	li $s1,'A'
	slt $t3, $s0, $t1  #9<char
	slt $t4, $t1, $s1  #char<0
	add $t3, $t4, $t3
	beq $t3, $zero, hexDigit
	
	#no universe where we get here after validation
	
digit:
	subi $t1, $t1, '0'
	mult $a2, $s2
	mflo $s2
	add $s2, $s2, $t1
	j endif
hexDigit:
	subi $t1, $t1, 'A'
	addi $t1, $t1, 10
	mult $a2, $s2
	mflo $s2
	add $s2, $s2, $t1
	j endif
endif:	
	addi $t0, $t0,1
	addi $a0, $a0, 1
	j loopA
endA:
	move $v0, $s2
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra

decimalToHex: #$a0 is a decimal number, returns a String in hex to $v0
	subi $sp $sp, 4
	sw $ra, 0($sp)
	la $v0, output
	addi $v0, $v0, 4
	li $t0, 16
	
loopB:
	beq $a0, $zero, endB
	div $a0, $t0
	mflo $a0
	mfhi $t1
	div $a0, $t0
	mflo $a0
	mfhi $t2
	sll $t2, $t2, 4
	or $t1, $t2, $t1
	
	sb $t1, 0($v0)
	addi $v0, $v0, 	1
	
	
	j loopB

endB:
	la $v0, output
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra
	
validate: #$a0 is a string, $a1 is it's length, $a2 is it's base, $vo is 1 when invalid or 0 when valid
	subi $sp $sp, 4
	sw $ra, 0($sp)
	li $t0, 0x0a
	li $v0, 0
	li $s0, 'A'
	li $s1, 'F'
	slt $t3, $t1, $s0 
	slt $t4, $s1, $t1 
	add $t6, $t4, $t3
loopV:
	
	lb $t1, 0($a0)
	beq $t1, $t0, valid
	beq $t6, $zero, hexToo
decOnly:
	li $s0, '0'
	move $s1, $a2
	slt $t3, $t1, $s0  #char<$s0 =1
	slt $t4, $s1, $t1 #$s1<char = 1
	add $t3, $t4, $t3
	bne $t3, $zero, invalid
	addi $a0, $a0, 1
	j loopV
hexToo:
	li $s0, '0'
	li $s1, '9'
	slt $t3, $t1, $s0  
	slt $t4, $s1, $t1 
	add $t5, $t4, $t3
	li $s0, 'A'
	move $s1, $a2
	slt $t3, $t1, $s0 
	slt $t4, $s1, $t1 
	add $t5, $t4, $t3
	bne $t3, $zero, invalid
	
	addi $a0, $a0, 1
	j loopV
invalid:
	li $v0, 1
valid:
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra
	
display: #$a0 is a space, $a1 is the length
	subi $sp $sp, 4
	sw $ra, 0($sp)
	li $t0, 0
	move $t2, $a0
loopD:
	slt $t1, $t0, $a1
	beq $t1, $zero, endD
	
	lw $a0, 0($t2)
	li $v0, 1
	syscall
	
	
	addi $t0, $t0,1
	addi $a0,$a0, 4


endD:
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra
	
