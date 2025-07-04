; var1 = 10
; var2 = 3
; var3 = 7
; result = (10 + 2) / (7 - 3) = 12 / 4 = 3

section .data
    msg db "Result is: %d", 10, 0
    var1 dd 10
    var2 dd 3
    var3 dd 7
    result dd 0

section .text
    global main
    extern printf

main:
    mov eax, [var1]      ; eax = var1
    add eax, 2           ; eax = var1 + 2
    mov ebx, [var3]
    sub ebx, [var2]      ; ebx = var3 - var2

    cdq                  ; Sign extend eax into edx:eax
    idiv ebx             ; eax = eax / ebx

    mov [result], eax    ; Store quotient (result) in memory

    push eax             ; Push result to stack
    push msg             ; Push format string
    call printf
    add esp, 8           ; Clean up stack

mov eax, 1       ; syscall number for exit
xor ebx, ebx     ; exit code 0
int 0x80         ; call Linux kernel to exit
