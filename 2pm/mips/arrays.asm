# This program creates a list of numbers and then display the list
	.data
first:			.asciiz "first"
align:			.align 2
array_of_numbers:	.space 40 # list of 10 32-bit integers, 4 bytes each 
last:			.asciiz "last"
	.text

# storing 10 integers in array_of_numbers
	la $a0, array_of_numbers
	li $a1, 1
	
loop_to_add_int:
	beq, $a1, 11, continue
	jal add_int_to_array
	addu $a1, $a1, 1
	j loop_to_add_int

#	li $a1, 5
#	jal add_int_to_array

#	li $a1, 7
#	jal add_int_to_array	

#	li $a1, 9
#	jal add_int_to_array
	
#	li $a1, 5
#	jal add_int_to_array

#	li $a1, 7
#	jal add_int_to_array	

#	li $a1, 9
#	jal add_int_to_array

#	li $a1, 5
#	jal add_int_to_array

#	li $a1, 7
#	jal add_int_to_array	

#	li $a1, 9
#	jal add_int_to_array

#	li $a1, 5
#	jal add_int_to_array
	
# display integers in array_of_numbers  for( int i = 0, (i <= size_of_array), i++)
	# register $t0 is our array index
continue:
	li $t0, 0 # $t0 -=> 0, 4, 8, 12, 16, 20, 24, 28, 32, 36 
	la $t1, array_of_numbers # address of array in data segment
loop_to_display_array_of_numbers:
	#if(i <= size_of_array)
	beq $t0, 40, exit
	li $v0, 1
	lw $a0, ($t1)
	syscall
	
	addu $t0, $t0, 4 # i++
	addu $t1, $t1, 4 # array[i]
	j loop_to_display_array_of_numbers


exit:
	li $v0, 10
	syscall
	
# $a0 - memory address 
# $a1 - int to add
add_int_to_array:
	#add $t0, $zero, $a1
	sw  $a1, ($a0) # word is 32 bits or 4 bytes
	addu $a0, $a0, 4
	jr $ra
