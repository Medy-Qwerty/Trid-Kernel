#pragma once
#include "Typedefs.h"
#include "TextPrint.cpp"


bool LeftShiftPressed = false;
bool RightShiftPressed = false;
uint_8 LastScanCode;


void StandardKeyboardHandler(uint_8 scanCode, uint_8 chr);
void KeyboardHandler0xE0(uint_8 scanCode);
void KeyboardHandler(uint_8 scanCode, uint_8 chr);