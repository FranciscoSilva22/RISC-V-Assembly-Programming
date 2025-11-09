# RISC-V Assembler program to print a message to stdout
.data
buffer: .space 100

.text
.global _start  # provide program starting address to linker

# setup the parameters to print hello world
# and then call Linux to do it
_start:
    li a0, 0 # file descriptor (stdin)
    la a1, buffer # buffer address
    li a2, 100 # buffer size (maximun bytes number)
    li a7, 63 # system call to read from keyboard
    ecall

    # SYS CALL 63 return the number of bytes read from keyboard

    mv t0, a0 # t0 have the number of bytes read
    mv t1, a1 # t1 has the base adress of the buffer
    li t2, 89 # secret for cryptography

    li t4, 10 # '\n' in ASCII
cipher:
    lb t3, 0(t1)
    beq t3, t4, skip       # skip if read '\n'
    xor t3, t3, t2
    sb t3, 0(t1)
skip:
    addi t1, t1, 1
    addi t0, t0, -1
    bne t0, zero, cipher

    mv a2, a0 # number of bytes read
    li a0, 1 # file descriptor (stdout)
    li a7, 64 # system call to print on screen
    ecall

# setup the parameters to exit the program
# and then call Linux to do it
    addi a0, x0, 0 # use 0 return code
    addi a7, x0, 93 # service command code 93 terminates
    ecall # call linux too terminate the program
