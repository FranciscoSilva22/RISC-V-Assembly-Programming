# RISC-V ASSEMBLY PROGRAMMING
This project contains RISC-V assembly/C programs that can be compiled on a non-RISC-V machine and executed using QEMU.

## 📦 Prerequisites (Debian)

On a **Debian-based Linux system**, install the required packages:

```bash
sudo apt update
sudo apt install build-essential gcc-riscv64-linux-gnu qemu-user gdb-multiarch
```

- **build-essential**: essential compilation tools (make, gcc, etc)
- **gcc-riscv64-linux-gnu**: RISC-V cross-compiler  
- **qemu-user**: RISC-V emulator  
- **gdb-multiarch**: optional debugger  

---

## 🏗️ Building the Project

### 🛠️ Assemble and Link (Assembly code)

To compile the assembly code, run:

```bash
make
```

### ⚙️ Compile C code (optional)

If you have C files (e.g., `main.c`), compile them using:

```bash
riscv64-linux-gnu-gcc -o program main.c
```

---

## ⚡ Running the Program

Since your host CPU is not RISC-V, use QEMU to run the binary:

```bash
make emulate
```

The output will appear in the terminal.

---

## 🐞 Debugging (optional)

1. Start QEMU in debug mode:

```bash
qemu-riscv64 -g 1234 program
```

2. Open GDB:

```bash
gdb-multiarch program
```

3. Connect to QEMU:

```gdb
target remote :1234
```

---

## 📚 References

- **[RISC-V Assembly Language Programming - Unlock the Power of the RISC-V Instruction Set]**
    - **[Stephen Smith]**


## 📝 Notes

- This project uses **cross-compilation**, so the binary is built for RISC-V even if your computer has an x86_64 processor.  
- QEMU emulates the RISC-V CPU, allowing the program to run on non-RISC-V machines.  
- Make sure your assembly code matches the correct RISC-V architecture (32-bit vs 64-bit).  
- Tested on **Debian Linux**; commands may vary slightly on other distributions.
