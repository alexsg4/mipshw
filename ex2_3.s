# Program that determines the sum s of a natural number's divisors

.data

n: .word 3
s: .word 0

.text
main:

    lw $t0, n
    li $t1, 1
    sw $t0, s

    ble $t0, $t1, end

    li $t1, 2
    divu	$t0, $t1			# $t0 / $t1
    mflo	$t2				# $t2 = floor($t0 / $t1) 
    mfhi	$t3				# $t3 = $t0 mod $t1 

    move $t4, $t2               		# $t4 = n/2 
    beq $t0, $t1, add1 
    beqz $t3, divisor 

loop:

    bge $t1, $t4 add1
    addi $t1, 1
    beqz $t3, divisor 

    divu	$t0, $t1			# $t0 / $t1
    mflo	$t2				# $t2 = floor($t0 / $t1) 
    mfhi	$t3				# $t3 = $t0 mod $t1 

b loop

add1: 
    lw $t5, s
    addiu $t5, $t5, 1
    sw $t5, s
 
end:
    lw $t5, s
    li $v0, 10
    syscall

divisor:

    lw $t5, s
    addu $t5, $t5, $t2
    sw $t5, s
    j loop 
