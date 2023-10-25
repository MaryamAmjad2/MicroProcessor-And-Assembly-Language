.model small
.data
array dd 1, 2, 3, 4, 5, 6, 7, 8, 9

.code
main PROC
    mov ax, @data
    mov ds, ax

    ; Point to the first and last array elements
    mov si, offset array         ; Beginning of array
    mov di, offset array + 36    ; End of array (9 elements * 4 bytes each)
    mov cx, 4                    ; Loop (N / 2) times

L1:
    ; Exchange array[si] with array[di], using indexed addressing.
    mov ax, [si]                ; AX = array[si]
    mov dx, [di]                ; DX = array[di]
    mov [si], dx                ; array[si] = array[di]
    mov [di], ax                ; array[di] = AX
    add si, 4                   ; First pointer moves forward (DWORD size)
    sub di, 4                   ; Second pointer moves backward (DWORD size)
    loop L1

    ; Optional: Display the array (for demonstration)
    mov si, offset array
    mov cx, 9                    ; Number of elements
    mov bx, 4                    ; Size of DWORD (4 bytes)
    call DumpMem

    ; Exit the program
    mov ah, 4Ch
    int 21h
main ENDP

DumpMem PROC
    ; Your DumpMem implementation here (not provided in TASM)

DumpMem 

END main
