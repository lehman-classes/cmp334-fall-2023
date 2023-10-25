# This is a comment
# My first MIPS assembly program

	.data
	
hello:	.asciiz "My first program\n"

	.text 
#main:
	li $v0, 4  # put the value 4 into the register named $v0
	la $a0, hello  # put the address of the data label hello into register named $a0
	syscall # call the system service to do the thing requested in register named $v0
	
#end:
	li $v0, 10
	syscall
		
	