	.data
	
	.text
main:	li $t1, 5
	li $t2, 10
	srl $t1, $t1, 5
	
	li $v0, 10
	syscall