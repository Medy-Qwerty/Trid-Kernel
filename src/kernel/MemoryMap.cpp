#pragma once
#include "Typedefs.cpp"

struct MemoryMapEntry {
    uint_64 BaseAddress;
    uint_64 RegionLength;
    uint_32 RegionType;
    uint_32 ExtendedAttributes;
};

extern uint_8 MemoryRegionCount;

MemoryMapEntry* UsableMemoryRegions[10];

void PrintMemoryMap(MemoryMapEntry* memoryMap, uint_16 position) {
    SetCursorPosition(position);

    PrintString("Memory Base: ", BACKGROUND_BLACK | FOREGROUND_CYAN); PrintString(IntegerToString(memoryMap->BaseAddress), BACKGROUND_BLACK | FOREGROUND_CYAN);
    SetCursorPosition(position + 80);
    PrintString("Region Length: ", BACKGROUND_BLACK | FOREGROUND_CYAN); PrintString(IntegerToString(memoryMap->RegionLength), BACKGROUND_BLACK | FOREGROUND_CYAN);
    SetCursorPosition(position + 160);
    PrintString("Memory Type: ", BACKGROUND_BLACK | FOREGROUND_CYAN); PrintString(IntegerToString(memoryMap->RegionType), BACKGROUND_BLACK | FOREGROUND_CYAN);
    SetCursorPosition(position + 240);
    PrintString("Memory Attributes: ", BACKGROUND_BLACK | FOREGROUND_CYAN); PrintString(IntegerToString(memoryMap->ExtendedAttributes), BACKGROUND_BLACK | FOREGROUND_CYAN);
    SetCursorPosition(position + 400);
}