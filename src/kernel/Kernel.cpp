#include "TextPrint.cpp"
extern "C" void _start() {
    SetCursorPosition(PositionFromCoords(0, 0));
    PrintString("Welcome to Trid-Kernel v0.0.9\n\r");
    return;
}