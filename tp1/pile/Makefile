# Compiles aassembly flies

AS = gcc
ASFLAGS = -m32 -g

SRCS_ASM = $(wildcard *.s)

OBJS = $(SRCS_ASM:.s=.o)

TARGET = out

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) -m32 -o $@ $^
	
%.o: %.s
	$(AS) $(ASFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

run: ${TARGET}
	./${TARGET}

pile: run

.PHONY: all clean pile
