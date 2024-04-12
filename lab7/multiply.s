.text
# Instructions
# place the first number in x10
# place the second number in x11
# the result will be stored in x8 
addi x10, x10, 17
addi x11, x11, 2# down counter
addi x9, x9, 2# up counter
addi x8, x8, 0
 
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
bnez x10, loop

mul_was_neg: # we dont need the counter anymore
addi x9, x9, -1
xor x8, x8, x9
addi x8, x8, 1
beqz x9, done

mul_was_pos:

done:

# if up counter is 0 then take 2s compliment of x8 (result)

# xor with 1 to get negative
# add 1 to get 2's complement
