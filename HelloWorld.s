# RISC-V Assembler program to print a message to stdout

.global _start  # provide program starting address to linker

# setup the parameters to print hello world
# and then call Linux to do it
_start:
    addi a0, x0, 1 # 1 = StdOut
    la a1, helloworld # load address of helloword
    addi a2, x0, 13 # length of our string
    addi a7, x0, 64 # linux write system call
    ecall # call linux to output the string

# setup the parameters to exit the program
# and then call Linux to do it
    addi a0, x0, 0 # use 0 return code
    addi a7, x0, 93 # service command code 93 terminates
    ecall # call linux too terminate the program

.data
helloworld: .ascii "String menor\n" # 13
