# Write a program that ask the user's name and print it 
# Then, print the user's name reverse 

	.data

prompt_for_name:		.asciiz "What's your name? "
result:				.asciiz "Hi, "
name:				.space 20 # each character is a byte, so if we allow 20 characters name we'd need 20 bytes
	.text

	# prompt for name
	li $v0, 4
	la $a0, prompt_for_name
	syscall
	
	# read input from user
	li $v0, 8
	la $a0, name
	li $a1, 20
	syscall
	
	# print name 
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 4
	la $a0, name
	syscall 
	
	# how to get a byte 
	lb $t0, name
	
	li $v0, 11
	addu $a0, $zero, $t0
	#move $a0, $t0
	syscall
	
	la $a0, name
	jal get_length
	
	li $v0, 1
	move $a0, $a1
	syscall
	
	
	
exit:
	li $v0, 10
	syscall
	
# args: 
#	$a0 - address of null or \n terminated string
#	$a1 - length of string
get_length:
	move $t0, $a0 # save address on $t0
	li $a1, 0 # counter
	li $t1, 31 # ascii max control value
	loop:
		lb $t2, ($t0)
		slt $t3, $t2, $t1
		beq $t3, 1, done
		addu $a1, $a1, 1
		addu $t0, $t0, 1
		j loop
	done:
		jr $ra 