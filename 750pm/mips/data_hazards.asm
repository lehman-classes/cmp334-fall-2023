	.data
	
	.text
add $s0, $t0, $t1
sub $t2, $s0, $t3

exit:
	li $v0, 10
	syscall