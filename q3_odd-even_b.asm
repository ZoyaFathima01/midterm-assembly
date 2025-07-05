section .data
    number db 7                ; The number to check (change this value to test)
    even_msg db "Even", 10, 0  ; Message for even result, newline and null terminator
    odd_msg  db "Odd", 10, 0   ; Message for odd result, newline and null terminator

section .text
    global _start              ; Required for linking and starting point

_start:
    ; Load the number into AL
    mov al, [number]           ; AL = number to check

    ; Clear AH for 8-bit division (DIV works on AX = AH:AL)
    xor ah, ah                 ; AH = 0

    ; Place 2 in BL (the divisor)
    mov bl, 2                  ; BL = 2

    ; Divide AX by BL (AL/BL), quotient in AL, remainder in AH
    div bl                     ; AL = quotient, AH = remainder

    ; Check if remainder (AH) is zero (even)
    cmp ah, 0                  ; Is remainder zero?
    je print_even              ; Jump if even

    ; If not zero, it's odd
print_odd:
    mov edx, 4                 ; Message length
    mov ecx, odd_msg           ; Message address
    mov ebx, 1                 ; File descriptor (stdout)
    mov eax, 4                 ; Syscall number (sys_write)
    int 0x80                   ; Write to stdout
    jmp end_program            ; End program

print_even:
    mov edx, 5                 ; Message length
    mov ecx, even_msg          ; Message address
    mov ebx, 1                 ; File descriptor (stdout)
    mov eax, 4                 ; Syscall number (sys_write)
    int 0x80                   ; Write to stdout

end_program:
    mov eax, 1                 ; Syscall number (sys_exit)
    xor ebx, ebx               ; Return code 0
    int 0x80                   ; Exit
