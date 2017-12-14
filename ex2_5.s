# Program that determines whether or not a number n is prime and store the result true/false in a variable x

.data
x: .byte 1  
n: .word 4

readn:
 .asciiz "Dati numarul: "

w_prime:
    .asciiz " este prim.\n"

w_notprime:
    .asciiz " nu este prim.\n"

w_start: 
    .asciiz "Numarul "

.text
main:

    la $a0, readn
    li $v0, 4
    syscall 

    la $a0, n
    la $a1, n
    li $v0, 5
    syscall 

    move $t0, $v0
    li $t1, 2

    beq $t0, 1, notprime
    beq $t0, 2, prime 

    divu	$t0, $t1			# $t0 / $t1
    mflo	$t2					# $t2 = floor($t0 / $t1) 
    mfhi	$t3					# $t3 = $t0 mod $t1 

    move $t4, $t2               # $t3 = n/2 

loop:

    beqz $t3, notprime
    addi $t1, 1

    divu	$t0, $t1			# $t0 / $t1
    mflo	$t2					# $t2 = floor($t0 / $t1) 
    mfhi	$t3					# $t3 = $t0 mod $t1 

    blt $t1, $t4 loop

b prime

notprime: 

    la $a0, w_start
    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1 
    syscall

    la $a0, w_notprime
    li $v0, 4
    syscall

    sb $0, x
    j end

prime:

    la $a0, w_start
    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1 
    syscall

    la $a0, w_prime
    li $v0, 4
    syscall
    
    j end
    
end:
    li $v0, 10
    syscall
