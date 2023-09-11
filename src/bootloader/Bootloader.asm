mov bp, 0x7c00
mov sp, bp

mov bx, WelcomeString
call PrintFunction

jmp $

PrintFunction:
    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    ret

WelcomeString:
    db 'Trid-Kernel Alpha v0.0.2',0

times 510-($-$$) db 0

dw 0xaa55