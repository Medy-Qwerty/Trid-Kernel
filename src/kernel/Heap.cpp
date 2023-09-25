#include "Heap.h"

MemorySegmentHeader* FirstFreeMemorySegment;

void InitializeHeap(uint_64 heapAddress, uint_64 heapLength) {
    FirstFreeMemorySegment = (MemorySegmentHeader*)heapAddress;
    FirstFreeMemorySegment->MemoryLength = heapLength;
    FirstFreeMemorySegment->NextSegment = 0;
    FirstFreeMemorySegment->PreviousSegment = 0;
    FirstFreeMemorySegment->NextFreeSegment = 0;
    FirstFreeMemorySegment->PreviousFreeSegment = 0;
    FirstFreeMemorySegment->Free = true;
}

void* malloc(uint_64 size) {
    uint_64 remainder = size % 8;
    size -= remainder;
    if (remainder != 0) size += 8;
}