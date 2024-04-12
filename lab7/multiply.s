.text
# Instructions
# place the first number in x10
# place the second number in x11
# the result will be stored in x8 
addi x10, zero, 17
addi x11, zero, -3# down counter
addi x9, x11, 0 # up counter
addi x8, zero, 0
 
loop:
# check if upcounter is zero
beqz x9, mul_was_neg

# check if downcounter is zero
beqz x11, mul_was_pos

# add first value to x8 (repeated addition)
add x8, x8, x10

# add 1 to upcounter
addi x9, x9, 1
# add -1 to downcounter
addi x11, x11, -1

# go back to loop1
beqz zero, loop

mul_was_neg: # we dont need the counter anymore
addi x9, zero, -1
xor x8, x8, x9
addi x8, x8, 1
beqz zero, done

mul_was_pos:
beqz zero, done

done:

# if up counter is 0 then take 2s compliment of x8 (result)

# xor with 1 to get negative
# add 1 to get 2's complement
