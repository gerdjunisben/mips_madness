	.data
mon:	.asciiz "Monday"
tue:	.asciiz "Tuesday"
wed:	.asciiz "Wednesday"
thu:	.asciiz "Thursday"
fri:	.asciiz "Friday"
sat:	.asciiz "Saturday"
sun:	.asciiz "Sunday"
	.text
main:	
	li $v0, 42
	li $a1, 7
	syscall
	move $t1, $a0
	li $t0, 1
	la $a0, sun
	beq $t0, $t1, mond
	addi $t0, $t0,1
	beq $t0, $t1, tued
	addi $t0, $t0,1
	beq $t0, $t1, wedd
	addi $t0, $t0,1
	beq $t0, $t1, thud
	addi $t0, $t0,1
	beq $t0, $t1, frid
	addi $t0, $t0,1
	beq $t0, $t1, satd
	j end
mond:
	la $a0, mon
	j end	
tued:	
	la $a0, tue
	j end	
wedd:
	la $a0, wed
	j end	
thud:
	la $a0, thu
	j end	
frid:
	la $a0, fri
	j end	
satd:
	la $a0, sat
	j end	
end:
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall