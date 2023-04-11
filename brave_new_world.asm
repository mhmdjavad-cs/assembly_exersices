; author : mhmdjavad safi
; 27 bahman 1401
; calculating the length of an string


section .data
    msg db "hello, brave new world!!!!!", 0Ah


section .text
global _start
_start:         ; the program starts here

    mov ebx, msg        ; store the address of the string
    mov eax, ebx        ; in both eax and ebx


nextchar:
    cmp byte [eax],0       ; comparing the first byte of the 
    jz  finished           ; 0 and if it was zero it means the
    inc eax                ; the end of the string, so we can jump
    jmp nextchar           ; to the finished section now

finished:
    sub eax, ebx           ; eax is now the length of the string


    mov edx, eax    ;length
    mov ecx, msg    ;start of the massage
    mov ebx, 1      ;should be one
    mov eax, 4      ;the writing system call
    int 80h


    ; exiting the program
    mov ebx, 0
    mov eax, 1
    int 80h
    ; done : hello brave new world!!!!!!








