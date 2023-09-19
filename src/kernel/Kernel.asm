jmp EnterProtectedMode

%include "GDT.asm"
%include "Print.asm"
%include "DetectMemory.asm"

EnterProtectedMode:
    call DetectMemory
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
[extern _start]

%include "IDT.asm"

Start64Bit:
    mov edi, 0xb8000
    mov rax, 0x1f201f201f201f20
    mov ecx, 500
    rep stosq

    call ActivateSSE
    call _start
    jmp $

ActivateSSE:
    mov rax, cr0
    and ax, 0b11111101
    or ax, 0b00000001
    mov cr0, rax

    mov rax, cr4
    or ax, 0b1100000000
    mov cr4, rax

    ret

times 2048-($-$$) db 0