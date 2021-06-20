CFLAGS := -Wall -Wextra -s -Os -std=gnu99 -ffreestanding -march=armv7-m -mcpu=cortex-m3 -mtune=cortex-m3 -mthumb -fno-omit-frame-pointer
LDFLAGS := -ffreestanding -s -Os -nostdlib -lgcc
ASMFLAGS :=
EXE=kernel
OBJS= src/main.o src/start.o 

src/%.o: src/%.c
	arm-none-eabi-gcc $(CFLAGS) -c $< -o $@ 

src/%.o: src/%.S
	arm-none-eabi-as  $(ASMFLAGS) $< -o $@

$(EXE): link.ld $(OBJS) 
	arm-none-eabi-gcc $(LDFLAGS) -T $< $(OBJS)  -o $(EXE)

run: $(EXE)
	qemu-system-arm -monitor stdio -M lm3s811evb -kernel $(EXE)

.PHONY: clean
clean:
	rm -f $(EXE) *.o

