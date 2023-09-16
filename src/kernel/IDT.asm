[extern _idt]
idtDescriptor:
    dw 4095
    dq _idt

isr1:
    iretq
    GLOBAL isr1

LoadIDT:
    lidt[idtDescriptor]
    sti
    ret
    GLOBAL LoadIDT