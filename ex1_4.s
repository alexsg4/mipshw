# Program that finds a value x inside an array and stores the result in a var. y

.data
   v: .word 3, 5, 11, 22, 36, -4, 1	# Array
   n: .word 7 				# Array length
   x: .word 5
   y: .byte 0 				# 0/1 notFound/found 

.text
main: 
    lw $t3, n 		# const used for array length
    li $t0, 0 		# used for index
    lw $t4, x		# used to store elementToFind

step:
    bge $t0, $t3, end
    move $t2, $t0
    sll $t2, $t2, 2 	# left shift by 2 => $t2*=2^2
    lw  $t1, v($t2) 	# $t1 = v[i]
    beq $t1, $t4 found  # we found x 
    addi $t0, $t0, 1 	# i++
    j step

found:
    lb $t1, 1
    sb $t1, y

end:
    li $v0, 10
    syscall
