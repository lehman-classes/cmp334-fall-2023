# This program is going to setup an array of 10 integers and then display each one

	.data

begin:		.asciiz "BEGIN"
align:		.align 2	# use to make sure each space is a WORD or 32-bits or 4 bytes
# int[] numbers = new int[10];
# notice that we need to explicitly include the data type and size of the array
# we want our array of numbers to align in WORD or 32-bits each
numbers:	.space 40 	 # int in our case is 4 bytes or a WORD. So, to store 10 integers we need 40 bytes
end:		.asciiz "END"
lf:		.asciiz "\n"

	.text
	
	la $a0, numbers
	
	li $t0, 2 # save a constant value 2 into register $t0
	sw $t0, numbers  # index 0 ==> numbers[0] = 2;
	
	li $t0, 4
	sw $t0, numbers + 4 # index 1 ==> numbers[1] = 4;
	
	li $t0, 6
	sw $t0, numbers + 8 # index 2 ==> numbers[2] = 6;
	
	li $t0, 8 # save a constant value 8 into register $t0
	sw $t0, numbers + 12 # index 3 ==> numbers[3] = 8;
	
	li $t0, 10
	sw $t0, numbers + 16 # index 4 ==> numbers[4] = 10;
	
	li $t0, 12
	sw $t0, numbers + 20 
	
	li $t0, 14 
	sw $t0, numbers + 24 
	
	li $t0, 16
	sw $t0, numbers + 28 
	
	li $t0, 18
	sw $t0, numbers + 32 
	
	li $t0, 20
	sw $t0, numbers + 36 # index 9 ===> numbers[9] = 20;
	
	# in a high level language if you try to add an integers using an index out of the range of values
	# you will get an exception. For example, numbers[10] = 22;
	
	# no exception, this is bad. It overwrites the data at this address (numbers + 40)
	#li $t0, 22
	#sw $t0, numbers + 40 # index 10 ===> numbers[10] = 22;
	
	# to iterate an array in a high level language, you would typically use a loop
	# print(numbers[0]);
	
	la $t0, numbers  # address of array passed in using register $t0
	li $t1, 10 # size of the array passed in using register $t1
	jal display_array
	
	# printing an integer  ---> numbers[0]
	#li $v0, 1
	#lw $a0, numbers 
	#syscall
	
	# printing an integer  ---> numbers[1]
	#li $v0, 1
	#lw $a0, numbers + 4
	#syscall
	
	# printing an integer  ---> numbers[2]
	#li $v0, 1
	#lw $a0, numbers + 8
	#syscall
	
	# printing an integer  ---> numbers[3]
	#li $v0, 1
	#lw $a0, numbers + 12
	#syscall
	
exit:
	li $v0, 10
	syscall
	
# this procedure needs an input param to know the exact address of number to print
# args: $t0 - array address
#	$t1 - size of the array
display_array:
	li $t2, 0 # sets a counter
	loop:
		beq $t2, $t1, done # check condition if counter is 10 we are done
		# print numbers[x]; where 'x' is the integer in register $t2
		li $v0, 1
		lw $a0, ($t0)
		syscall
		
		# print a new line
		li $v0, 4
		la $a0, lf
		syscall
	
		# increment address and counter
		addu $t0, $t0, 4
		addu $t2, $t2, 1
		j loop
	done:
		jr $ra