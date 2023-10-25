.model small
.data

.code
main PROC
    mov ah, 1   ; AL = 1
    sub al, 1   ; AL = 0, SF = 0, ZF = 1
    call DumpRegs
    sub al, 1   ; AL = 255, SF = 1, ZF = 0 (due to two's complement representation)
    call DumpRegs
    add al, 1   ; AL = 0, SF = 0, ZF = 1
    call DumpRegs
    add al, 1   ; AL = 1, SF = 0, ZF = 0
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
    mov ah, 2

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
