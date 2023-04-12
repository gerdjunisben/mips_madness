	.data
msg1: 	.asciiz "Computer Architecture and Organization"
msg2: 	.asciiz "SCCC - Computer Science Program"
	.text
main: 	li $v0, 4
	la $a0, msg1
	syscall
	
	la $a0, msg2
	syscall