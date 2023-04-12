	.data

	.text
main:

	
	
	

	li $t0,10
	li $t1,20
	add $t2,$t1,$t0
	#multiplies $t0 and $t1 and places results in $hi and $lo in case
	#it is too large
	mult $t0,$t1
	
	#move $hi into $s0 and $lo into $s1
	mfhi $s0
	mflo $s1
	
	div $t0,$t1
	
	#in division $hi gives you remainder and $lo gives you quotient
	mfhi $s0
	mflo $s1
	
	#these two are pseduo instructions 
	#meaning they are multiple instructions in a trench coat
	li $t4, 0xABCD1234
	addi $t5, $0, 0xABCD1234
	
	#adds an immediate to $t2 and stores in $t3
	addi $t3,$t2,10
	
	
	
	#random num 0<=num<$a1
	li $v0, 42
	li $a1, 1000
	syscall
	
	li $v0, 1
	syscall
	
	#prints $a0 as a hex number
	li $v0,34
	syscall
	
	#prints $a0 as a binary number
	li $v0,35
	syscall
	
	li $v0,10
	syscall
	