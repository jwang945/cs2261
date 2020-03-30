#include "myLib.h"
#include "stdlib.h"
#include "game.h"

// prototypes
void initialize();
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

//State
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// buttons
unsigned short buttons;
unsigned short oldButtons;

//time
int time;
int timeStep;

int seed;

int main() {

	initialize();

	while (1) {
		//update buttons
		oldButtons = buttons;
		buttons = BUTTONS;

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

// sets up the display and the game objects
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	buttons = BUTTONS;
	oldButtons = BUTTONS;
	goToStart();
}

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
    seed += 1;
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
	if (bombsSurvived >= BOMBSTOSURVIVE) {
		goToWin();
	}
    if (loseFlag) {
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
