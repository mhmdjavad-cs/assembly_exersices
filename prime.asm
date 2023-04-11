
section .data
    no  db "No"
    yes db "Yes"
    number dq 0


section .bss
    string resb 16


section .text
    global _start


;;;; converting the string to an integer function ;;;;
strNum:
    xor     rax, rax                                     ; making rax a zero register
    mov     rdx, 0                                       ; the result will be here
    mov     rsi, rbx                                     ; the index counter

sAgain:
    mov     al, [rsi]
    cmp     al, 0xA
    je      sEnd
    sub     al, 0x30
    imul    rdx, 10
    add     rdx, rax
    inc     rsi
    jmp     sAgain
sEnd:
    mov     rax,rdx
    ret




_start:

        ; read the input
    mov     eax, 3
    mov     ebx, 2
    mov     ecx, string
    mov     edx, 16
    int     80h



    mov     rbx, string
    call    strNum
    mov     [number], rax

    mov     rcx, rax
    dec     rcx
    cmp     rcx,1
    jle     isPrime

loop:
    mov     rax,[number]
    sub     rdx,rdx
    div     rcx
    cmp     rdx,0
    je      notPrime
    dec     rcx
    cmp     rcx,1
    je      isPrime
    jmp     loop

notPrime:
    mov     eax, 4
    mov     ebx, 1    
    mov     ecx, no
    mov     edx, 2
    int     80h
    jmp     end

isPrime:
    mov     eax, 4
    mov     ebx, 1    
    mov     ecx, yes
    mov     edx, 3
    int     80h
    jmp     end


end:
    mov     eax,1
    mov     ebx,0
    int     80h