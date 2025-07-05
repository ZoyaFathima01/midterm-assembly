section .data
    number db 7                       ; The number to check (change this value to test)
    even_msg db "even number", 10, 0  ; Message for even number, newline and null terminator
    odd_msg  db "odd number", 10, 0   ; Message for odd number, newline and null terminator

section .text
    global _start                     ; Program entry point for Linux

_start:
    mov al, [number]           ; Load the number to check into AL register
    xor ah, ah                 ; Clear AH for 8-bit division (AX = AH:AL)
    mov bl, 2                  ; Store divisor 2 in BL
    div bl                     ; Divide AX by BL; quotient in AL, remainder in AH

    cmp ah, 0                  ; Compare remainder (AH) to 0
    je print_even              ; If remainder is 0, it's even; jump to print_even

print_odd:
    mov edx, 11                ; Length of "odd number\n"
    mov ecx, odd_msg           ; Message address
    mov ebx, 1                 ; File descriptor (stdout)
    mov eax, 4                 ; Syscall number (sys_write)
    int 0x80                   ; Write to stdout
    jmp end_program            ; End program

print_even:
    mov edx, 12                ; Length of "even number\n"
    mov ecx, even_msg          ; Message address
    mov ebx, 1                 ; File descriptor (stdout)
    mov eax, 4                 ; Syscall number (sys_write)
    int 0x80                   ; Write to stdout

end_program:
    mov eax, 1                 ; Syscall number (sys_exit)
    xor ebx, ebx               ; Return code 0
    int 0x80                   ; Exit
