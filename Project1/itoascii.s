
/*  
    Name: Michael Buzzetta
    Pledge: I pledge my honor that I have abided by the stevens honor system
   //Recieved help from CAs and tutors

*/

.global itoascii

itoascii:
   LDR X1, =buffer               //loads value of buffer into X1
   STRB WZR, [X1, 127]           //stores the null terminator at the end
   MOV X2, 126                   //creates iterator
   MOV X3, 10                    //value of division
   itoascii_loop:
      UDIV X4, X0, X3            //divides by 10
      MSUB X5, X4, X3, X0        //mod
      ADD X5, X5, '0'            //adds ascii 0
      STRB W5, [X1, X2]          //stores X1 at index X2
      MOV X0, X4                 //moves value to X0
      SUB X2, X2, 1              //deincrement
      CBNZ X0, itoascii_loop     //branch of not 0
   ADD X1, X1, X2                //increment
   ADD X0, X1, 1                 //increment
   RET                           //return



   


.data
    /* Put the converted string into buffer,
       and return the address of buffer */
    buffer: .fill 128, 1, 0


