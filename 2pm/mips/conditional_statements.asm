
	.data
	
prompt_message: 	.asciiz "What's your favorite number?\n"
number_seven:		.asciiz "That's a really cool number\n"
number_twelve:		.asciiz "Sweet\n"
no_favorite:		.asciiz "No favorite number"
	
	.text
start:
	jal ask_user_for_input

	#addu $s0, $v0, $zero 	
	
	# if the favorite number is 7, print out "That's a really cool number", and let user try another number
	# if the favorite number is 12, print out "Sweet", and let user try another number
	# if is none of the favorite numbers, print out "No favorite number."
	beq $s0, 7, print_number_seven
	# if($s0 == 7) {
# continue
	# } 
	beq $s0, 12, print_number_twelve
	# if ($s0 == 12) {
	
#	displayHello();
#	displayWorld();
#function void displayHello() {
#}
#function void displayWorld() {
#}
	# } else {
	li $v0, 4
	la $a0, no_favorite
	syscall	
exit:
	li $v0, 10
	syscall
	# }
	
print_number_seven:
	li $v0, 4
	la $a0, number_seven
	syscall
	j start
	
print_number_twelve:
	bne $s0, 12, exit
	li $v0, 4
	la $a0, number_twelve
	syscall
	j start
	
ask_user_for_input:
	li $v0, 4
	la $a0, prompt_message
	syscall
	
	li $v0, 5
	syscall
	
	#move $s0, $v0
	add $s0, $v0, $zero
	jr $ra