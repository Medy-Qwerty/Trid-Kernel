mov ah, 0x0e

mov al, 'T'
int 0x10

mov al, 'r'
int 0x10

mov al, 'i'
int 0x10

mov al, 'd'
int 0x10

mov al, '-'
int 0x10

mov al, 'K'
int 0x10

mov al, 'e'
int 0x10

mov al, 'r'
int 0x10

mov al, 'n'
int 0x10

mov al, 'e'
int 0x10

mov al, 'l'
int 0x10

jmp $

times 510-($-$$) db 0

dw 0xaa55