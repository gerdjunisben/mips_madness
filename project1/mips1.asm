	.data
input:	.space	96
inputLength: .word 12
msg:	.asciiz "\n\nEnter a number to continue \n1.Binary to hexadecimal and decimal \n2.Hexadecimal to binary and decimal \n3.Decimal to binary and hexadecimal \n4.Exit\n"
msg2:	.asciiz "Invalid input"
nl:	.asciiz	"\n"
msgB:	.asciiz "\nBinary number: "
msgD:	.asciiz "\nDecimal number: "
msgH:	.asciiz "\nHexadecimal number: "
msgIVH:	.asciiz "\nInvalid input, try again (hex numbers start with 0x, length must be less than 10 chars including 0x)\n"
msgIV:	.asciiz "\nInvalid input, try again (make sure to use correct digits and that your input is less than 11 chars)\n"
	.text
main:	
	li $v0, 4
	la $a0, msg
	syscall
loop1:
	li $v0, 5
	syscall
	
	subi $v0, $v0, 1
	beq $v0, $zero, binaryP
	subi $v0, $v0, 1
	beq $v0, $zero, hexP
	subi $v0, $v0, 1
	beq $v0, $zero, decimalP
	subi $v0, $v0, 1
	beq $v0, $zero, exit
	li $v0, 4
	la $a0, msg2
	j loop1
	
	
binaryP:
	jal prompt
	move $a0, $v0
	move $a1, $v1
	jal validateBin
	beq $v0, $zero, binV
	la $a0, msgIV
	jal invalMsg
	j binaryP
binV: 
	la $a0, input
	li $a2, 2
	jal toDecimal
	
	move $a0, $v0
	
	jal printBin
	
	jal printHex
	
	jal printDec
	
	la $a0, input
	sw $zero, 0($a0)
	j main
	
	
hexP:
	jal prompt
	jal validateHex
	beq $v0, $zero, hexV
	la $a0, msgIVH
	jal invalMsg
	j hexP
hexV: 
	la $a0, input
	li $a2, 16
	jal toDecimal
	
	move $a0, $v0
	
	jal printHex
	
	jal printBin
	
	jal printDec
	
	la $a0, input
	sw $zero, 0($a0)
	j main
	
	
decimalP:
	jal prompt
	jal validateDec
	beq $v0, $zero, decV
	la $a0, msgIV
	jal invalMsg
	j decimalP
decV: 
	la $a0, input
	li $a2, 10
	jal toDecimal
	
	move $a0, $v0
	
	jal printDec
	
	jal printBin
	
	jal printHex
	
	la $a0, input
	sw $zero, 0($a0)
	j main
exit:
	li $v0,10
	syscall	
	
	
prompt:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	li $v0, 8
	la $a0, input
	la $a1, inputLength
	lw $a1, 0($a1)
	syscall
	move $v0, $a0
	move $v1, $a1
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
invalMsg:#takes a message in $a0 and resets input
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	li $v0, 4
	syscall
	la $a0, input
	sw $zero, 0($a0)
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

	
	
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
	
	li $s0, 'x'
	beq $s0, $t1, endif
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
	li $s2, 0
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra


validateDec:
	subi $sp $sp, 4
	sw $ra, 0($sp)
	
	li $a2, '9'
	jal validate
	
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra
	
	
validateBin:
	subi $sp $sp, 4
	sw $ra, 0($sp)
	
	li $a2, '1'
	jal validate
	
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra
	
	
validateHex:
	subi $sp $sp, 4
	sw $ra, 0($sp)
	li $t0, 0x0a
	lb $t1, 0($a0)
	addi $a0, $a0, 1
	lb $t2, 0($a0)
	addi $a0, $a0, 1
	subi $t1, $t1, '0'
	subi $t2, $t2, 'x'
	add $t1, $t1,$t2
	bne $t1, $t2, invalidH
	lb $t1, 0($a0)
	li $v0,0
loopH:
	li $s0, 11
	beq $s0, $t1, invalidH
	beq $t1, $t0, hValEnd
	li $s0, '0'
	li $s1, '9'
	slt $t3, $t1, $s0  
	slt $t4, $s1, $t1 
	add $t4, $t4, $t3
	beq $t4, 0, loopHEnd
	li $s0, 'A'
	li $s1, 'F'
	slt $t3, $t1, $s0  
	slt $t4, $s1, $t1 
	add $t4, $t4, $t3
	beq $t4, 0, loopHEnd
	j invalidH
loopHEnd:
	addi $a0, $a0, 1
	lb $t1, 0($a0)
	j loopH
invalidH:
	li $v0, 1
hValEnd:
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra


validate: #$a0 is a string, $a1 is it's length, $a2 is the highest digit in the system, $vo is 1 when invalid or 0 when valid
	subi $sp $sp, 4
	sw $ra, 0($sp)
	li $t0, 0x0a
	lb $t1, 0($a0)
	li $v0,0
loopV:
	li $s0, 12
	beq $s0, $t1, invalid
	beq $t1, $t0, valEnd
	li $s0, '0'
	move $s1, $a2
	slt $t3, $t1, $s0  #char<$s0 =1
	slt $t4, $s1, $t1 #$s1<char = 1
	add $t3, $t4, $t3
	bne $t3, $zero, invalid
	addi $a0, $a0, 1
	lb $t1, 0($a0)
	j loopV
invalid:
	li $v0, 1
	
valEnd:
	
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra
	
	
printHex:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	move $t0, $a0
	la $a0, msgH
	li $v0, 4
	syscall
	move $a0, $t0
	li $v0, 34
	syscall
	
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra
	
	
printBin:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	move $t0, $a0
	la $a0, msgB
	li $v0, 4
	syscall
	move $a0, $t0
	li $v0, 35
	syscall
	
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra
	
	
printDec:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	
	move $t0, $a0
	la $a0, msgD
	li $v0, 4
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	
	lw $ra,0($sp)
	addi $sp, $sp,4
	jr $ra
	
	

	
