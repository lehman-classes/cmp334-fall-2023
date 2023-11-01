
	.data
	
prompt_message: 	.asciiz "What's your favorite number?\n"
number_seven:		.asciiz "That's a really cool number"
number_twelve:		.asciiz "Sweet"
	
	.text
	
	li $v0, 4
	la $a0, prompt_message
	syscall
	
	li $v0, 5
	syscall
	
	#move $s0, $v0
	add $s0, $v0, $zero
	#addu $s0, $v0, $zero 	
	
	# if the favorite number is 7, print out "That's a really cool number"
	# if the favorite number is 12, print out "Sweet"
	# if 
	beq $s0, 7, print_number_seven
	# if($s0 == 7) {

	# } 
	
	beq $s0, 12, print_number_twelve
	# if ($s0 == 12) {

	# } else {
exit:
	li $v0, 10
	syscall
	# }
	
print_number_seven:
	li $v0, 4
	la $a0, number_seven
	syscall
	j exit
	
print_number_twelve:
	bne $s0, 12, exit
	li $v0, 4
	la $a0, number_twelve
	syscall
	j exit