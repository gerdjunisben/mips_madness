	.data
	
	.text
main:
	li $a0, 0xA1B3E5F7
	
	sll $a0, $a0, 1
	
	li $v0, 34
	syscall
	
	srl $a0, $a0,1
	
	syscall
	
	sra $a0, $a0,1
	
	syscall
	
	andi $t0, $a0, 0xFF000000
	srl $t0, $t0, 24
	sll $a0,$a0,8
	add $a0, $a0, $t0
	
	syscall
	
	andi $a0, $a0, 0x55555555
	li $v0, 35
	syscall
	
	
	li $v0, 10
	syscall