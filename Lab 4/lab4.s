//Filename: lab4.s
//Author: Michael Buzzetta
//Date: October 3, 2023
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.
//Recieved help from CA, worked wihtout a partner

.text
.global _start
_start:

    //Load side lengths into registers
    ADR X1, side_a                      //load data to address
    LDR X1, [X1]                        //store data in register
    ADR X2, side_b                      //load data to address
    LDR X2, [X2]                        //store data in register
    ADR X3, side_c                      //load data to address
    LDR X3, [X3]                        //store data in register


    //Calculate a^2 + b^2
    MUL X4, X1, X1  //x3 = a^2          //Squares the value of X1
    MUL X5, X2, X2  //x4 = b^2          //Squares the value of X2
    ADD X6, X4, X5  //x5 = a^2 + b^2    //Adds the squared values of X1 and X2

    //Load c^2
    MUL X7, X3, X3  //x6 = c^2          //Squares the value of X3

    //Compare c^2 with a^2 + b^2
    CMP X6, X7                          //compares the value of X7 with X6
    B.EQ is_right_triangle              //If they are qual, go to correct printout

    //Not a right triangle
    MOV X0, 1                           //Pass 1 to exit
    ADR X1, no                          //load data in register
    ADR X2, len_no                      //load data in register
    LDR X2, [X2]                        //store data in register
    MOV X8, 64                          //sets the call number
    SVC 0                               //exits the code

    B end_program

    //It is a right triangle
is_right_triangle:

    MOV X0, 1                           //Pass 1 to exit
    ADR X1, yes                         //load data in register
    ADR X2, len_yes                     //load data in register
    LDR X2, [X2]                        //store data in register
    MOV X8, 64                          //sets the call number
    SVC 0                               //exits the code

    //Exit program
end_program:
    MOV x0, 0
    MOV x8, 93  // syscall number for exit
    SVC #0

.section .rodata
format_str: .string "%s"

.data
side_a: .quad 3
side_b: .quad 4
side_c: .quad 6
yes: .string "It is a right triangle.\n"
len_yes: .quad . - yes // Calculate the length of string yes
no: .string "It is not a right triangle.\n"
len_no: .quad . - no // Calculate the length of string no
