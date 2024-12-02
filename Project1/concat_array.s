/*  
    Name: Michael Buzzetta
    Pledge: I pledge my honor that I have abided by the stevens honor system
   //Recieved help from CAs and tutors
*/
.global concat_array

concat_array:
   SUB SP, SP, 48                      //manipulates stack
   STP LR, X19, [SP, 32]               //saves registers
   STP X20, X21, [SP, 16]              //saves registers
   STP X22, X23, [SP, 0]               //saves registers

   LDR X19, =concat_array_outstr       //outstring value
   MOV X20, 0                          //iterator
   MOV X21, 0                          //loop checking int
   MOV X22, X0                         //moves value of X0 to a safe register
   MOV X23, X1                         //moves value of X1 to safe register
   concat_array_loop:
      CMP X21, X23                     //compares
      B.GE concat_array_exit           //branches when >=
      LDR X0, [X22, X21, LSL 3]        //stores the value of X28 an index X21
      BL itoascii                      //calss itoascii and gives it the calue of X0
      MOV X4, 0                        //secondary loop iterator
      concat_array_loop_1:
         LDRB W6, [X0, X4]             //loads X0 at index X4
         CBZ W6, concat_array_exit_1   //branch of equal
         STRB W6, [X19, X20]           //stors at index X20
         ADD X20, X20, 1               //increments
         ADD X4, X4, 1                 //increments
         B concat_array_loop_1         //branch to top
      concat_array_exit_1:
         MOV W10, ' '                  //creates black string
         STRB W10, [X19, X20]          //stores empty string
         ADD X20, X20, 1               //increments
         ADD X21, X21, 1               //incremernts
         B concat_array_loop
      concat_array_exit:
         STRB WZR, [X19, X20]           //adds the null terminator
         MOV X0, X19                    //moves array to X0
         LDP X22, X23, [SP, 0]          //pop the registers
         LDP X20, X21, [SP, 16]         //pop the registers
         LDP LR, X19, [SP, 32]          //pop the registers
         ADD SP, SP, 48                 //resets Stack
         RET



         



.data
    /* Put the converted string into concat_array_outstrer,
       and return the address of concat_array_outstr */
    concat_array_outstr:  .fill 1024, 1, 0

