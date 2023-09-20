#include "TextPrint.cpp"
#include "IDT.cpp"
#include "Keyboard.cpp"
#include "MemoryMap.cpp"

extern const char Test[];
extern const char Logo[];

extern "C" void _start() {
    ClearScreen();
    SetCursorPosition(PositionFromCoords(0, 0));
    PrintString(Logo, BACKGROUND_BLINKINGGREEN | FOREGROUND_LIGHTCYAN);
    PrintString("\n\r");
    PrintString("Welcome to Trid-Kernel Beta v0.1.7\n\r\n\r", BACKGROUND_BLINKINGGREEN | FOREGROUND_LIGHTCYAN);

    PrintString("Hex to String Function Test: ");
    PrintString(HexToString(0x1234abcd));
    PrintString("\n\r");
    PrintString("String to Hex Function Test: ");
    PrintString(HexToString("Trid-Kernel"));
    PrintString("\n\r");
    PrintString(Test);

    PrintString("\n\r");
    PrintString("Integer to String Function Test: ");
    PrintString(IntegerToString(123456789));
    PrintString(" : ");
    PrintString(IntegerToString(-123456789));

    PrintString("\n\r");
    float testFloat = 3.7f;
    float testFloatNegative = -3.7f;
    PrintString("Float to String Function Test: ");
    PrintString(FloatToString(testFloat, 2));
    PrintString(" : ");
    PrintString(FloatToString(testFloatNegative, 2));

    PrintString("\n\r");
    PrintString("Memory Entry Count: ");
    PrintString(IntegerToString(MemoryRegionCount));
    PrintString("\n\r");
    PrintString("Memory Regions: \n\r");
    for (uint_8 i = 0; i < MemoryRegionCount; i++) {
        MemoryMapEntry* memMap = (MemoryMapEntry*)0x5000;
        memMap += i;
        PrintMemoryMap(memMap, CursorPosition);
    }

    PrintString("\n\r");
    PrintString("IDT Test: ");
    MainKeyboardHandler = KeyboardHandler;
    InitializeIDT();
    return;
}