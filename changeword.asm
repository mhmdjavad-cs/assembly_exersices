; have a name then change it and showing it
; author : mhmd javad safi
; 27 bahman 1401


section .data
    name db "zara ali "


section .text
    global _start  ; must be declared for linker
_start:

    ; writing the name : zara ali
    mov edx, 10      ; massage length
    mov ecx, name   ; the massage text
    mov ebx, 1      ; file discriptor
    mov eax, 4      ; syscall for writing
    int 80h         ; call the  kernel

    mov [name], dword "nuha" ; change the name to nuha ali

    ; writing the name : nuha ali
    mov edx, 10
    mov ecx, name
    mov ebx, 1
    mov eax, 4
    int 80h

    ; exiting the program
    mov eax, 1
    int 80h

    ; the end