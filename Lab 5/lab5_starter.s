.text
.global _start
.extern printf


/* char _uppercase(char lower) */
_uppercase:
    /* Your code here 
    
        You must follow calling convention,
        and make this a procedure.
    */
    SUB  X0, X0, #'a'     /* Subtract ASCII value of 'a' */
    ADD  X0, X0, #'A'     /* Add ASCII value of 'A' */
    RET
    

    
    


/* int _toupper(char* string) */
_toupper:
    /* Your code here 

        You must call _uppercase() for every character in string.
        Both loop and recursion are good.

        You must follow calling convention,
        and make this a procedure.
    */
    loop_start:
        LDRB  W1, [X0], #1      /* Load a byte and advance pointer */
        CBZ   W1, loop_end      /* If it's null terminator, exit loop */

        BL    _uppercase       /* Call _uppercase to convert character */

        STRB  W0, [X0, #-1]!    /* Store the converted character and rewind pointer */
        B     loop_start

    loop_end:
        RET


_start:

    /* You code here:

        1. Call _toupper() to convert str;
        2. Call printf() to print outstr to show the result.
    
    */
    ADR  X0, str
    BL   _toupper

    /* Prepare arguments and call printf */
    ADR  X1, outstr
    MOV  X2, X0   /* X0 contains the modified string */
    BL   printf

    MOV  X0, 0
    MOV  X8, 93
    SVC  0


.data
str:    .string   "helloworld"
outstr: .string   "Converted %ld characters: %s\n"
