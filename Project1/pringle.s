
/*  
    Name: Michael Buzzetta
    Pledge: I pledge my honor that I have abided by the stevens honor system
    //Recieved help from CAs and tutor
*/
//I would like to be considered for extra credit
.global pringle
.text

pringle:
    //x19-x28  
    SUB SP, SP, 128                     //manipulates stack
    STP LR, X19, [SP, 112]              //saves registers
    STP X20, X21, [SP, 96]              //saves registers
    STP X22, X23, [SP, 80]              //saves registers
    STP X24, X25, [SP, 64]              //saves registers
    STP X26, X27, [SP, 48]              //saves registers
    STP X5, X6, [SP, 32]                //saves registers
    STP X3, X4, [SP, 16]                //saves registers
    STP X1, X2, [SP, 0]                 //saves registers
    ADD X29, SP, 128
    MOV X27, X7

    // Make sure to correctly 
    // pop off arguments on stack

    MOV X19, X0                         //moves X0 into X19
    BL count_specs                      //branches to function
    MOV X20, X0                         //stores return in X20
    MOV X21, 0                          //incrementor
    MOV X22, 0
    MOV X24, 0
    pringle_loop:
        LDRB W0, [X19, X21]             //load X19 at index X21
        CBZ W0, pringle_loop_exit       //branch if 0

        CMP X20, X22                    //comapres
        B.EQ not_equal                  //branches of equal

        CMP W0, '%'                     //checks for %
        B.NE not_equal                  //branch of not equal
        ADD X2, X21, 1                  //increments
        LDRB W0, [X19, X2]              //loads X19 at index X2
        CMP W0, 'a'                     //checks for a
        B.NE not_equal                  //branches if not equal
        ADD X22, X22, 1                 //increment
        ADD X21, X21, 2                 //increment
        CMP X22, 4                      //compares to 4
        B.EQ specs_four                 //branch of equal
        B.GT specs_five_or_more         //branch of more

        LDP X0, X1, [SP], 16            //pops the stack and edits the next call
        B run_concat                    //branch
    specs_four:
        MOV X0, X27                     //moves X27 to X0
        LDR X1, [X29], 8                //loads
        B run_concat                    //branch
    specs_five_or_more:
        LDP X0, X1, [X29], 16           //pops stack
    run_concat:
        BL concat_array                 //branches to function
        MOV X23, X0                     //moves X0 into X23
        print:
            LDRB W0, [X23]              //loads X23 into W0
            CBZ W0, pringle_loop        //branch
            MOV X0, 1                   //moves 1 to X0
            MOV X1, X23                 //moves X23 into X1
            MOV X2, 1                   //only want one char
            MOV X8, 64                  //call
            SVC 0                       //write
            ADD X24, X24, 1             //increment
            ADD X23, X23, 1             //increment
            B print                     //branch

    not_equal:
        MOV X0, 1                       //moves 1 to X0
        ADD X1, X19, X21                //adds X19 and X21
        MOV X2, 1                       //only want one char
        MOV X8, 64                      //call
        SVC 0                           //write
        ADD X21, X21, 1                 //increment
        ADD X24, X24, 1                 //increment
        B pringle_loop                  //branch


pringle_loop_exit:
    CMP X22, 4                          //compares to zero
    B.LT regular                        //branch of less than
    B ec                                //branch of any other value
regular:
    MOV X26, 3                          //moves 3 into X26
    SUB X26, X26, X22                   //subtract count from 3
    LSL X26, X26, 4                     //shift left 4
    ADD SP, SP, X26                     //adjust stack pointer 

ec:
        LDP X26, X27, [SP, 0]           //pops register
        LDP X24, X25, [SP, 16]          //pops register
        LDP X22, X23, [SP, 32]          //pops register
        LDP X20, X21, [SP, 48]          //pops register
        LDP LR, X19, [SP, 64]           //pops register
        ADD SP, SP, 80                  //resets stack
        RET                             //return


// mov x0, 1 
// mov x1, &char
// mov x2, 1
// mov x8, 64
// svc 0



/*
    Declare .data here if you need.
*/
