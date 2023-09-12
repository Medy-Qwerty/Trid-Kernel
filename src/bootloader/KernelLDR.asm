KERNEL_SPACE equ 0x7e00

ReadKernel:
    mov bx, KERNEL_SPACE
    mov al, 4
    mov dl, [BOOT_KERNEL]
    mov ch, 0x00
    mov dh, 0x00
    mov cl, 0x02

    int 0x13

    jc KernelLoadFailed

    ret

BOOT_KERNEL:
    db 0

KernelLoadFailedString:
    db 'Kernel Load Failed!',0

KernelLoadFailed:
    mov bx, KernelLoadFailedString
    call PrintFunction

    jmp $