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
x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o %BUILD_PATH%\KernelCPP.o"
if errorlevel 1 goto error_kernel
x86_64-elf-ld -o %BUILD_PATH%\Kernel.tmp" -Ttext 0x7e00 %BUILD_PATH%\KernelASM.o" %BUILD_PATH%\KernelCPP.o"
if errorlevel 1 goto error_kernel
x86_64-elf-objcopy -O binary %BUILD_PATH%\Kernel.tmp" %BUILD_PATH%\Kernel.bin"
if errorlevel 1 goto error_kernel
cd ..
cd ..
copy /b %BUILD_PATH%\Bootloader.bin"+%BUILD_PATH%\Kernel.bin" %BIN_PATH%\Kernel.flp
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