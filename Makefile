SOURCE_DIR = src
BUILD_DIR = dist

ifndef SOURCE_FILE
SOURCE_FILE = hello
endif

SOURCE = $(SOURCE_DIR)/$(SOURCE_FILE)
BUILD = $(BUILD_DIR)/$(SOURCE_FILE)

ifdef DEBUG
	DEBUGFLAGS = -g
else
	DEBUGFLAGS =
endif

$(BUILD): $(BUILD).o
	riscv64-linux-gnu-ld -o $(BUILD) $(BUILD).o

$(BUILD).o: $(SOURCE).s
	mkdir -p $(BUILD_DIR)
	riscv64-linux-gnu-as $(DEBUGFLAGS) -o $(BUILD).o $(SOURCE).s

emulate:
	qemu-riscv64 $(BUILD)

debug:
	qemu-riscv64 -g 1234 $(BUILD)

clean:
	rm $(BUILD_DIR)/*