
.model small
.data
    ; Define symbolic names for string literals
    greetingMsg db 'Hello, ', 0
    nameMsg db 'John', 0
    ageMsg db 'Age: ', 0
    ageValue db '30', 0

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display the greeting
    mov ah, 09h       ; Function to print a string
    lea dx, greetingMsg
    int 21h

    ; Display the name
    lea dx, nameMsg
    int 21h

    ; Display the age label
    lea dx, ageMsg
    int 21h

    ; Display the age value
    lea dx, ageValue
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h
main endp

end main
