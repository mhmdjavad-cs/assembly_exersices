; a program to add to numbers and save it 

section .data
    d1 db 30
    d2 db 20
    d3 db 0

section .text
    global _start
_start:
    mov rax, [d1]
    mov rbx, [d2]
    add rax,rbx
    mov [d3],rax

exit:
    mov rbx, 0
    mov rax, 1
    int 80h
