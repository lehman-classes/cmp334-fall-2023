.data 

magical: .asciiz "Magical number is "

.text 

    add $t1, $zero, $zero
    addi $t2, $t1, 3
    li $t3, 2
    add $t3, $t2, $t3
    
    li $v0, 4
    la $a0, magical
    syscall

    li $v0, 1
    move $a0, $t3
    syscall