@echo off
title Trid-Kernel Compiler tool
set BIN_PATH="%~dp0\bin
set BUILD_PATH="%~dp0\build
set SRC_PATH="%~dp0\src
color F0
goto compileBLDR

REM Compiling Bootloader
:compileBLDR
color F6
echo Compiling Bootloader...
cd %SRC_PATH%
cd bootloader
nasm Bootloader.asm -f bin -o %BUILD_PATH%\Bootloader.bin"
if errorlevel 1 goto error_bldr
cd ..
echo Compiling Kernel...
cd kernel
nasm Kernel.asm -f elf64 -o %BUILD_PATH%\KernelASM.o"
if errorlevel 1 goto error_kernel
nasm Binaries.asm -f elf64 -o %BUILD_PATH%\Binaries.o"
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o %BUILD_PATH%\KernelCPP.o"
if errorlevel 1 goto error_kernel
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "IDT.cpp" -o %BUILD_PATH%\IDT.o"
if errorlevel 1 goto error_kernel
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "IO.cpp" -o %BUILD_PATH%\IO.o"
if errorlevel 1 goto error_kernel
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "Keyboard.cpp" -o %BUILD_PATH%\Keyboard.o"
if errorlevel 1 goto error_kernel
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "MemoryMap.cpp" -o %BUILD_PATH%\MemoryMap.o"
if errorlevel 1 goto error_kernel
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "TextPrint.cpp" -o %BUILD_PATH%\TextPrint.o"
if errorlevel 1 goto error_kernel
cd ..
cd ..
cd build
x86_64-elf-ld -T"Link.ld"
if errorlevel 1 goto error_split
copy /b Bootloader.bin+Kernel.bin %BIN_PATH%\Kernel.flp
if errorlevel 1 goto error_split
color F2
echo Compiling Complete!
goto exit_main

:exit_main
echo.
echo Press any key to continue
pause>nul
exit

:error_bldr
color F4
echo.
echo ERROR while compiling Bootloader
goto exit_main

:error_kernel
color F4
echo.
echo ERROR while compiling Kernel
goto exit_main

:error_split
color F4
echo.
echo ERROR while splitting code
goto exit_main