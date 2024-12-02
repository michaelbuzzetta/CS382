/*******************************************************************************
 * Name : copystr.s
 * Author : Michael Buzzetta
 * Date : Oct 18, 2023
 * Pledge : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
//Recieved help from CA

.text
.global _start
.extern src_str
.extern dst_str

_start:
    ADR X1, src_str             //Sets source string to X1
    ADR X2, dst_str             //sets destination string to X2
    MOV X3, 0                   //incrementor
    _copy:
        LDRB W5, [X1, X3]       //sets the value if x1 at index x3 to w1
        STRB W5, [X2, X3]        //sets the value of x2 to w1 at index x3
        ADD X3, X3, 1          //increments
        CBNZ W5, _copy          //checks if were at the null pointer    
        
    _print:
        MOV X0, 1               //sets value of xo
        ADR X1, dst_str         //sets desination value to x1
        MOV X2, X3              //sets x2 to incremented value
        MOV X8, 64              //call number
        SVC 0                   //writes the output

        
    MOV X0, 0                   //sets the status to success
    MOV X8, 93                  //sets the call number
    SVC 0                       //exits the code

/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */
 
