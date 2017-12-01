# Program that determines the maximum of 3 integers.
# Pre-determined values for now.
# TODO use keyboard input for the 3 values 
# TODO generalise for an array of integers 

.data
x: .word 3      # 1st value
y: .word 12     # 2nd value
max: .word -6   # holds max value. We assume 3-rd number is max at the begining

.text
main:

v1: # compare max and x
lw $t0, max
lw $t1, x
blt	$t0, $t1, r1 # if x is greater than max, goto r1
j v2

r1:
sw $t1, max # x is the new max
nop

v2: # compare current max and y
lw $t0, max
lw $t1, y
blt	$t0, $t1, r2 # if y is greater than max, goto r2
j end # else finish execution

r2: # y is the new max
sw $t1, max # y is the new max
j end # max is found

end:
li $v0, 10
syscall
