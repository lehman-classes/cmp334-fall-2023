
	.data
	
	.text
	
	li $t0, 4
	li $t1, 2
	div $t0, $t0, $t1
	add $t2, $t0, $t1
	
exit:
	li $v0, 10
	syscall