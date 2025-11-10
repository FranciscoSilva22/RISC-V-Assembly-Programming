.macro exit
    addi a0, x0, 0 # use 0 return code
    addi a7, x0, 93 # service command code 93 terminates
    ecall # call linux too terminate the program
.endm
