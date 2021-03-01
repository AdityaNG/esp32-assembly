xtensa-esp32-elf-as --warn --fatal-warnings vectors.s -o vectors.o
xtensa-esp32-elf-gcc -Wall -O2 -ffreestanding -c so.c -o so.o
xtensa-esp32-elf-ld -nostdlib -nostartfiles -T so.ld vectors.o so.o -o so.elf
xtensa-esp32-elf-objdump -D so.elf > so.list
xtensa-esp32-elf-objcopy so.elf so.bin -O binary
