MEMORY
{
    bob : ORIGIN = 0x40100000, LENGTH = 0x1000
    ted : ORIGIN = 0x3FFE8000, LENGTH = 0x1000
}
SECTIONS
{
    .init : { *(.init*) } > bob
    .literal : { *(.literal*) } > bob
    .text : { *(.text*) } > bob
    .rodata : { *(.rodata*) } > bob
    .data : { *(.data*) } > ted
    .bss : { *(.bss*) } > ted
}
