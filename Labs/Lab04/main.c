#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here
void goToStart();
void goToGame();
void goToPause();
void goToWin();
void goToLose();

void continueStart();
void continueGame();
void continuePause();
void continueWin();
void continueLose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {
        //changedStateInCurWhile = 0;
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        // TODO 1.0: Make the state machine here
        switch (state) {
            case START:
                    continueStart();
                    break;
            case GAME:
                    continueGame();
                    break;
            case PAUSE:
                    continuePause();
                    break;
            case WIN:
                    continueWin();
                    break;
            case LOSE:
                    continueLose();
                    break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // TODO 1.3: Call your goToStart function here
    goToStart();
}

// TODO 1.1: Make your state and state transition functions
void goToStart() {
    state = START;
    fillScreen(CYAN);
}

void goToGame() {
    state = GAME;
    fillScreen(BLACK);
}

void goToPause() {
    state = PAUSE;
    fillScreen(GRAY);
}

void goToWin() {
    state = WIN;
    fillScreen(GREEN);
}

void goToLose() {
    state = LOSE;
    fillScreen(RED);
}

void continueStart() {
    seed = seed + 1;
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        initGame();
        goToGame();
    }
}

void continueGame() {
    updateGame();
    waitForVBlank();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (ballsRemaining == 0) {
        goToWin();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
}

void continuePause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void continueWin() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void continueLose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}