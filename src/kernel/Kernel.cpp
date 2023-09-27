#include "TextPrint.h"
#include "IDT.h"
#include "Keyboard.h"
#include "MemoryMap.h"
#include "Heap.h"

extern const char Test[];
extern const char Logo[];

extern "C" void _start() {
    ClearScreen();
    SetCursorPosition(PositionFromCoords(0, 0));
    MainKeyboardHandler = KeyboardHandler;
    InitializeIDT();
    InitializeHeap(0x100000, 0x100000);
    void* TestMemoryAddress = malloc(0x10);
    void* TestMemoryAddress2 = malloc(0x10);
    void* TestMemoryAddress3 = malloc(0x10);
    void* TestMemoryAddress4 = malloc(0x60);
    free(TestMemoryAddress);
    free(TestMemoryAddress2);
    free(TestMemoryAddress3);
    free(TestMemoryAddress4);

    PrintString(Logo, BACKGROUND_BLINKINGGREEN | FOREGROUND_LIGHTCYAN);
    PrintString("\n\r");
    PrintString("Welcome to Trid-Kernel Beta v0.2.2\n\r\n\r", BACKGROUND_BLINKINGGREEN | FOREGROUND_LIGHTCYAN);

    PrintString("Hex to String Function Test: ");
    //PrintString(HexToString(0x1234abcd), BACKGROUND_BLUE | FOREGROUND_RED);
    PrintString("\n\r");
    PrintString("String to Hex Function Test: ");
    //PrintString(HexToString("Trid-Kernel"), BACKGROUND_BLUE | FOREGROUND_RED);
    PrintString("\n\r");
    PrintString(Test);

    PrintString("\n\r");
    PrintString("Integer to String Function Test: ");
    PrintString(IntegerToString(123456789), BACKGROUND_BLUE | FOREGROUND_RED);
    PrintString(" : ");
    PrintString(IntegerToString(-123456789), BACKGROUND_BLUE | FOREGROUND_RED);

    PrintString("\n\r");
    float testFloat = 3.7f;
    float testFloatNegative = -3.7f;
    PrintString("Float to String Function Test: ");
    PrintString(FloatToString(testFloat, 2), BACKGROUND_BLUE | FOREGROUND_RED);
    PrintString(" : ");
    PrintString(FloatToString(testFloatNegative, 2), BACKGROUND_BLUE | FOREGROUND_RED);

    PrintString("\n\r");
    PrintString("Memory Entry Count: ");
    PrintString(IntegerToString(MemoryRegionCount), BACKGROUND_BLUE | FOREGROUND_RED);
    //PrintString("\n\r");
    //PrintString("Memory Regions: \n");
    //MemoryMapEntry** usableMemoryMaps = GetUsableMemoryRegions();

    //for (uint_8 i = 0; i < UsableMemoryRegionCount; i++) {
        //MemoryMapEntry* memMap = usableMemoryMaps[i];
        //PrintMemoryMap(memMap, CursorPosition);
   //}

    PrintString("\n\r");
    PrintString("Testing Dynamic Memory: ");
    PrintString("Malloc: ");
    PrintString(HexToString((uint_64)TestMemoryAddress), BACKGROUND_BLUE | FOREGROUND_RED);

    PrintString("\n\r");
    PrintString("IDT Test: ");
    return;
}