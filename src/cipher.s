# RISC-V Assembler program to print a message to stdout
.data
buffer: .space 100

.text
.include "utils.s"
.global _start  # provide program starting address to linker

# setup the parameters to print hello world
# and then call Linux to do it
_start:
    li t0, 100
    read 0, buffer, t0 # return the number of bytes read from keyboard

    mv t0, a0 # t0 have the number of bytes read
    la t1, buffer # t1 has the base adress of the buffer
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

    mv t0, a0
    print 1, buffer, t0

    exit
