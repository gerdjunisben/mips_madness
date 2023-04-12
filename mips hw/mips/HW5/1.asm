	.data
num:	.word 0
msg1:	.asciiz "little-endian"
msg2:	.asciiz "big-endian"
	.text
main:	
	li $t0, 0x01020304
	
	sw $t0,num
	
	lb $t1, num
	
	sll $t0, $t0, 24
	srl $t0, $t0, 24
	
	bne $t0, $t1, littleEnd
	la $a0, msg2
	j end
littleEnd:
	la $a0, msg1
	
end:
	li $v0, 4
	syscall
	li $v0, 10
	syscall
	
	 
	