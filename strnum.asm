; a program to convert an string to a number
; in assembly
; mhmdjavad safi/ 7 farvardin 1402


section .data
    UserMsg      db "please enter a number : ",10    ; ask user to enter a number
    lenUserMsg   equ $ - UserMsg                     ; len of the massage
    DispMsg      db  "you have entered : ",10        ; display massage
    lenDisMsg    equ $ - DispMsg
    newLineC      db 0xA,0xD                          ; for the newline
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .bss                                         ; ununitialized data
    num          resb   16                           ; number but as a string :/
    num_result   resb   16                           ; converted to the number
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
    mov     rsi, num                                     ; the index counter

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







;;;;;;;;; now lets start ;;;;;;;;;;;;;;;
_start:
    mov     eax, 4
    mov     ebx, 1    
    mov     ecx, UserMsg
    mov     edx, lenUserMsg
    int     80h


    ; read the input
    mov     eax, 3
    mov     ebx, 2
    mov     ecx, num
    mov     edx, 16
    int     80h

    ; convert it to the number that we want:
    call     strNum     ; the number that we want is now in the rax
    push     rax

    ; massage before output:
    mov     eax, 4
    mov     ebx, 1    
    mov     ecx, DispMsg
    mov     edx, lenDisMsg
    int     80h    

    pop     rax
    call    numStr

    ; the last number
    mov     eax, 4
    mov     ebx, 1    
    mov     ecx, num_result
    mov     edx, 16
    int     80h 






    ; done
    call newLine
    mov eax,1
    mov ebx,0
    int 80h

















