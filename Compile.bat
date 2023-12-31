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
nasm Kernel.asm -f elf64 -i src -o %BUILD_PATH%\KernelASM.o"
if errorlevel 1 goto error_kernel
nasm Binaries.asm -f elf64 -i src -o %BUILD_PATH%\Binaries.o"
if errorlevel 1 goto error_kernel
cd ..
cd ..
cmake CMakeLists.txt -G "Unix Makefiles" -D CMAKE_CXX_COMPILER=x86_64-elf-gcc -D CMAKE_C_COMPILER=x86_64-elf-gcc
if errorlevel 1 goto error_kernel
make -f "Makefile"
if errorlevel 1 goto error_kernel
cd build
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