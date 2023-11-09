# Write a program that ask the user's name and print it 
# Then, print the user's name reverse 

	.data

prompt_for_name:		.asciiz "What's your name? "
result:				.asciiz "Hi, "
name:				.space 20 # each character is a byte, so if we allow 20 characters name we'd need 20 bytes
name_length:			.asciiz "Name length is "

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
	
	# loading from data segment, one byte starting at first letter of name
	#lb $t0, name
	#lb $t1, name + 1  # second character of name
	#lb $t2, name + 2  # third character of name
	
	# so, how do we get to the end? or better yet how many characters in the name?
	la $a0, name
	jal get_name_length
	# read length at register $a1
	
	# print out "Name length is "
	li $v0, 4
	la $a0, name_length
	syscall
	
	# print out name length (int)
	li $v0, 1
	move $a0, $a1
	syscall
	
	# so, now that we know the number of characters
	# we can find out the last character (name address + name length)
	# now, we can loop from the last character to the first to print in reverse
	la $a0, name
	# register $a1 should have the name length from code above
	jal print_name_in_reverse
	
exit:
	li $v0, 10
	syscall
	
# args:
# 	$a0 - address of name
#	$a1 - name length
print_name_in_reverse:
	add $t0, $a0, $a1  # start at the last character address in register $t0
	li $t1, -1 # counter starts at -1 to include the LF character entered by the user
	
	loop_0:
		beq $t1, $a1, done_0 # stop when we reach the first character in the name
		
		# print out character
		lb $a0, ($t0) # load character at register $a0
		li $v0, 11 # syscall number to print a character
		syscall
		
		addu $t1, $t1, 1 # incrementing counter
		subu $t0, $t0, 1 # decrementing the address 
		j loop_0
	done_0:
		jr $ra

# args:
#	$a0 - address of name
# return:
#	$a1 - length of the name will be at register $a1
get_name_length:
	move $t0, $a0 # save address of name 
	li $a1, 0 # counter
	li $t1, 31 # ASCII max control key value
	loop_1:
		lb $t2, ($t0) # load character into register $t2
		slt $t3, $t2, $t1  # if character from $t2 is less than 31, set $t3 to 1 otherwise to 0
		beq $t3, 1, done_1 # if $t3 is 1, then we are done. Otherwise continue
		addu $a1, $a1, 1 # increment counter 
		addu $t0, $t0, 1 # increment address to the next byte (char)
		j loop_1
	done_1:
		jr $ra
