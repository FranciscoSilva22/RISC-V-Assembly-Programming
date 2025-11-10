# RISC-V Assembler program to print a message to stdout

.global _start  # provide program starting address to linker
.include "utils.s"
# setup the parameters to print hello world
# and then call Linux to do it
_start:
    li t0, 13
    print 1, helloworld, t0
    
    exit

.data
helloworld: .ascii "String menor\n" # 13
