
	.data
name_prompt: 		.asciiz "What's your name?\n"
response_message:	.asciiz "Nice meeting you, "
name:			.space 128

	.text
# How the heck do we prompt users?
# read documentation
	li $v0, 4
	la $a0, name_prompt
	syscall

	li $v0, 8
	la $a0, name
	li $a1, 20
	syscall
	
	li $v0, 4
	la $a0, response_message
	syscall
	
	li $v0, 4
	la $a0, name
	syscall

	
	
exit:
	li $v0, 10
	syscall