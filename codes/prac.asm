.model small
.data
.code

ORG 100h ; Set the origin address to 0x100

main PROC
    MOV AX, 5      ; Load 5 into AX
    MOV BX, 10     ; Load 10 into BX
    ADD AX, BX     ; Add BX to AX
    MOV BX, 15     ; Load 15 into BX
    MOV AH, 4Ch    ; Set AH to 4C (DOS exit function)
    INT 21h        ; Invoke the DOS interrupt

    RET
main ENDP

END main
