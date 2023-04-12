	.data
msg1:	.asciiz " is equal to "
msg2:	.asciiz " is greater than "
msg3:	.asciiz " is less than "
	.text
main:
	#get two random nums
	li $v0, 42
	li $a1, 101
	syscall
	move $t0, $a0
	syscall
	move $t1, $a0
	
	#display if equal, less than or greater
	
	#if they aren't equal it jumps to check less than
	bne $t0, $t1, notequal
	
	la $s0, msg1
	
	
	j end
notequal:
	#if $t0 isn't less than $t1 it finally jumps to greater than
	slt $t2, $t0, $t1
	beq $t2, $0, greaterthan
	
	
	la $s0, msg3
	
	
	j end
	
greaterthan:
	
	la $s0, msg2
	

end:

	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	move $a0, $s0
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 10
	syscall