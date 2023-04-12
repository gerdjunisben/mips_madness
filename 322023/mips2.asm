	.data
	
	.text
main:
	

	jal funct1 #store this location in $ra then jumps
	
	li $v0, 10
	syscall



funct1:	
	li $a1, 101 
	li $v0, 42
	syscall
	move $s0, $ra
	jal funct2
	jr $s0

funct2:
	
	li $v0,1
	syscall
	jr $ra #jump to return address