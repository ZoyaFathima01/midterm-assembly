; equation.asm
; Calculate result = (var1 + 2) / (var3 - var2)

section .data
    msg db "Result is: %d", 10, 0  ; format string for printf
    var1 dd 10
    var2 dd 3
    var3 dd 7
    result dd 0

section .text
    global main
    extern printf

main:
    mov eax, [var1]      ; eax = var1 (10)
    add eax, 2           ; eax = var1 + 2 = 12

    mov ebx, [var3]      ; ebx = var3 (7)
    sub ebx, [var2]      ; ebx = var3 - var2 = 7 - 3 = 4

    cdq                  ; sign extend eax to edx:eax (for division)
    idiv ebx             ; divide edx:eax by ebx

    mov [result], eax    ; store quotient (3) in result

    push eax             ; push quotient argument for printf
    push msg             ; push format string
    call printf          ; call printf
    add esp, 8           ; clean up stack

    mov eax, 1           ; exit syscall number
    xor ebx, ebx         ; status 0
    int 0x80             ; invoke kernel exit
