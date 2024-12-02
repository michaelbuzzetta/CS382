/*******************************************************************************
 * Name : bins.s
 * Author : Michael Buzzetta
 * Date : Oct 18, 2023
 * Pledge : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
//Recieved help from CA


.text
.global _start

_start:
    ADR X1, arr                     //loads address into X1
    ADR x2, length                  //loads address into X2
    ADR x3, target                  //load address into X3
    MOV X10, 0                      //sets 0
    LDR X11, [X2]                   //loads value into X2
    LDR X12, [X3]                   //load value into X3
    MOV X4, 0                       //variable 1
    SUB X5, X11, 1                  //variable 2


    _check:
        CMP X4, X5                  //compares lower and upper
        B.GT _no                    //goes to no if true
        ADD X6, X5, X4              //add variable 1 and 2
        LSR X6, X6, 1               //finds the median
        LDR X7, [X1, X6, LSL 3]     //Load value of median
        CMP X7, X12                 //compare target to median
        B.EQ _yes                   //target found
        B.LT _less                  //if median is less than target value
        B.GT _greater               //if median is greater than target value


    _yes:
        MOV X0, 1
        ADR X1, msg1        //loads address into X0
        MOV X2, 24          //stores target in X2
        MOV X8, 64          //call number
        SVC 0               //system call; writes the output
        B _exit

    _no:
        MOV X0, 1
        ADR X1, msg2        //loads address into X0
        MOV X2, 28          //stores target in X2
        MOV X8, 64          //call number
        SVC 0               //system call; writes the output
        B _exit

    _less:
        ADD X6, X6, 1       //adds 1 to median
        MOV X4, X6          //sets low to median
        B _check            //goes back to check loop

    _greater:
        SUB X6, X6, 1       //removes 1 from median
        MOV X5, X6          //sets high to median
        B _check            //goes back to check loop

    _exit:
        MOV X0, 0               //sets the status to success
        MOV X8, 93              //sets the call number
        SVC 0                   //exits the code




/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */