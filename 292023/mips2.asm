	.data
res:	.word	0
msg1:	.asciiz "Enter two numbers"

		
	.text
main:
	#Prompt user for two numbers
	li $v0, 4
	la $a0, msg1
	syscall 

	#User enters two numbers
	li $v0, 5
	syscall 
	
	#Moves data $v0 to $t0
	move $t0, $v0
	
	li $v0, 5
	syscall 
	
	move $t1, $v0
	
	#do "add"
	
	#Puts the result of adding $t0 and $t1 to $t2
	add $t2,$t0,$t1
	
	#Display sum
	li $v0, 1
	move $a0,$t2
	syscall 
	
	#store sum in "res"
	la $a0, res
	sw $t2, 0($a0)
	
	#terminate

	li $v0, 10
	syscall 
