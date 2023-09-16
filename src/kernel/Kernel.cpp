#include "TextPrint.cpp"
#include "IDT.cpp"

extern const char Test[];
extern const char Logo[];

extern "C" void _start() {
    ClearScreen();
    SetCursorPosition(PositionFromCoords(0, 0));
    PrintString(Logo, BACKGROUND_BLINKINGRED | FOREGROUND_LIGHTCYAN);
    PrintString("\n\r");
    PrintString("Welcome to Trid-Kernel Alpha v0.1.1\n\r\n\r", BACKGROUND_BLINKINGRED | FOREGROUND_LIGHTCYAN);

    PrintString("Hex to String Function Test: ");
    PrintString(HexToString(0x1234abcd));
    PrintString("\n\r");
    PrintString("String to Hex Function Test: ");
    PrintString(HexToString("Trid-Kernel"));
    PrintString("\n\r");
    PrintString(Test);

    InitializeIDT();
    return;
}