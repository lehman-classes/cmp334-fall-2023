# Playing with different type of instructions

	.data

num: 	.word 0   # word is 32 bits size
mid:	.half 12  # half is 16 bits size
small:	.byte 4   # byte is 8 bits size

lf:	.asciiz "\n"

	.text
main:
	li $t4, 312
	sb $t4, small
	
	la $t1, num
	lw $t2, 0($t1) # moving data from memory to a register
loop:
	addi $t2, $t2, 1
	ble $t2, 5, print  # if (a <= 5) { print }
	
	subi $t2, $t2, 1
	sw $t2, num  # moving data from a register to memory
	j exit

print:
	li $v0, 1
	add $a0, $zero, $t2  # System.out.println(a);
	syscall	
	
	li $v0, 4
	la $a0, lf
	syscall
	
	j loop

exit:
	li $v0, 10
	syscall