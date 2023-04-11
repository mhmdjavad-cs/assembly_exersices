; read a character and display it on the screen
; author : mhmdjavad
; data   : 26 bahman 1401

section .data
    userMsg db "please enter a number"  ; ask for the number
    lenUser equ $ - userMsg
    dispMsg db "you have entered:"
    lenDis equ $ - dispMsg

section .bss
    num resb 5

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, userMsg
    mov edx, lenUser
    int 80h


    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5
    int 80h


    mov eax, 4
    mov ebx, 1
    mov ecx, dispMsg
    mov edx, lenDis
    int 80h


    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 80h


    mov eax, 1
    mov ebx, 0
    int 80h

    




