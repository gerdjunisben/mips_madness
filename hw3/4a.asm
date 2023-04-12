	.data
msg: .asciiz "Computer Architecture and Organization"
	.text
main: 	li $v0, 4
	la $a0, msg
	syscall