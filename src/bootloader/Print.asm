PrintFunction:
    push ax
    push bx
    
    mov ah, 0x0e
    .Loop:
        cmp [bx], byte 0
        je .Exit
        mov al, [bx]
        int 0x10
        inc bx
        jmp .Loop
    .Exit:
        pop ax
        pop bx

        ret

WelcomeString:
    db 'Trid-Kernel Alpha v0.0.4',0
