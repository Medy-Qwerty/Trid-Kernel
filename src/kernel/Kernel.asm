[org 0x7e00]

mov bx, KernelLoadedString
call PrintFunction

jmp EnterProtectedMode

%include "GDT.asm"
%include "Print.asm"

KernelLoadedString:
    db 'Kernel Loaded!',0

EnterProtectedMode:
    cli
    jmp $

EnableA20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

times 2048-($-$$) db 0