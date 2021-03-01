.section .init
.globl _start
_start:
    call0 notmain
    ill
.balign 0x100
.globl dummy
dummy:
    ret.n
    
.balign 0x10
.globl PUT32
PUT32:
    memw
    s32i.n a3,a2,0
    ret.n
    
.balign 0x10
.globl GET32
GET32:
    memw
    l32i.n a2,a2,0
    ret.n
