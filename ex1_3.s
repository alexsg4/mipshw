# Program that calculates the sum of an pre-determined array's elements

.data
v: .word 3, 5, 11, 22, 36, -4, 1 # Array
n: .word 7 # Array length
s: .word 0 # store sum

.text
main: 
    lw $t3, n # const used for array length
    beqz $t3, end
    li $t0, 0 # used for index
    li $t2, 0 # used for mem index
    lw $t1, v($t2) # used for array value at index $t0
    sw $t1, s

step:
    addi $t0, $t0, 1 # i++
    bge $t0, $t3, end
    addi $t2, 4
    #sll $t2, $t2, 2 # left shift by 2 => $t2*=2^2
    lw  $t1, v($t2) # $t1 = v[i]
    lw  $t4, s
    add $t4, $t4, $t1
    sw $t4, s # update sum

loop:
    j step

end:
    # lw $t7, s
    li $v0, 10
    syscall

