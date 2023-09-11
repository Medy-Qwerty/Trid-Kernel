@echo off
title Trid-Kernel Compiler tool
set BIN_PATH="%~dp0\bin
set SRC_PATH="%~dp0\src
color F0
goto compileBLDR

REM Compiling Bootloader
:compileBLDR
color F6
echo Compiling Bootloader...
cd %SRC_PATH%
cd bootloader
nasm Bootloader.asm -f bin -o %BIN_PATH%\Kernel.flp"
if errorlevel 1 goto error_bldr
color F2
echo Compiling Bootloader Complete!
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