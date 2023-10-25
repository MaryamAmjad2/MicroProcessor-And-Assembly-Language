.model small
.data
    arraySize   equ 50
    array       dw arraySize dup(0)   ; Define an array of 50 elements

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Seed the random number generator
    call srand

    ; Fill the array with random integers and display values
    mov cx, arraySize
    lea si, array

fillAndDisplayLoop:
    call random
    mov [si], ax  ; Store the random value in the array
    call displayInt

    ; Print a newline character for clarity
    mov ah, 02h
    mov dl, 0Ah
    int 21h

    add si, 2
    loop fillAndDisplayLoop

    ; Exit the program
    mov ah, 4Ch
    int 21h

main endp

; Function to display a 16-bit word
displayWord proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 10

displayWordLoop:
    xor dx, dx
    div cx
    add dl, '0'
    push dx
    inc di
    test ax, ax
    jnz displayWordLoop

printDigitsLoop:
    pop dx
    mov ah, 02h
    int 21h
    dec di
    jnz printDigitsLoop

    pop dx
    pop cx
    pop bx
    pop ax
    ret
displayWord endp

; Function to display an integer
displayInt proc
    push ax
    push bx
    push cx
    push dx

    mov ax, [si]
    call displayWord

    pop dx
    pop cx
    pop bx
    pop ax
    ret
displayInt endp
; Function to generate a random number
random proc
    mov ax, [si]
    xor dx, dx
    mov cx, 16807
    mul cx
    mov ax, dx
    mov dx, ax
    and ax, 32767 ; Keep the result in the positive range
  ; Keep the result in the positive range
    mov [si], ax
    ret
random endp

; Function to seed the random number generator
srand proc
    mov ax, 16962 ; Decimal equivalent of 0x4242
    mov dx, 16962
    mov [si], ax
    ret
srand endp

end main
