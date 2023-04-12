	.data
var1:	.word	10
msg:	.asciiz "Hello MIPS"
res:	.space 64
	
	
	.text
start:	
	#Prints msg from .data
	li $v0, 4
	la $a0, msg
	syscall 
	

	#Prints var1 from .data
	la $a1, var1
	lw $a0, 0($a1) 
	li $v0, 1
	syscall 
	
	#Takes an integer from the console which is stored $v0
	li $v0, 5
	syscall 
	
	#Takes a string from the console and puts it in res which resides at $a0
	li $v0, 8
	la $a0, res
	li $a1, 64
	syscall 
	
	#Prints the string at $a0
	li $v0, 4
	#la $a0, res, is not neccesary here
	syscall 
	
	#Closes
	li $v0, 10
	syscall
	
	
	
	
	
	