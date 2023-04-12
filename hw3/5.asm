.data 
	msg: .asciiz "Enter 3 integers" 
	msg2: .asciiz "The sum of " 
	msg3: .asciiz ", " 
	msg4: .asciiz " and " 
	msg5: .asciiz " is " 
	sum: 	.word 0 
 	 
 	.text 
main: li $v0, 4 
 	la $a0, msg  	
 	syscall 
 	 
 	 
 	li $v0, 5  	
 	syscall   	
 	move $t0, $v0 
 	 
 	 
 	li $v0, 5  	
 	syscall   	
 	move $t1, $v0 
 	 
 	 
 	 
 	li $v0, 5 
 	syscall   	
 	move $t2, $v0 
 	 
 	 
 	 
 	add $t3, $t0, $t1  	
 	add $t3, $t3, $t2 
 	 
 	la $a0, sum  	
 	sw $t3, 0($a0) 
 	 
 	li $v0, 4 
 	la $a0, msg2  	
 	syscall 
 	 
 	li $v0, 1 
 	la $a0, 0($t0)  	
 	syscall 
 	 
 	li $v0, 4 
 	la $a0, msg3  	
 	syscall 
 	 
 	li $v0, 1  	
 	la $a0, 0($t1)  	
 	syscall 
 	 
 	li $v0, 4  	
 	la $a0, msg4  	
 	syscall 
 	 
 	li $v0, 1  	
 	la $a0, 0($t2)  	
 	syscall 
 	 
 	li $v0, 4  	
 	la $a0, msg5  	
 	syscall 
 	 
 	li $v0, 1  	
 	la $a0, 0($t3)  	
 	syscall 
 	 
 	li $v0, 10  	
 	syscall 
