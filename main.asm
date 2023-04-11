%include "in_out.asm"

section .data
    msg: times 10 db "h"
    msg2: db "hello world",0


section .bss



section .text
    global _start

_start:
    ; mov     rsi, msg2
    ; string ro hamishe bezar to rsi
    ; call    printString

    call readNum
    mov     rax, 8023
    call writeNum



exit:
    mov     rax, sys_exit
    xor     rdi, rdi
    syscall