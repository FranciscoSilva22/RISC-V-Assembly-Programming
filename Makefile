Hello: Hello.o
	riscv64-linux-gnu-ld -o Hello Hello.o

Hello.o: HelloWorld.s
	riscv64-linux-gnu-as -o Hello.o HelloWorld.s

emulate:
	qemu-riscv64 Hello

clean:
	rm Hello Hello.*