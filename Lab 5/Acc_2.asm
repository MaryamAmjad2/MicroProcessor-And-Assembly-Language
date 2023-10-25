.model small
.data
    daySymbols db 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'  ; 
    daysOfWeek db 0, 1, 2, 3, 4, 5, 6 

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 7  ; Number of days in a week
    mov si, 0  ; Initialize the index
printDays:
    mov ah, 09h  ; Function to print a string
    lea dx, [daySymbols + si]  ; Load address of the day string
    int 21h

    mov ah, 02h  ; Function to print a character
    mov dl, 0Ah  ; ASCII code for newline
    int 21h

    ; Increment the index and loop
    inc si
    loop printDays

    ; Exit the program
    mov ah, 4Ch
    int 21h
main endp

end main
