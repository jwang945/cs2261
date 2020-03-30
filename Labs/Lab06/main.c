#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "space.h"
// TODO 3.4: Include space.h


// Prototypes
void initialize();

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

// Text Buffer
char buffer[41];

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

    //TODO 3.5: Call DMANow to load in spacePal
    DMANow(3, spacePal, PALETTE, 256);
    // UNCOMMENT 3.0
    drawFullscreenImage4(spaceBitmap);

    //TODO 2.1: Wait for vertical blank and flip the page (you don't need to reload the palette)
    waitForVBlank();
    flipPage();

    state = START;

    // Begin the seed randomization
    seed = 0;
}

// Runs every frame of the start state
void start() {

    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        srand(seed);

        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

    // Update the score
    sprintf(buffer, "Balls Remaining: %d", ballsRemaining);
    drawString4(5, 145, buffer, WHITEID);

    waitForVBlank();
    flipPage();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    else if (ballsRemaining == 0)
        goToWin();
    else if (BUTTON_PRESSED(BUTTON_B))
        goToLose();
}

// Sets up the pause state
void goToPause() {

    fillScreen4(GRAYID);
    drawString4(120-15, 80-3, "Pause", BLACKID);

    //TODO 2.2: Wait for vertical blank and flip the page
    waitForVBlank();
    flipPage();


    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {

    fillScreen4(GREENID);
    drawString4(120-9, 80-3, "Win", BLACKID);

    //TODO 2.3: Wait for vertical blank and flip the page
    waitForVBlank();
    flipPage();


    state = WIN;
}

// Runs every frame of the win state
void win() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

    fillScreen4(REDID);
    drawString4(120-12, 80-3, "Lose", BLACKID);

    //TODO 2.4: Wait for vertical blank and flip the page
    waitForVBlank();
    flipPage();


    state = LOSE;
}

// Runs every frame of the lose state
void lose() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}