//Filename: lab4.s
//Author: Michael Buzzetta
//Date: October 17, 2023
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.

//Assignment was commpleted during office hours with Lennon Okun

.text
.global _start
.extern printf


/* char _uppercase(char lower) */
_uppercase:
    /* Your code here 
    
        You must follow calling convention,
        and make this a procedure.
    */
    SUB X0, X0, #32
    RET
    

    

/* int _toupper(char* string) */
_toupper:
    /* Your code here 

        You must call _uppercase() for every character in string.
        Both loop and recursion are good.

        You must follow calling convention,
        and make this a procedure.
    */
    SUB SP, SP, 32
    STR X19, [SP, 0]
    STR X20, [SP, 8]
    STR X30, [SP, 16]

    mov X19, X0
    MOV X20, 0

    loop1:
        LDRB W0, [X19, X20]
        CMP X0, #0
        BEQ loop2
        BL _uppercase       
        STRB W0, [X19, X20]  
        ADD X20, X20, #1
        BL loop1

    loop2:
    
        MOV X0, X20
        LDR X19, [SP, 0]
        LDR X20, [SP, 8]
        LDR X30, [SP, 16]
        ADD SP, SP, 32
        RET
    

_start:

    /* You code here:

        1. Call _toupper() to convert str;
        2. Call printf() to print outstr to show the result.
    
    */
    ADR X0, str
    BL _toupper

    MOV X1, X0
    ADR X0, outstr
    ADR X2, str
    BL printf


    MOV  X0, 0
    MOV  X8, 93
    SVC  0


.data

outstr: .string   "Converted %ld characters: %s\n"
str:    .string   "helloworld"
