//Filename: lab3.s
//Author: Michael Buzzetta
//Date: September 26, 2023
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.

.text
.global _start
_start:
    ADR X1, vec1            //Loads vec1 into a register
    ADR X2, vec2            //Loads vec2 into a register
    ADR X3, dot             //Loads dot into a register
    ADR X4, 0               //Initialize new data register
    ADR X5, 0               //Initialize new data register
    ADR X6, 0               //Initialize new data register
    ADR X7, 0               //Initialize new data register
    ADR X8, 0               //Initialize new data register
    ADR X9, 0               //Initialize new data register
    ADR X10, 0              //Initialize new data register
    ADR X11, 0              //Initialize new data register
    ADR X12, 0              //Initialize new data register
    ADR X13, 0              //Initialize new data register
    LDR X4, [X1]            //Reasigns register memory to usable location
    LDR X5, [X1, #8]        //Reasigns register memory to usable location
    LDR X6, [X1, #16]       //Reasigns register memory to usable location
    LDR X7, [X2]            //Reasigns register memory to usable location
    LDR X8, [X2, #8]        //Reasigns register memory to usable location
    LDR X9, [X2, #16]       //Reasigns register memory to usable location
    LDR X10, [X10]          //Reasigns register memory to usable location
    LDR X11, [X11]          //Reasigns register memory to usable location
    LDR X12, [X12]          //Reasigns register memory to usable location
    LDR X13, [X13]          //Reasigns register memory to usable location
    MUL X10, X4, X7         //Computes and accumulates values
    MUL X11, X5, X8         //Computes and accumulates values
    MUL X12, X6, X9         //Computes and accumulates values
    ADD X13, X10, X11       //Computes and accumulates values
    ADD X13, X13, X12       //Computes and accumulates values
    STR X13, [X3]           //Stores the result as a single value


    MOV X0, 0               //sets the status to success
    MOV X8, 93              //sets the call number
    SVC 0                   //exits the code

.data
    vec1: .quad 10, 20, 30
    vec2: .quad 1, 2, 3
    dot: .quad 0
