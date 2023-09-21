#pragma once
#include "Typedefs.h"

struct MemoryMapEntry {
    uint_64 BaseAddress;
    uint_64 RegionLength;
    uint_32 RegionType;
    uint_32 ExtendedAttributes;
};

extern uint_8 MemoryRegionCount;
uint_8 UsableMemoryRegionCount;

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

bool MemoryRegionsGot = false;

MemoryMapEntry** GetUsableMemoryRegions() {
    if (MemoryRegionsGot) {
        return UsableMemoryRegions;
    }

    uint_8 UsableRegionIndex;
    for (uint_8 i = 0; i < MemoryRegionCount; i++) {
        MemoryMapEntry* memMap = (MemoryMapEntry*)0x5000;
        memMap += i;
        if (memMap->RegionType == 1) {
            UsableMemoryRegions[UsableRegionIndex] = memMap;
            UsableRegionIndex++;
        }
        UsableMemoryRegionCount = UsableRegionIndex;
    }

    MemoryRegionsGot = true;
    return UsableMemoryRegions;
}