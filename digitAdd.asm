
section .bss                             
    num          resb   16
    num_result   resb   16

section .text
    global _start

;;;; converting the number to an string function ;;;;;
numStr:
    sub     rdx, rdx    ; rdx is now zero
    mov     rbx, 10     ; rbx is now 10
    sub     rcx, rcx    ; rcx is now zero

nAgain:
    cmp     rax,9
    jle     cEnd        ; jump lesser or equal, just one digit remains
    div     rbx         ; deviding rax by rbx
    push    dx          ; baghi mande ke baiad addad beshe
    inc     cx          ; tedad ro mishmare
    sub     rdx, rdx
    jmp     nAgain      ; chizi ke mikhaim alan tooie stacke

cEnd:
    mov     rsi, num_result     ; rsi hamishe index mikone
cAgain:
    add     al, 0x30
    mov     [rsi],al
    inc     rsi
    dec     cx
    jl      nEnd
    pop     ax
    jmp     cAgain

nEnd:
    ret






_start:

    ; read the input
    mov     eax, 3
    mov     ebx, 2
    mov     ecx, num
    mov     edx, 16
    int     80h





    xor     rax, rax                                     ; making rax a zero register
    mov     rdx, 0                                       ; the result will be here
    mov     rsi, num                                     ; the index counter

sAgain:
    mov     al, [rsi]
    cmp     al, 0xA
    je      sEnd
    sub     al, 0x30
    ;imul    rdx, 10
    add     rdx, rax
    inc     rsi
    jmp     sAgain
sEnd:
    mov     rax,rdx

    call    numStr

    mov     eax, 4
    mov     ebx, 1    
    mov     ecx, num_result
    mov     edx, 16
    int     80h


    mov     eax,1
    mov     ebx,0
    int     80h
