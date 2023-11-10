# Write a program that ask the user to input their favorite city
# Print out the favorite city vertically
# Print out the favorite city reverse 

	.data
	
prompt_favorite_city:		.asciiz "What's your favorite city? "
favorite_city:			.space 100 # the size of a character is 1 byte. So, 100 bytes == 100 characters
 
	.text
	
	# print out prompt
	li $v0, 4
	la $a0, prompt_favorite_city
	syscall
	
	# read input
	li $v0, 8
	la $a0, favorite_city
	li $a1, 100
	syscall

	#lb $t0, favorite_city
	#lb $t1, favorite_city + 1
	#lb $t2, favorite_city + 2
	#lb $t3, favorite_city + 3
	
	la $a0, favorite_city
	jal get_input_length
	move $s0, $a1 # save the input length at register $s0
	
	# print out input length
	#li $v0, 1
	#move $a0, $a1
	#syscall
	
	# print out input vertically
	la $a0, favorite_city
	move $a1, $s0 # the input length from $s0 to $a1
	jal print_out_input_vertically
	
	# print out input in reverse
	la $a0, favorite_city
	move $a1, $s0
	jal print_out_reverse
	
exit:
	li $v0, 10
	syscall
	
# args:
#	$a0 - input's data segment address
#	$a1 - input length
print_out_reverse:
	li $t0, -1 # counter
	addu $t1, $a0, $a1 # end of input address
	move $t2, $a1 # length saved into register $t2
	
	loop:
		lb $t3, ($t1) # load byte (char) from address
		beq $t0, $t2, done
		
		# print out char
		li $v0, 11
		move $a0, $t3
		syscall
		
		addu $t0, $t0, 1
		subu $t1, $t1, 1
		
		j loop
	done:
		jr $ra
	
# args:
#	$a0 - input's data segment address
#	$a1 - input length
print_out_input_vertically:
	li $t0, 0 # counter
	addu $t1, $a0, $zero # beginning address
	loop_0:
		lb $t2, ($t1) # get one char (byte) from address
		beq $t0, $a1, done_0 # check if we are at the end of input
		
		# print out char
		li $v0, 11
		move $a0, $t2
		syscall
		
		# print out new line
		li $v0, 11
		li $a0, 10
		syscall
		
		addu $t0, $t0, 1 # increment counter
		addu $t1, $t1, 1 # increment address
		j loop_0
	done_0:
		jr $ra


# args:
#	$a0 - input's data segment address
# return:
#	$a1 - input length
get_input_length:
	# for(int i = 0; i < some_value; i++)
	li $t0, 0 # counter or int i = 0 in high level language lingo
	addu $t1, $a0, $zero # beginning address of input
	loop_1:
		lb $t2, ($t1) # load byte (char) into register $t2, which we will use to compare to new line below
		beq $t2, 10, done_1 # if the character is new line (ASCII decimal 10, hex A), then we are done
		
		addu $t0, $t0, 1 # increment counter
		addu $t1, $t1, 1 # increment address
		j loop_1
	done_1:
		move $a1, $t0 # move counter to register $a1 (that's the input length)
		jr $ra
	