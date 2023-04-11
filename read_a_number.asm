
; a program to read a number
; to input a number
; some important functions
; mhmd javad safi
; 4 farvardin 1402


;=========== CONSTATNTS & VARIABLES ===============
section .data
    msg1 db "please enter a number : ",10
    msg1len equ $ - msg1
    msg2 db "you have entered : ",10
    msg2len equ $ - msg2
    newline db 10

section .bss
    num1  resb 16
    numr resb 16
    num2 resb 16
    numr2 resb 16
    sumnum resb 16

;==================================================
;=============== CODE SECTION =====================
section .text
    global _start




;@@@@@@@@@@@@@@@@@@ STRLEN:
; to find the lenght of an string
strlen:
    push rbx
    mov  rbx, rax

nextchar:
    cmp byte [rax], 0
    jz  finished
    inc rax
    jmp nextchar

finished:
    sub rax, rbx
    pop rbx
    ret
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



;@@@@@@@@@@@@@@@@@@ COUT:
; to print an string
cout:
    push rdx
    push rcx
    push rbx
    push rax
    call strlen

    mov rdx, rax
    pop rax

    mov rcx, rax
    mov rbx, 1
    mov rax, 4
    int 80h

    pop rbx
    pop rcx
    pop rdx
    ret
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;@@@@@@@@@@@@@@@@@@ STRLSTR_TO_NUM:
; to translate an string in to a number
str_to_num:
    mov rdx,0
    mov rsi,rax
    xor rax,rax ; initializing rax with zeros

sAgain:
    mov     al, [rsi]
    cmp     al,0xA
    je      sEnd
    sub     al,0x30
    imul    rdx,10
    add     rdx,rax
    inc     rsi
    jmp     sAgain 

sEnd:
    mov rax, rdx
    ret
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


;@@@@@@@@@@@@@@@@@@ NUM_TO_STR:
; to translate a number in to an string
num_to_str:
    

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@























