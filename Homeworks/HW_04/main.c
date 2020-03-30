#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "jungle.h"
#include "text.h"
#include "game.h"
#include "tiger.h"

// Prototypes
void initialize();
void initGame();
void updateGame();
void drawGame();

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

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

//text buffer
char buffer[41]; //41 is max num chars that can fit on a line

int main() {

    initialize();

    while(1) {

        // Update button variables
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

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {
    //DMA palette
    DMANow(3, junglePal, PALETTE, 256);
    //draw the image
    drawFullscreenImage4(jungleBitmap);
    
    //since mode4 need to flip page
    waitForVBlank();
    flipPage();

    state = START;
    //init seed
    seed = 0;
}

// Runs every frame of the start state
void start() {

    seed++;

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed rand
        srand(seed);

        initGame();
        goToGame();
    }
}

// Sets up the game state
void goToGame() {

    state = GAME;

    waitForVBlank();
    flipPage();


}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

 
    // Update the score for how mnay bunnies eaten
    sprintf(buffer, "%d", bunniesEaten);
    drawString4(101, 145, buffer, WHITEID);//draw the score 

    waitForVBlank();
    flipPage();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    else if (bunniesEaten >= BUNNIESTOEAT)
        goToWin();
    else if (BUTTON_PRESSED(BUTTON_B))
        goToLose();
}

// Sets up the pause state
void goToPause() {

    waitForVBlank();
    flipPage();


    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {

   
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {

    fillScreen4(WHITEID);
    drawString4(100, 70, "You Win!", tigerPal[0]);
    waitForVBlank();
    flipPage();


    state = WIN;
}

// Runs every frame of the win state
void win() {

    
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

    waitForVBlank();
    flipPage();


    state = LOSE;
}

// Runs every frame of the lose state
void lose() {

    
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}