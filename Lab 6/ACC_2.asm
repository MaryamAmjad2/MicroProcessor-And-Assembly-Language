.model small
.data

.code
main PROC
    mov al, 7Fh    ; AL = +127
    add al, 1      ; AL = -128, OF = 1
    call DumpRegs
    sub al, 1      ; AL = 7Fh, OF = 1
    call DumpRegs
    sub al, 1      ; AL = 7Eh, OF = 0
    call DumpRegs

    mov al, 80h    ; AL = -128
    add al, 1      ; AL = 81h, OF = 1
    call DumpRegs

    mov al, 80h    ; AL = -128
    add al, 80h    ; AL = 0, CF = 1, OF = 1
    call DumpRegs

    ; Exit the program
    mov ah, 4Ch
    int 21h
main ENDP

DumpRegs PROC
    push ax
    push bx
    push cx
    push dx

    ; Display the register values
    mov ah, 2
    mov dl, ' '
    int 21h

    mov dl, 'A'
    mov ah, 2
    int 21h

    mov dl, '='
    int 21h

    mov dl, ' '
    int 21h

    call DumpAL

    mov dl, ' '
    int 21h

    pop dx
    pop cx
    pop bx
    pop ax
    ret
DumpRegs ENDP

DumpAL PROC
    push ax
    call DumpHex
    pop ax
    ret
DumpAL ENDP

DumpHex PROC
    push ax
    push bx
    push cx
    push dx

    mov cx, 4
    mov bx, ax

NextDigit:
    shr bx, 4
    and bx, 0Fh
    add bx, '0'

    push bx
    mov dl, bl
    call DumpChar
    pop bx

    loop NextDigit

    pop dx
    pop cx
    pop bx
    pop ax
    ret
DumpHex ENDP

DumpChar PROC
    push ax
    push bx
    push cx
    push dx

    mov ah, 2
    int 21h

    pop dx
    pop cx
    pop bx
    pop ax
    ret
DumpChar ENDP

END main
