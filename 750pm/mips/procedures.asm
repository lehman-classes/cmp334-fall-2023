# This program is going to ask the user for two integer inputs, and it will add the integers and display the result

	.data
input_one_prompt: 		.asciiz "Enter the first number: "
input_two_prompt:		.asciiz "Enter the second number: "
# input_prompt:			.asciiz "Enter number: "
result_message:			.asciiz "The sum is equal to: "

	.text
	
	# get first input
	la $s1, input_one_prompt # Arguments: $s1 = string to display
	jal ask_for_input # input will be in register $s0
	addu $t1, $zero, $s0 # save input in register $t1
	
	# get second input
	la $s1, input_two_prompt # Arguments: $s1 = string to display
	jal ask_for_input # input will be in register $s0
	addu $t2, $zero, $s0 # save input in register $t2

	# sum stored in register $t0
	add $t0, $t1, $t2
	
	jal display_result
	
exit:
	li $v0, 10
	syscall

# user input is going to be at register $s0
# params: input_prompt is in $s1
ask_for_input:
	# prompt user for input 
	li $v0, 4
	addu $a0, $zero, $s1
	syscall
	
	# keyboard input in register $v0
	li $v0, 5
	syscall
	
	# save the inputted value into another register $s0 instead of $v0
	addu $s0, $zero, $v0
	jr $ra
	
display_result:
	# display result
	li $v0, 4
	la $a0, result_message
	syscall
	
	# print integer sum
	li $v0, 1
	addu $a0, $zero, $t0
	syscall
	jr $ra