#include "TextPrint.cpp"
extern "C" void _start() {
    SetCursorPosition(PositionFromCoords(0, 0));
    PrintString("Welcome to Trid-Kernel v0.0.9\n\r\n\r", BACKGROUND_BLINKINGRED | FOREGROUND_LIGHTCYAN);

    PrintString("Hex to String Function Test: ");
    PrintString(HexToString(0x1234abcd));
    PrintString("\n\r");
    PrintString("String to Hex Function Test: ");
    PrintString(HexToString("Trid-Kernel"));
    return;
}