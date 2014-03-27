.data
    GETA:           .asciiz "Enter A "
    GETB:           .asciiz "Enter B "
    QMSG:           .asciiz "Q = "
    RMSG:           .asciiz "R = "
    NL:             .asciiz "\n"
    ERR:            .asciiz "Divide by zero error\n"
    left:           .word 1
    right:          .word 1
.text
.globl main
main:
    # Prompt for an integer A: divisor
    li $v0, 4                            
    la $a0, GETA                           
    syscall                                     
    # Read A from user
    li $v0, 5                              
    syscall                              
 
    move $t0, $v0                         
    # Prompt for an integer B: dividend
    li $v0, 4                             
    la $a0, GETB                         
    syscall     
 
    # Read B from user
    li $v0, 5                               
    syscall                               
    move $a1, $v0                          
 
# Initialize quotient register to zero
# Initialize left half of Divisor regisiter with divisor
# Initialize remainder register with the dividend (right aligned)
# 1. Remainder = Remainder - Divisor
#    Remainder >= 0 goto Step 2a.
#    Remainder < 0 goto Step 2b.
# 2a. Shift quotient register to the left, setting rightmost bit to 1
# 2b. Restore the original value bu Remainder = Remainder + Divisor
#     Shift quotient register to the left setting new LSB to zero
# 3. Shift divisor register to the right 1 bit
# < 33 repitions, goto step 1
# >= 33 repititions, print result 
#
# Register usage:
# $a0 = divisor
# $a1 = dividend
# $a2 = quotient
# $a3 = remainder
# $t4 = counter of 33 repetitions
# $t0 = divisor (temp)
initialize:
    li $a2, 0                               # $a2 = quotient = 0
    swl $t0, left
    lwl $a0, left                           # $a0 = left half of divisor
    swr $a1, right
    lwr $a3, right                          # $a3 = remainder = $a2
    li $t4, 33                              # $t4 = counter = 33
 
step_one:
    sub $a3, $a3, $a0
    bge $a3, $zero, step_two_a
    blt $a3, $zero, step_two_b
 
step_two_a:
    #slt $a2, $zero, $a2
    sll $a2, $a2, 1
    ori $a2, $a2, 1
    j step_three
 
step_two_b:
 
    add $a3, $a3, $a0
    sll $a2, $a2, 1
 
step_three:
 
    sra $a0, $a0, 1
 
step_four:
 
    addi $t4, $t4, -1
    bge $t4, $zero, step_one
    beq $t4, $zero, print_result
 
print_result:
 
    li $v0, 4                  
    la $a0, QMSG                     
    syscall                   
 
    move $a0, $a2                      
    li $v0, 1                         
    syscall                            
 
    li $v0, 4                          
    la $a0, NL                         
    syscall                           
 
    li $v0, 4                    
    la $a0, RMSG                     
    syscall                     
 
    move $a0, $a3                      
    li $v0, 1                          
    syscall                            
 
    li $v0, 4                          
    la $a0, NL                         
    syscall
 
    j exit_program                    
 
exit_program:
    li $v0, 10                       
    syscall
