; var1 = 10
; var2 = 3
; var3 = 7
; result = (10 + 2) / (7 - 3) = 12 / 4 = 3

section .data
    msg db "Result is: %d", 10, 0     ; format string with newline
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

    cdq                  ; sign extend eax into edx:eax
    idiv ebx             ; eax = eax / ebx, edx = remainder

    mov [result], eax    ; store quotient in result

    push eax             ; push quotient for printf
    push msg             ; push format string
    call printf          ; call printf
    add esp, 8           ; clean stack after call

    mov eax, 1           ; syscall: exit
    xor ebx, ebx         ; status 0
    int 0x80             ; exit program
