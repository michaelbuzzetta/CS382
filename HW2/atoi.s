/*******************************************************************************
 * Name : atoi.s
 * Author : Michael Buzzetta
 * Date : Oct 18, 2023
 * Pledge : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
//Recieved help from CA


.text
.global _start

_start:

/* Add your code here */
    ADR X1, numstr              //loads address into X1
    ADR X10, number              //loads address into X2
    MOV X3, 1                  //sets X3 to 10
    MOV X4, 0                   //instansiates value
    MOV X7, 0                   //creates new usable register

    _loc:
        LDRB W5, [X1, X7]       //sets the value if x1 at index x3 to w1
        CBZ W5, _convert        //checks if were at the null pointer 
        ADD X7, X7, 1           //increments
        B _loc                  //sends us back to the start of loop

    _convert:
        SUB X7, X7, 1           //subtracts 1 from X7

    _convert_loop:
        LDRB W5, [X1, X7]       //loads into W5
        SUB W5, W5, 48          //subtracts 48 from W5
        MUL X5, X5, X3          //multiplies X5 by X3
        ADD X4, X4, X5          //adds the value of X4 to X5
        MOV X11, 10             //moves the value of 10 into X11
        MUL X3, X3, X11         //multiplies X3 by 10
        CBZ X7, _store          //moves to new loop when X7=0
        SUB X7, X7, 1           //removes 1 from X7
        B _convert_loop
    _store:
        STR X4, [X10]           //stores final value
/* Do not change any part of the following code */
exit:
    MOV  X0, 1
    ADR  X1, number
    MOV  X2, 8
    MOV  X8, 64
    SVC  0
    MOV  X0, 0
    MOV  X8, 93
    SVC  0
    /* End of the code. */


/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */






