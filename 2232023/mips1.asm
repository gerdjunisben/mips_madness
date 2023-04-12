	.data
msg1:	.asciiz " is odd"
msg2:	.asciiz " is even"
	.text
main:  
	#random num [0,100]
	li $v0, 42
	li $a1, 101
	syscall
	
	
	#filters all but the first bit
	#li $t0, 0x00000001
	#and $t1, $t0, $a0
	
	#shifts 31 to the left then check if not zero
	sll $t1, $a0, 31
	
	#you may also shift right 1 then left 1 and finally compare
	
	#you may literally just divide by 2 and check remainder
	
	li $v0, 1
	syscall
	
	
	#check if 0, if so it's even
	#display if so
	li $v0, 4
	beq $t1, $0, even
	
	la $a0, msg1
	syscall
	j odd
	
even:	
	la $a0, msg2
	syscall
	
odd:
	
	
	li $v0, 10
	syscall