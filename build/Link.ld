OUTPUT_FORMAT(binary)

ENTRY(_start)

INPUT
(
    KernelASM.o
    KernelCPP.o
)

OUTPUT
(
    Kernel.bin
)