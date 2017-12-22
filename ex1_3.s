# Program that calculates the sum of a pre-determined array's elements

.data
    s: .word 0 
    v: .word 3, 2, -4, 11
    n: .word 4    	# array length
 		# store sum

.text
main: 
    lw $t3, n 		# const used for array length
    sll $t3, $t3, 2     # $t3 = 4*n
    li $t0, 0 		# used for index

step:
    bge $t0, $t3, end
    lw  $t1, v($t0) 	# $t1 = v[i]
    lw  $t2, s
    add $t2, $t2, $t1
    sw $t2, s 		# update sum
    addi $t0, $t0, 4 	
    j step

end:
    li $v0, 10
    syscall


