# Assembly Programming on the ESP32

This project is a template on getting started with assembly programming on the ESP32

# Building and Flashing

To build the project, we use the following

```bash
xtensa-esp32-elf-as --warn --fatal-warnings vectors.s -o vectors.o
xtensa-esp32-elf-gcc -Wall -O2 -ffreestanding -c so.c -o so.o
xtensa-esp32-elf-ld -nostdlib -nostartfiles -T so.ld vectors.o so.o -o so.elf
xtensa-esp32-elf-objdump -D so.elf > so.list
xtensa-esp32-elf-objcopy so.elf so.bin -O binary
```

Alternativly, you can use the build script provided

```bash
./build.sh
```

Hexdump to view the output
```bash
$ hexdump -C so.bin
00000000  85 13 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000100  0d f0 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000110  c0 20 00 39 02 0d f0 00  00 00 00 00 00 00 00 00  |. .9............|
00000120  c0 20 00 28 02 0d f0 00  38 08 00 60 10 03 00 60  |. .(....8..`...`|
00000130  04 03 00 60 80 1a 06 00  08 03 00 60 36 41 00 21  |...`.......`6A.!|
00000140  fa ff 0c 44 ad 02 a5 fd  ff b2 ae cf b0 ba 10 ad  |...D............|
00000150  02 e5 fb ff a1 f6 ff 0c  4b 65 fb ff 61 f5 ff 31  |........Ke..a..1|
00000160  f5 ff 51 f5 ff bd 04 ad  06 65 fa ff 0c 02 ad 02  |..Q......e......|
00000170  1b 22 e5 f8 ff 37 92 f5  bd 04 50 a5 20 25 f9 ff  |."...7....P. %..|
00000180  0c 02 ad 02 1b 22 a5 f7  ff 37 92 f5 46 f5 ff     |....."...7..F..|
0000018f
```

To flash the project, use esptool.py

```bash
esptool.py --port /dev/ttyUSB0 write_flash -fm qio 0x00000 so.bin
```

## Sources
 - [ESP32 ULP coprocessor instruction set](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/ulp_instruction_set.html#add-add-to-register<Paste>)
 - [Programming esp32 and esp8266](https://stackoverflow.com/questions/63900236/programming-esp32-and-esp8266)
