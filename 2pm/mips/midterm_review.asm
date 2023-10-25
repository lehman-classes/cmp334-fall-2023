
# Always REQUIRED to include a data and text segment
# The .data segment is used to data memory to store or allocate space
	.data
# the value 23 will be in the data segment at the location referenced by the label magic_num
magic_num: .word 23  

# The .text segment is used to list all our instructions
	.text
# This is an instruction. addiu
# This instruction add the value 0 + 2 and places the result into register $t1
	addiu $t1, $zero, 2
# another instruction. li
# this instruction place (load) an immediate (constant) value into register $t2
	li $t2, 5
	
	# add
# lw instruction. Load a Word (32-bits) from data memory into register $t3
	lw $t3, magic_num
# sw instruction. store a Word (32-bits) from register $t2 into data memory at location 
# referenced by the label magic_num + 8 bytes or 64 bits	
	sw $t2, magic_num + 8
# move instruction. set the content of register $t4 same as $t3	
	move $t4, $t3
	
# syscall 
# allow mips assembly to call into system services (outside functions)
	li $v0, 1
	move $a0, $t3
	syscall
# syscall requires some input (to indicate type of service) into register $v0
# if any other values are required by the service, register $a0, $a1, $a2, or $f12 as indicated

# this is a label named "exit"
exit: 
	li $v0, 10 # this service end/terminates our program
	syscall
	