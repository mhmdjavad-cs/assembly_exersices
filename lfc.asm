

section .data
    newLineC    db 0xA,0xD
    int_a   dq 0
    int_b   dq 0
    gcd     dq 0

section .bss
    numa    resb 16
    numb    resb 16
    num_result  resb 16




section .text
    global _start

;;;;;;;;;;;;; new line function ;;;;;;;;;;;;;;;;;;;;;;
newLine:
    push    rax
    ;----------
    mov     eax, 4                                   ; 4 syscall of writing
    mov     ebx, 1                                   ; 1 for writing in the console
    mov     ecx, newLineC                            ; the massage to write
    mov     edx, 2                                   ; length of the massage
    int     80h
    ;----------
    pop     rax
    ret

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
    mov     ecx, numa
    mov     edx, 16
    int     80h

    ; read the input
    mov     eax, 3
    mov     ebx, 2
    mov     ecx, numb
    mov     edx, 16
    int     80h

    mov     rbx, numa
    call    strNum
    push    rax

    mov     rbx, numb
    call    strNum
    push    rax

    pop     rbx
    pop     rax

    cmp     rax, rbx
    jl      swap
    jmp     continue

swap:
    push rax
    push rbx
    pop  rax
    pop  rbx

continue:

    mov     [int_a], rax
    mov     [int_b], rbx



    mov     rcx, [int_b]     ; rcx is the counter and is the smaller number
loop:
    mov     rax, [int_a]
    sub     rdx,rdx
    div     rcx
    cmp     rdx,0
    je      condition1
    dec     rcx
    jmp     loop

condition1:
    mov     rax, [int_b]
    sub     rdx,rdx
    div     rcx
    cmp     rdx,0
    je      continue2
    dec     rcx
    jmp     loop


continue2:
    mov     [gcd],rcx
    mov     rax, [int_a]
    mov     rbx, [int_b]
    mul     rbx
    mov     rcx,[gcd]
    div     rcx


print:
    call    numStr

    mov     eax, 4
    mov     ebx, 1    
    mov     ecx, num_result
    mov     edx, 16
    int     80h


; end
    mov     eax,1
    mov     ebx,0
    int     80h


