
	.data
	
	.text
	
	li $s0, 1
	li $s1, 2
	
	move $a0, $s0
	move $a1, $s1
	jal procedure_a  # caller
	
exit:
	li $v0, 10
	syscall
	
# function int procedure_a(int a, int b) {
#	a = a + b;
#	return procedure_b(a);
# }

# function int procedure_b(int a) {
#	return a + a;
# } 

	
# procedure requires two parameters at register $a0 and $a1
# the result must be in register $a0	
procedure_a: # called procedure
	# PUSH stack 
	# allocate 3 WORDs (32-bits or 4 bytes) on the stack
	move $fp, $sp
	addiu $sp, $sp, -12 # allocate 3 WORDs on the stack
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)

	# get input parameters at registers $a0 and $a1
	# and do something with that data. etc. add values
	add $a0, $a0, $a1
	
	# procedure b doubles the result from the addition
	jal procedure_b # caller
	# procedure_b returned value is at register $a0
	
	# POP stack
	lw $s1, 0($sp)
	lw $s0, 4($sp)
	lw $ra, 8($sp)
	move $sp, $fp 
	
	jr $ra # return to caller
	
# procedure requires one parameter at register $a0
# the result must be in register $a0
procedure_b: # called
	# PUSH stack 
	# allocate 3 WORDs (32-bits or 4 bytes) on the stack
	move $fp, $sp
	addiu $sp, $sp, -12 # allocate 3 WORDs on the stack
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	
	# get input parameter at register $a0
	# and do something with that data.. etc. multiply by 2
	add $a0, $a0, $a0

	# POP stack
	lw $s1, 0($sp)
	lw $s0, 4($sp)
	lw $ra, 8($sp) 
	move $sp, $fp
	
	jr $ra # return to caller

