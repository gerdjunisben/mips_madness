	.data
size:	.word	10
arr:	.space	40
space:	.asciiz " "
	.text
main:	
	#initialize arr, fill with random nums [0-20]
	
	li $s0, 0 #index counter
	
	la $a0, size #size address load
	lw $s1, 0($a0) #size var load
	
	la $s2, arr #load arr base address
	
	li $a1, 21 #rand top bound
	li $v0, 42 #rand syscode
	
loop:
	slt $t0, $s0, $s1 #1 if index<size
	beq $t0, $zero, displayloop #branch out if index >=size
	
	syscall #puts random in $a0
	
	sw $a0, 0($s2)#save random at $s2
	
	addi $s0, $s0, 1 #increment one 
	addi $s2, $s2, 4 #increment a byte since the number was 4 bytes
	j loop
displayloop:#this prints it backwards because I thought it would be fun
	subi $s2,$s2,4
	slt $t0, $zero, $s0 #0<count =1
	beq $t0, $zero, end
	
	subi $s0,$s0,1
	
	lw $a0, 0($s2)
	
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	
	j displayloop
end:
	
	li $v0, 10
	syscall
	