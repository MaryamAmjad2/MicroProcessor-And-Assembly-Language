.model small
.data

.code

main proc
    mov ax, 10       ; Initialize AX with 10
    call DumpRegs   ; Display initial state

    ; Add 5 to AX
    add ax, 5        ; AX = 10 + 5 = 15
    call DumpRegs    ; Display flags after addition

    ; Subtract 20 from AX
    sub ax, 20       ; AX = 15 - 20 = -5 (signed 16-bit overflow)
    call DumpRegs    ; Display flags after subtraction

    ; Add 32767 to AX
    add ax, 32767    ; AX = -5 + 32767 = 32762
    call DumpRegs    ; Display flags after addition

    ; Subtract 1 from AX
    sub ax, 1        ; AX = 32762 - 1 = 32761
    call DumpRegs    ; Display flags after subtraction

    ; Subtract 32761 from AX
    sub ax, 32761    ; AX = 32761 - 32761 = 0
    call DumpRegs    ; Display flags after subtraction

    ; Add 1 to AX
    add ax, 1        ; AX = 0 + 1 = 1
    call DumpRegs    ; Display flags after addition

    ; Subtract 1 from AX
    sub ax, 1        ; AX = 1 - 1 = 0
    call DumpRegs    ; Display flags after subtraction

    ; Exit the program
    mov ah, 4Ch
    int 21h

main endp

; Procedure to display registers and flags
DumpRegs proc
    push ax
    push bx
    push cx
    push dx

    mov ah, 09h
    mov dx, offset RegisterOutput
    int 21h

    pop dx
    pop cx
    pop bx
    pop ax
    ret

RegisterOutput db "AX=$", 0
             db "BX=$", 0
             db "CX=$", 0
             db "DX=$", 0
             db "ZF=$", 0
             db "SF=$", 0
             db '$'

DumpRegs endp

end main
