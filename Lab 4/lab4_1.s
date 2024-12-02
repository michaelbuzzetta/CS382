//Filename: lab4_1.s
//Author: Michael Buzzetta
//Date: October 3, 2023
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.
//Recieved help from CA, worked wihtout a partner

.text
.global _start
.extern scanf

_start:
    
    ADR   X0, fmt_str   // Load address of formated string
    ADR   X1, left      // Load &left
    ADR   X2, right     // Load &right
    ADR   X3, target    // Load &target
    BL    scanf         // scanf("%ld %ld %ld", &left, &right, &target);

    ADR   X1, left      // Load &left
    LDR   X1, [X1]      // Store left in X1
    ADR   X2, right     // Load &right
    LDR   X2, [X2]      // Store right in X2
    ADR   X3, target    // Load &target
    LDR   X3, [X3]      // Store target in X3

    /* Your code here */

    CMP X3, X1
    B.LE not_in_range
    CMP X3, X2
    B.GE not_in_range

    // true
    MOV X0, 1                           //Pass 1 to exit
    ADR X1, yes                         //load data in register
    ADR X2, len_yes                     //load data in register
    LDR X2, [X2]                        //store data in register
    MOV X8, 64                          //sets the call number
    SVC 0                               //exits the code
    B exit
    


not_in_range:
    // false
    MOV X0, 1                           //Pass 1 to exit
    ADR X1, no                          //load data in register
    ADR X2, len_no                      //load data in register
    LDR X2, [X2]                        //store data in register
    MOV X8, 64                          //sets the call number
    SVC 0                               //exits the code
    B exit
    



exit:
    MOV   X0, 0        // Pass 0 to exit()
    MOV   X8, 93       // Move syscall number 93 (exit) to X8
    SVC   0            // Invoke syscall

.data
    left:    .quad     0
    right:   .quad     0
    target:  .quad     0
    fmt_str: .string   "%ld%ld%ld"
    yes:     .string   "Target is in range\n"
    len_yes: .quad     . - yes  // Calculate the length of string yes
    no:      .string   "Target is not in range\n"
    len_no:  .quad     . - no   // Calculate the length of string no
