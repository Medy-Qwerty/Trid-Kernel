#include "TextPrint.cpp"
#include "IDT.cpp"

extern const char Test[];
extern const char Logo[];

void KeyboardHandler(uint_8 scanCode, uint_8 chr) {
    if (chr != 0) {
        PrintChar(chr);
    }
    else {
        switch (scanCode) {
            case 1:
                
        }
    }
}

extern "C" void _start() {
    ClearScreen();
    SetCursorPosition(PositionFromCoords(0, 0));
    PrintString(Logo, BACKGROUND_BLINKINGRED | FOREGROUND_LIGHTCYAN);
    PrintString("\n\r");
    PrintString("Welcome to Trid-Kernel Alpha v0.1.3\n\r\n\r", BACKGROUND_BLINKINGRED | FOREGROUND_LIGHTCYAN);

    PrintString("Hex to String Function Test: ");
    PrintString(HexToString(0x1234abcd));
    PrintString("\n\r");
    PrintString("String to Hex Function Test: ");
    PrintString(HexToString("Trid-Kernel"));
    PrintString("\n\r");
    PrintString(Test);

    PrintString("\n\r");
    PrintString("IDT Test: ");
    MainKeyboardHandler = KeyboardHandler;
    InitializeIDT();
    return;
}