
	.data

nums: 	.word 16, 1, 12, 18, 62, 42, 4, 28

	.text
main:
	lw $t0, nums + 4
	lw $t1, nums + 24
	
	add $t0, $t0, $t1
	
	li $v0, 1
	add $a0, $t0, $zero
	syscall

exit:
	li $v0, 10
	syscall