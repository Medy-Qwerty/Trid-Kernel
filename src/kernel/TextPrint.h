#pragma once
#include "IO.h"
#include "Typedefs.h"
#include "TextModeColorCodes.h"
#define VGA_MEMORY (uint_8*)0xb8000
#define VGA_WIDTH 80

uint_16 CursorPosition;
uint_8 test;
void ClearScreen(uint_64 ClearColor = BACKGROUND_BLUE | FOREGROUND_WHITE);
void SetCursorPosition(uint_16 position);
uint_16 PositionFromCoords(uint_8 x, uint_8 y);
void PrintString(const char* str, uint_8 color = BACKGROUND_BLUE | FOREGROUND_WHITE);
void PrintChar(char chr, uint_8 color = BACKGROUND_BLUE | FOREGROUND_WHITE);
const char* FloatToString(float value, uint_8 decimalPlaces);