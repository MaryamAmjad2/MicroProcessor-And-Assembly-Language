.model small
.data
Uarray DW 1000h, 2000h, 3000h, 4000h
Sarray DW -1, -2, -3, -4 ; Define signed words

.code
main PROC
; Move with zero extension:
mov ax, [Uarray]
mov bx, [Uarray+2]
mov cx, [Uarray+4]
mov dx, [Uarray+6]
call DumpRegs

; Move with sign extension:
mov ax, [Sarray]
mov bx, [Sarray+2]
mov cx, [Sarray+4]
mov dx, [Sarray+6]
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
