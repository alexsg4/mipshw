# Program that finds a value x inside an array and stores the result in a var. y

.data
v: .word 3, 5, 11, 22, 36, -4, 1 # Array
n: .word 7 # Array length
x: .word 5
y: .word 0 # 0/1 notFound/found 

.text
main: 
    lw $t3, n # const used for array length
    beqz $t3, end
    li $t0, 0 # used for index
    li $t2, 0 # used for mem index
    lw $t4, x # const used to store x

step:
    lw  $t1, v($t2) # $t1 = v[i]
    beq $t1, $t4, found
    addi $t0, $t0, 1 # i++
    bge $t0, $t3, end
    addi $t2, 4
    #sll $t2, $t2, 2 # left shift by 2 => $t2*=2^2

loop:
    j step

found:
    li $t1, 1
    sw $t1, y
    j end

end:
    # lw $t7, s
    li $v0, 10
    syscall
