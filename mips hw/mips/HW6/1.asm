	.data
msg1:	.asciiz	"the number "
truemsg:.asciiz " is the power of 2"
falsemsg:.asciiz " is not the power of 2"
	.text
main:
	li $v0, 42
	li $a1, 65
	syscall
	

	jal checkif2pow
	
	move $t0, $v0
	
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	beq $zero, $t0, no
	la $a0, truemsg
	j finish
no:
	la $a0, falsemsg
finish:
	li $v0, 4
	syscall
	
	li $v0,10
	syscall
	
	

checkif2pow:
	move $s0, $a0
	subi $t0, $a0, 1
	and $t1, $a0, $t0
	bne $t1, $zero, false
	
	li $v0,1
	j end
false:
	li $v0, 0
end:
	move $a0, $s0
	jr $ra
	
checkif2pow2:
	li $t1, 2
	move $s0, $a0 
loop:	
	slt $t0, $t1, $a0 #pow>=num then 0
	beq $t1, $a0, true
	beq $t0, $zero, false2
	sll $t1, $t1, 1
	
	j loop
true:
	li $v0, 1
	j end
false2:
	li $v0, 0
	j end
	