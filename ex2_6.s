# Program that determines the sum of the digits of a natural number n and stores it in a variable s

.data
n: .word 251645 
s: .word 0   

.text
main:

    lw $t0, n

loop:

    beqz $t0, end
    li $t1, 10
    lw $t4, s

    divu	$t0, $t1		# $t0 / $t1
    mflo	$t2			# $t2 = floor($t0 / $t1) 
    mfhi	$t3			# $t3 = $t0 mod $t1 

    move $t0, $t2 
    addu $t4, $t4, $t3 
    sw $t4, s 				# s+=n%10

    b loop

end:
    li $v0, 10
    syscall
