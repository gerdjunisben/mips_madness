	.data
	
	.text
main:
	li $s1, 0 #sum
	li $s0, 0 #i
	li $s2, 10
loop:	
	#if i<10 ($s0<$s2) then $s3 = 1
	slt $s3, $s0, $s2

	#if i=>10 leave the loop
	beq $s3, $0, out
	
	#adds i to sum
	add $s1, $s1, $s0
	
	#increments i
	addi $s0, $s0, 1
	
	#displays each num	
	#li $v0, 1
	#move $a0, $s1
	#syscall
	
	j loop
out:

	li $v0, 1
	move $a0, $s1
	syscall
	
	
	li $v0, 10
	syscall