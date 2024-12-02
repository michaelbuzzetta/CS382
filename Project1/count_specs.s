/*  
    Name: Michael Buzzetta
    Pledge: I pledge my honor that I have abided by the stevens honor system
    //Recieved help from CAs and tutors
*/

.global count_specs

count_specs: // X0 = &str
    MOV X1, 0 // count = 0
    MOV X2, 0 // i = 0
    
    count_specs_check:
        LDRB W3, [X0, X2]               //loads value of X0 at index X2
        CBZ W3, count_specs_exit        // branch of zero
        CMP W3, '%'                     //checks for % symbol
        B.NE count_specs_skip           //branches of its not
        ADD X4, X2, 1                   //incremrnts
        LDRB W3, [X0, X4]               //loads X0 at X4
        CMP W3, 'a'                     //checks for a
        B.NE count_specs_skip           //branches if its not
        ADD X1, X1, 1                   //increment
        ADD X2, X2, 1                   //increment
    count_specs_skip:
        ADD X2, X2, 1                   //increment
        B count_specs_check             //branch to start loop

    count_specs_exit:
        MOV X0, X1                      //moves count to X0
        RET                             //returns


/*
    Declare .data here if you need.
*/