@echo off
set BIN_PATH="%~dp0\bin
color F0
goto run

:run
color F6
echo Running...
bochs -f bochsrc.bxrc -q
color F2
echo Running Complete!
goto exit_main

:exit_main
echo.
echo Press any key to exit
pause>nul
exit