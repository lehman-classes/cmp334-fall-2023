
	.data

hello:	.asciiz 	"\nHello, CMP-334\n"

	.text
main:
	li $v0, 4
	la $a0, hello
	syscall 
	
exit:
	li $v0, 10
	syscall