.data
value_n: .asciiz "Enter the value n: "  #User input request for value n
value_r: .asciiz "Enter the value r: "  #User input request for value r
error_message: .asciiz "The value of n cannot be less than r." #Error message for n < r case

.text
.globl main

main:

    #In MIPS, number 4 means printing a string and number 5 means receiving integer input.

    #Value of n         
    li $v0, 4                         # Load syscall code for print operation into $v0 (li -> load immediate)
    la $a0, value_n                   # Load the address of the string to be printed into $a0 (la -> load address)
    syscall                           # Execute the syscall (system call)
    li $v0, 5                         # Load syscall code for reading an integer 
    syscall                           # Read an integer from user input
    move $s0, $v0                     # Store the input value in $s0 register

    #Value of r
    li $v0, 4                         # Load syscall code for print operation into $v0 (li -> load immediate)
    la $a0, value_r                   # Load the address of the string to print into $a0 (la -> load address)
    syscall                           # Execute the syscall
    li $v0, 5                         # Load syscall code for reading an integer
    syscall                           # Execute the syscall to get user input
    move $s1, $v0                     # Store the input number in register $s1      

       
    li $t2, 1                         # Load the initial value 1 into register $t2, will be used to calculate permutation.
                                      # Since permutation is based on multiplication, we assigned the first value to 1.          
    
perm_loop:
    slt $t4, $s0, $s1                 # $t4 = 1 if $s0 < $s1 else: $t4 = 0
    bne $t4, $zero, error  	      # If $t4 not equal 0 go to error tag (In permutation, the first value must be greater than the second value)
    bne $s1, $zero, perm_continue     # If $s1 is not equal to 0, go to perm_continue tag
    j end_perm_loop 	              # If $s1 equals 0, go to end_perm_loop tag and end the loop


perm_continue:
    mul $t2, $t2, $s0   	      # Multiply $t2 by $s0 and store the result in $t2 (operation n * (n-1) * ...)
    addi $s0, $s0, -1                 # Decrement $s0 by 1
    addi $s1, $s1, -1                 # Decrement $s1 by 1
    j perm_loop                       # Jump back to the start of perm_loop to continue

    #In MIPS, number 1 means printing a number and number 10 means termination of the program.

end_perm_loop:
    li $v0, 1                         # Load the syscall code for printing an integer into $v0
    move $a0, $t2                     # Move the result into $a0
    syscall                           # Print the result
    li $v0, 10                        # Load the syscall code for program termination into $v0
    syscall                           # Terminate the program

error:
    li $v0, 4                         # Load the syscall code for printing a string into $v0
    la $a0, error_message             # Load the address of the error message into $a0
    syscall                           # Print the error message
    li $v0, 10                        # Load the syscall code for program termination into $v0
    syscall                           # Terminate the program              



