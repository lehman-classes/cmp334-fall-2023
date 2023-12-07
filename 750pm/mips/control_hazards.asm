	.data
	
	.text
lui $t0, 1
lui $t1, 2
add $s0, $t0, $t1
beq $s0, 1, one

li $v0, 1
move $a0, $t0
syscall

exit:
	li $v0, 10
	syscall
	
# one 
# input: $s0 should have the int to print
# output: void
one: 
	li $v0, 1 # print int
	move $a0, $s0
	syscall