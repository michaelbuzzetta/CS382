//Filename: lab2.s
//Author: Michael Buzzetta
//Date: September 19, 2023
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.
.text
.global _start
_start:
    MOV X0, 1       //sets file descriptor
    ADR X1, msg     //sets the message
    ADR X2, len     //sets the address
    LDR X2, [X2]    //sets the length
    MOV X8, 64      //call number
    SVC 0           //writes the output


    MOV X0, 0       //sets the status to success
    MOV X8, 93      //sets the call number
    SVC 0           //exits the code

.data
    len: .quad 13
    msg: .string "Hello World!\n"
    