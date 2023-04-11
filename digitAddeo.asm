
section .data
    space   db " "
    even    dq 0
    odd     dq 0


section .bss                             
    num          resb   16
    num_result1   resb   16
    num_result2   resb   16

section .text
    global _start

;;;; converting the number to an string function ;;;;;
numStr1:
    sub     rdx, rdx    ; rdx is now zero
    mov     rbx, 10     ; rbx is now 10
    sub     rcx, rcx    ; rcx is now zero

nAgain1:
    cmp     rax,9
    jle     cEnd1        ; jump lesser or equal, just one digit remains
    div     rbx         ; deviding rax by rbx
    push    dx          ; baghi mande ke baiad addad beshe
    inc     cx          ; tedad ro mishmare
    sub     rdx, rdx
    jmp     nAgain1      ; chizi ke mikhaim alan tooie stacke

cEnd1:
    mov     rsi, num_result1     ; rsi hamishe index mikone
cAgain1:
    add     al, 0x30
    mov     [rsi],al
    inc     rsi
    dec     cx
    jl      nEnd1
    pop     ax
    jmp     cAgain1

nEnd1:
    ret



;;;; converting the number to an string function ;;;;;
numStr2:
    sub     rdx, rdx    ; rdx is now zero
    mov     rbx, 10     ; rbx is now 10
    sub     rcx, rcx    ; rcx is now zero

nAgain2:
    cmp     rax,9
    jle     cEnd2        ; jump lesser or equal, just one digit remains
    div     rbx         ; deviding rax by rbx
    push    dx          ; baghi mande ke baiad addad beshe
    inc     cx          ; tedad ro mishmare
    sub     rdx, rdx
    jmp     nAgain2      ; chizi ke mikhaim alan tooie stacke

cEnd2:
    mov     rsi, num_result2     ; rsi hamishe index mikone
cAgain2:
    add     al, 0x30
    mov     [rsi],al
    inc     rsi
    dec     cx
    jl      nEnd2
    pop     ax
    jmp     cAgain2

nEnd2:
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
    mov     ecx,2
    div     ecx
    cmp     edx,0
    je      isEven
    jmp     isOdd

isEven:
    mov     rbx,[even]
    mul     rcx
    add     rbx,rax
    mov     [even],rbx
    inc     rsi
    jmp     sAgain
isOdd:
    mov     rbx,[odd]
    mul     rcx
    inc     rax
    add     rbx,rax
    mov     [odd],rbx
    inc     rsi
    jmp     sAgain

sEnd:
    mov     rax,[odd]

    call    numStr1

    mov     eax, 4
    mov     ebx, 1    
    mov     ecx, num_result1
    mov     edx, 16
    int     80h

    mov     eax, 4
    mov     ebx, 1    
    mov     ecx, space
    mov     edx, 1
    int     80h



    mov     rax,[even]
    call    numStr2

    mov     eax, 4
    mov     ebx, 1    
    mov     ecx, num_result2
    mov     edx, 16
    int     80h


    mov     eax,1
    mov     ebx,0
    int     80h