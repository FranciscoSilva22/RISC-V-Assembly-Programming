.MACRO print fd, ba, bs
    li a0, \fd # file descriptor (stdin)
    la a1, \ba # buffer address
    mv a2, \bs # buffer size (maximun bytes number)
    li a7, 64 # system call to print on monitor
    ecall
.ENDM
