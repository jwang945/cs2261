#include "myLib.h"
#include "startscreen.h"
#include "mainscreen.h"
#include "winscreen.h"
#include "losescreen.h"
//prototypes
void initialize();
void game();
void initGame();
void srand();
void updateGame();
// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States for state machine
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// button Variables
unsigned short buttons;
unsigned short oldButtons;

int seed; //random seed

int main() {

    initialize();

    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
	}
}

void initialize() {
    //set up display register
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    //set up bg register
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_SMALL | BG_4BPP;

    buttons = BUTTONS;
    goToStart();
}

void goToStart() {
    seed = 0; //init seed
    waitForVBlank();
    state = START;
    //DMA palette
    DMANow(3, startscreenPal, PALETTE, 256);
    //load tiles
    DMANow(3, startscreenTiles, &CHARBLOCK[0], startscreenTilesLen/2);
    //load map
    DMANow(3, startscreenMap, &SCREENBLOCK[16], startscreenMapLen/2);
}

void start() {

    waitForVBlank();
    seed++; //increment seed depending on how long user stays on start screen

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame(); //go to game logic
        goToGame();
    }
}

void goToGame() {
    srand(seed); //seed rand() once player hits start
    state = GAME;
    waitForVBlank();
    //DMA palette
    DMANow(3, mainscreenPal, PALETTE, 256);
    //load tiles
    DMANow(3, mainscreenTiles, &CHARBLOCK[0], mainscreenTilesLen/2);
    //load map
    DMANow(3, mainscreenMap, &SCREENBLOCK[16], mainscreenMapLen/2);
}

void game() {
    updateGame(); //go to game logic
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    // else if (BUTTON_PRESSED(BUTTON_A))
    //     goToWin();
    // else if (BUTTON_PRESSED(BUTTON_B))
    //     goToLose();
}

void goToPause() {

    waitForVBlank();
    state = PAUSE;
}

void pause() {
    waitForVBlank();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToWin() {
    waitForVBlank();
    state = WIN;
    //DMA palette
    DMANow(3, winscreenPal, PALETTE, 256);
    //load tiles
    DMANow(3, winscreenTiles, &CHARBLOCK[0], winscreenTilesLen/2);
    //load map
    DMANow(3, winscreenMap, &SCREENBLOCK[16], winscreenMapLen/2);
}

void win() {
    waitForVBlank();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

void goToLose() {
    waitForVBlank();
    state = LOSE;
    //DMA palette
    DMANow(3, losescreenPal, PALETTE, 256);
    //load tiles
    DMANow(3, losescreenTiles, &CHARBLOCK[0], losescreenTilesLen/2);
    //load map
    DMANow(3, losescreenMap, &SCREENBLOCK[16], losescreenMapLen/2);
}

void lose() {
    waitForVBlank();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}