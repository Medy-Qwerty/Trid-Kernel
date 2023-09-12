[org 0x7c00]

mov [BOOT_KERNEL], dl

mov bp, 0x7c00
mov sp, bp

mov bx, WelcomeString
call PrintFunction

call ReadKernel

jmp $

%include "Print.asm"
%include "KernelLDR.asm"

times 510-($-$$) db 0

dw 0xaa55