ifdef DEBUG
	DEBUGFLAGS = -g
else
	DEBUGFLAGS =
endif

Hello: Hello.o
	riscv64-linux-gnu-ld -o Hello Hello.o

Hello.o: HelloWorld.s
	riscv64-linux-gnu-as $(DEBUGFLAGS) -o Hello.o HelloWorld.s

emulate:
	qemu-riscv64 Hello

debug:
	qemu-riscv64 -g 1234 Hello

clean:
	rm Hello Hello.*