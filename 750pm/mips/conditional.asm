# This program as the user to guess a number
# user must guess the value saved using label "number"
# if guessed value is higher than "number", print out value is too high
# if guessed value is lower than "number", print out value is lower
# if guessed value is equal to "number", print out "Yay!!!"
	.data
number: 	.word 7
prompt_guess: 	.asciiz "Guess a number?\n"
value_too_high: .asciiz "value is too high\n"
value_lower:	.asciiz "value is lower\n"
correct_guess_msg:	.asciiz "Yay!!!\n"
	
	.text

	lw $t0, number
	
	# printing string with prompt to user
	li $v0, 4
	la $a0, prompt_guess
	syscall
	
	# read input guess number from user
	li $v0, 5
	syscall
	
	#move $s0, $v0
	#addu  $s0, $zero, $v0
	add $s0, $zero, $v0
	
	slt $t1, $s0, $t0
	beq $t1, 1, value_is_low
	beq $s0, $t0, correct_guess
	# if($s0 > "number") {
	li $v0, 4
	la $a0, value_too_high
	syscall
	j exit
	# } else {
correct_guess:
	li $v0, 4
	la $a0, correct_guess_msg
	syscall
	j exit
value_is_low:
	li $v0, 4
	la $a0, value_lower
	syscall
	# }
exit:
	li $v0, 10
	syscall