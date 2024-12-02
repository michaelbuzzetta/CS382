.global print_char

print_char:
    LDR X1, =buffer
    STRB X0, [X1]
    MOV X0, 1
    MOV X2, 1
    MOV X8, 64
    SVC 0
    RET

.data
buffer:
    .space 1