[org 0x7e00]

mov bx, KernelLoadedString
call PrintFunction

jmp EnterProtectedMode

%include "GDT.asm"
%include "Print.asm"

KernelLoadedString:
    db 'Kernel Loaded!',0

EnterProtectedMode:
    call EnableA20
    cli
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp codeseg:StartProtectedMode

EnableA20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

[bits 32]

%include "CPUID.asm"
%include "SimplePaging.asm"

StartProtectedMode:
    mov ax, dataseg
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp

    mov [0xb8000], byte 'T'
    mov [0xb8002], byte 'r'
    mov [0xb8004], byte 'i'
    mov [0xb8006], byte 'd'
    mov [0xb8008], byte '-'
    mov [0xb800a], byte 'K'
    mov [0xb800c], byte 'e'
    mov [0xb800e], byte 'r'
    mov [0xb8010], byte 'n'
    mov [0xb8012], byte 'e'
    mov [0xb8014], byte 'l'

    call DetectCPUID
    call DetectLongMode
    call SetUpIdentityPaging
    call EditGDT
    jmp codeseg:Start64Bit

[bits 64]

Start64Bit:
    mov edi, 0xb8000
    mov rax, 0x1f201f201f201f20
    mov ecx, 500
    rep stosq
    jmp $

times 2048-($-$$) db 0