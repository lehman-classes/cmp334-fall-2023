
	.data
	
	.text
	li $s0, 5
	
	move $a0, $s0 
	jal procedure_a 
	
	jal procedure_c
	
	li $v0, 1
	syscall
	
exit:
	li $v0, 10
	syscall
	
# parameter input at register $a0
# return value will be at register $a0
procedure_a:
	# stack 
	# PUSH values into the stack
	#move $fp, $sp
	addiu $sp, $sp, -8 # allocate 2 WORDs (32-bits or 4 bytes each WORD) on the stack
	sw $ra, 4($sp)
	sw $s0, 0($sp)

	addiu $a0, $a0, 7
	li $a1, 5
	jal procedure_b
	
	# POP values from the stack
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addiu $sp, $sp, 8 # restore $sp, freeing the allocated memory
	#move $sp, $fp
	
	jr $ra
	
# parameters input at register $a0 and $a1
# return value will be at register $a0
procedure_b:
	# stack 
	# PUSH values into the stack
	addiu $sp, $sp, -8 # allocate 2 WORDs (32-bits or 4 bytes each WORD) on the stack
	sw $ra, 4($sp)
	sw $s0, 0($sp)
	
	add $a0, $a0, $a1

	# POP values from the stack
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addiu $sp, $sp, 8 # restore $sp, freeing the allocated memory
	
	jr $ra
	
procedure_c:
	# stack 
	# PUSH values into the stack
	addiu $sp, $sp, -8 # allocate 2 WORDs (32-bits or 4 bytes each WORD) on the stack
	sw $ra, 4($sp)
	sw $s0, 0($sp)
	
	add $a0, $a0, $a0
	
	# POP values from the stack
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addiu $sp, $sp, 8 # restore $sp, freeing the allocated memory
	
	jr $ra
