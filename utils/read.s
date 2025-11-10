.MACRO read    fd, ba, bs
    li a0, \fd # file descriptor (stdin)
    la a1, \ba # buffer address
    mv a2, \bs # buffer size (maximun bytes number)
    li a7, 63 # system call to read from keyboard
    ecall
.ENDM
