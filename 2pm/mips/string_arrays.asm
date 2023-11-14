# This program should print out a string array.
# Also, randomly select a name from the array

	.data

# String[] names = {"Alec", "John", "Lana", "Luis", "Iris"}
# String[] names = new String[5];

names:		.asciiz	"Alec", "John", "Lana", "Luis", "Iris"
array_size:	.word 5
	
	.text
	
	# param
	la $a0, names
	lw $a1, array_size
	jal print_names
	
	la $a0, names
	lw $a1, array_size
	jal random_name
	
exit:
	li $v0, 10
	syscall

# args:
# 	$a0 - address of string array
#	$a1 - size of array
random_name:
	li $t0, 0 # counter
	move $t1, $a0  # saving address of string array in another register $t1
	move $t2, $a1  # saving size of array in another register $t2
	
	# select a random number from 0 to size of array - 1
	li $v0, 42 # random service
	li $a0, 0
	li $a1, 5
	syscall
	
	#print random number
	li $v0, 1
	syscall
	
	move $t3, $a0 # save random number in register $t3
	
	loop_2:
		beq $t0, $t3, done_2  # check if counter is equal to the size of array
		
		loop_22:
			lb $t4, ($t1) # $t4 is set to the value at address $t1 
			beq $t4, 0, next_22 # if the value at $t3 is 0 or NUL, move to next item in the array
			
			# print a character
			#li $v0, 11 
			#move $a0, $t4
			#syscall
			
			addu $t1, $t1, 1 # increment address 1 byte (char) at a time
		
			j loop_22
			
		next_22:	
			addu $t0, $t0, 1 # increment counter
			addu $t1, $t1, 1 # next item address
		j loop_2
	
	done_2:
		li $v0, 4
		move $a0, $t1
		syscall
		
		jr $ra
	
	
	

# args:
# 	$a0 - address of string array
#	$a1 - size of array
print_names:
	li $t0, 0 # counter
	move $t1, $a0  # saving address of string array in another register $t1
	move $t2, $a1  # saving size of array in another register $t2
	
	loop:
		beq $t0, $t2, done  # check if counter is equal to the size of array
		
		loop2:
			lb $t3, ($t1) # $t3 is set to the value at address $t1 
			beq $t3, 0, next # if the value at $t3 is 0 or NUL, move to next item in the array
			
			# print a character
			li $v0, 11 
			move $a0, $t3
			syscall
			
			addu $t1, $t1, 1 # increment address 1 byte (char) at a time
		
			j loop2
			
		next:
		addu $t0, $t0, 1  # increment counter
		addu $t1, $t1, 1  # next item beginning address
		
		# print a new line
		li $v0, 11
		li $a0, 10
		syscall
		
		j loop
	done:
		jr $ra
