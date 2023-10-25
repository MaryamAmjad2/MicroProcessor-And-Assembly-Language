.model small
.data
var1 BYTE 10h

var2 SBYTE -14
var3 WORD 0x2000
var4 SWORD 2345
var5 DWORD 0x12345678
var6 SDWORD -2342423
var7 FWORD 0
var8 QWORD 0x1234567812345678
var9 TBYTE 1000000000123456789Ah
var10 REAL4 -1.25
var11 REAL8 3.2E+100
var12 REAL10 -6.223424E-2343

.code
main PROC
    ; Your code here

    ; Exit the program
    mov ah, 4Ch
    int 21h
main ENDP

END main
