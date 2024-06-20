# Calculating Permutation of Given Numbers with MIPS Assembly

## C Code
![image](https://github.com/dilaygulru/Calculating-permutation-MIPS-Assembly/assets/123947023/41c86d0b-ca0d-4a67-a43e-738227652ddb)

## Code Description and Comments
***Data Segment***

![image](https://github.com/dilaygulru/Calculating-permutation-MIPS-Assembly/assets/123947023/d1321e5b-015c-4cc8-b933-5077cbfe99c7)

- .data segment: This is where constant data is stored.

- .asciiz: Used for storing null-terminated strings. User input prompts and the error message are defined using this.

***Main Part***

![image](https://github.com/dilaygulru/Calculating-permutation-MIPS-Assembly/assets/123947023/aecf7180-9caf-4e16-a5fe-aff97330d438)
- main label: The starting point of the program.

- li $v0, 4 and syscall: Printing a string to the screen.

- li $v0, 5 and syscall: Reading an integer from user input.

- move $s0, $v0 and move $s1, $v0: Storing the input values for n and r.

- li $t2, 1: This line loads the constant value 1 into register $t2.

***Permutation Calculation Loop***

![image](https://github.com/dilaygulru/Calculating-permutation-MIPS-Assembly/assets/123947023/22c6b3e8-7e14-4d5f-b249-cbbda1a2457e)

- perm_loop and perm_continue: Loop for calculating the permutation of n and r.

- slt, bne, bne: Conditional branching for checking n < r and conditions to continue the loop.

- mul, addi: Multiplication and decrement operations for calculating n!.

***Program Termination***

![image](https://github.com/dilaygulru/Calculating-permutation-MIPS-Assembly/assets/123947023/65c69174-49ca-4bd4-8253-319eb80c2622)

- end_perm_loop and error labels: Printing the result of the permutation or displaying the error message.
  
- syscall: System calls for printing the results and terminating the program.



