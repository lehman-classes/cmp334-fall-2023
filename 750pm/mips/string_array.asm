# This program prints out a list of cities.
# Select a city randomly and print out

	.data
# String[] cities = new String[5];
# cities[0] = "New York";
# ...
# String[] cities = {"New York", "Las Vegas", "Boston", "Los Angeles", "Chicago"};
cities:		.asciiz  "New York", "Las Vegas", "Boston", "Los Angeles", "Chicago"
array_size:	.word 5
	
	.text
# for(int i = 0; i < cities.length; i++) { 
#   System.out.println(cities[i]);
# }

	la $a0, cities
	lw $a1, array_size
	jal print_cities
	
	la $a0, cities
	lw $a1, array_size
	jal select_city
	
exit:
	li $v0, 10
	syscall

# args:
# 	$a0 - address of array of cities
# 	$a1 - array size
select_city:
	li $t0, 0 # counter
	move $t1, $a0 # save address in register $t1

	li $v0, 42 # random int range
	li $a0, 0
	addu $a1, $a1, $zero # array size
	syscall
	
	move $t2, $a0 # random int saved in register $t2
	
	li $v0, 1 # print int
	move $a0, $t2 # random int
	syscall
	
	li $v0, 11 # print char
	li $a0, 10 # LF
	syscall
	
	loop_1:
		beq $t0, $t2, done_1
		
		# inner loop
		loop_11:
			lb $t3, ($t1) # get value from data segment address
			beq $t3, 0, next_1 # check if value is null, if it is go to next item
			
			addu $t1, $t1, 1 # increment address
			j loop_11
			
		next_1:
			addu $t0, $t0, 1 # increment counter
			addu $t1, $t1, 1 # increment address
		
		j loop_1

	done_1:
		li $v0, 4  # print string
		move $a0, $t1
		syscall
		
		jr $ra


# args:
# 	$a0 - address of array of cities
#	$a1 - size of array
print_cities:
	li $t0, 0 # counter
	move $t1, $a0 # save address in register $t1
	move $t2, $a1 # save array size in register $t2
	
	loop:
		beq $t0, $t2, done
		
		# inner loop (character by character check)
		loop_0:
			lb $t3, ($t1) # get value from data segment address
			beq $t3, 0, next # check if value is null, if it is go to next item

			li $v0, 11 # print a char
			move $a0, $t3
			syscall
			
			addu $t1, $t1, 1 # incrementing data segment address
			 
			j loop_0
		
		next:
			li $v0, 11 # print a char
			li $a0, 10 # LF
			syscall 
			
			addu $t0, $t0, 1 # increment the counter
			addu $t1, $t1, 1 # increment data segment address to next item in the array
		j loop
	done:
		jr $ra
	