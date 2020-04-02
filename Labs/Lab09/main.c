#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "house.h"

// Prototypes
void initialize();
void goToGame();
void game();

// States
enum {GAME};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case GAME:
                game();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    // Set up the display
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;


    // Set up the first state
    goToGame();
    initGame();
}

// Sets up the game state
void goToGame() {

    // Make sure changes do not appear onscreen
    waitForVBlank();

    // Set up the house background
    DMANow(3, housePal, PALETTE, 256);
    DMANow(3, houseTiles, &CHARBLOCK[0], houseTilesLen / 2);
    DMANow(3, houseMap, &SCREENBLOCK[31], houseMapLen / 2);
    
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    // Set up the sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();
}