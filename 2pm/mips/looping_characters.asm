# This program prints out every decimal digit

	.data
	
	.text
	
	jal print_digits
	
exit:
	li $v0, 10
	syscall
	

print_digits:
	li $a0, 47 # ASCII - decimal value for the character '/'. That's the character before '0' in the ASCII table
	
	loop:
		beq $a0, 57, done 
		
		# print a character
		li $v0, 11
		addu $a0, $a0, 1 # register $a0 value is the decimal value for the character in the ASCII table
		syscall
		
		j loop
	done:
		jr $ra
