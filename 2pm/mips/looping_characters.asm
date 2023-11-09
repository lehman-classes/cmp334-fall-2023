# This program prints out every decimal digit

	.data
	
	.text
	
	jal print_digits
	
exit:
	li $v0, 10
	syscall
	

print_digits:
	li $t0, 0 # counter
	li $t1, 10 # number of digits
	li $a0, 47 # ASCII - decimal value for the character '/'. That's the character before '0' in the ASCII table
	
	loop:
		beq $t0, $t1, done # done after looping 10 times
		
		# print a character
		li $v0, 11
		addu $a0, $a0, 1 # register $a0 value is the decimal value for the character in the ASCII table
		syscall
		
		addu $t0, $t0, 1 # increment counter
		j loop
	done:
		jr $ra