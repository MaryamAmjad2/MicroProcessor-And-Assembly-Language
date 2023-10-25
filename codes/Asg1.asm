.model small
.data
.code

ORG 100h ; Set the origin address to 0x100 
main PROC 
mov ax,5
mov bx,10
add ax,bx
MOV AH, 4Ch    ; Set AH to 4C (DOS exit function)
INT 21h        ; Invoke the DOS interrupt
    RET
main ENDP

END main
