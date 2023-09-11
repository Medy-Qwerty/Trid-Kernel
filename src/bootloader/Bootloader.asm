call PrintString

jmp $


PrintString:
    ret

WelcomeString:
    db 'Trid-Kernel Alpha v0.0.2',0

times 510-($-$$) db 0

dw 0xaa55