; thanks mr nozari for your wanderfull course and videos
; peace be upon you

section .data
    msg db "thanks mr_nouzari for your wonderfull videos",0Ah
    len equ $ - msg

section .text
    global _start
_start:

    mov eax,4   ; syscall write
    mov ebx,1   ; file descriptor
    mov ecx,msg
    mov edx,len
    int 80h

exit:
    mov eax,1
    mov ebx,0
    int 80h

