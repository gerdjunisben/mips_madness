	.data
	
	.text
main:
	li $s0, 0xABCD1234
	
	#shift left 2 bytes and store in $s1
	sll $s1, $s0, 16
	
	#shift right 2 bytes and store in $s2
	srl $s2,$s0, 16
	
	#add $s1 and $s2 and put it in $s3
	add $s3,$s2,$s1
	
	#print $s3 as a hex number
	li $v0, 34
	move $a0,$s3
	syscall
	
	li $t0, 0xFF000000
	
	and $t1, $t0, $s0
	
	move $a0, $t1
	syscall
	
	srl $t0, $t0, 8
	
	and $t1, $t0, $s0
	
	move $a0, $t1
	syscall
	
	srl $t0, $t0, 8
	
	and $t1, $t0, $s0
	
	move $a0, $t1
	syscall
	
	srl $t0, $t0, 8
	
	and $t1, $t0, $s0
	
	move $a0, $t1
	syscall
	
	srl $t0, $t0, 8

	li $v0, 10
	syscall