# This program will ask for two input, add them and display the result
	.data
input_one:	.asciiz 	"Enter the first input: "
input_two: 	.asciiz 	"Enter the second input: "
result_message:	.asciiz 	"The total is: "

	.text

	jal get_input_one # output $s0

	jal get_input_two # output $s1

	jal display_result
	
exit:
	li $v0, 10
	syscall

# Calling this procedure result in an integer value stored in register $s0
# Output: $s0	
get_input_one:
# display "Enter the first input: "
	li $v0, 4
	la $a0, input_one
	syscall
# Let user type their input
	li $v0, 5
	syscall
# store first input in register $s0
	addu $s0, $zero, $v0
	jr $ra

# Calling this procedure result in an integer value stored in register $s1
# Output: $s1	
get_input_two:
# display "Enter the second input: "
	li $v0, 4
	la $a0, input_two
	syscall
# Let user type their input
	li $v0, 5
	syscall
# store first input in register $s1
	addu $s1, $zero, $v0
	jr $ra
	
display_result:
# add input one ($s0) and two ($s1)
	add $t0, $s0, $s1
	
# display the result
	li $v0, 4
	la $a0, result_message
	syscall	
	 
	li $v0, 1
	addu $a0, $zero, $t0
	syscall
	jr $ra