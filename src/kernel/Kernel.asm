[org 0x7e00]

mov bx, KernelLoadedString
call PrintFunction

jmp $

%include "Print.asm"

KernelLoadedString:
    db 'Kernel Loaded!',0

times 2048-($-$$) db 0