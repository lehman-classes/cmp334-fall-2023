
# Data segment is used to list information we like to store in the Data Memory
	.data

# word, half or byte are just the size allocated to store our data
num: 	.word 6    # word is a 32 bits value
small: 	.half 12   # half is 16 bits value
smaller: .byte 20  # byte is 8 bits value	

# Instructions
	.text
	
	#li $t2, 4
	addiu $t2, $zero, 4 # adding 0 plus 4 and putting the result in register $t2
	#li $t3, 3
	addiu $t3, $zero, 3 # adding 0 plus 3 and putting the result in register $t3
	add $t1, $t2, $t3  # adding register $t2 plus $t3 and putting the result in register $t1
	
	li $v0, 1
	add $a0, $zero, $t1
	syscall
	
	lw $t4, num
	la $t5, small
	
exit:
	li $v0, 10
	syscall