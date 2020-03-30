#include "myLib.h"
// TODO 2.0
#include "furtherTrees.h"
// TODO 4.0
#include "trees.h"
// Prototypes
void initialize();
void game();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Horizontal Offset
unsigned short hOff;


int main() {

    initialize();

    while(1) {

        game();

        oldButtons = buttons;
        buttons = BUTTONS;
	}
}

// Initialize the game on first launch
void initialize() {



    // TODO 2.1 - set up display control register
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    // TODO 4.1 - edit display control register to enable bg 0
    REG_DISPCTL = REG_DISPCTL | BG0_ENABLE;

    // TODO 2.2 - load tile palette
    DMANow(3, furtherTreesPal, PALETTE, 256);

    // TODO 2.3 - set up bg 1 control register
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_SMALL | BG_4BPP;
    // TODO 2.4 - load furtherTrees tiles to charblock
    DMANow(3, furtherTreesTiles, &CHARBLOCK[0], furtherTreesTilesLen/2);
    // TODO 2.5 - load furtherTrees map to screenblock
    DMANow(3, furtherTreesMap, &SCREENBLOCK[16], furtherTreesMapLen/2);
    // TODO 4.2 - set up bg 0 control register
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(17) | BG_SIZE_WIDE | BG_4BPP;
    // TODO 4.3 - load trees tiles to charblock
    DMANow(3, treesTiles, &CHARBLOCK[1], treesTilesLen/2);
    // TODO 4.4 - load trees map to screenblock
    DMANow(3, treesMap, &SCREENBLOCK[17], treesMapLen/2);
    
    hOff = 0;

    buttons = BUTTONS;
}

// Update game each frame
void game() {

    // Scroll the background
    if(BUTTON_HELD(BUTTON_LEFT)) {
        hOff--;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        hOff++;
    }

    waitForVBlank();

    // Update the offset registers with the actual offsets

    // TODO 5.0 - change to implement parallax
    REG_BG0HOFF = hOff * 2;
    REG_BG1HOFF = hOff;
}