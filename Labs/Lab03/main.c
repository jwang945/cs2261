#include "myLib.h"
#include "coords.h"

// Prototypes
void initialize();
void drawCacti();
void drawPerson(int cols[], int rows[], int numCoords, unsigned short color);
void drawBackground();
void drawCactus(int col);
void eraseCactus(int col);
void advanceCacti();
void swap(int* a, int* b);

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Game-specific properties
#define SKYCOLOR COLOR(15, 15, 31)
#define SANDCOLOR COLOR(31, 31, 15)
#define CACTUSCOLOR COLOR(3, 31, 3)
#define WHITE COLOR(31, 31, 31)

// Game-specific arrays
int cactusCols[] = {0, 73, 147};
int oldCactusCols[] = {0, 73, 147};

// TODO 1.0: Create a global variable for the length of the above arrays
int cactusColsLength = 3;

// Jumping globals
int up = 0;
int time = 0;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // Update game logic
        advanceCacti();
        if (BUTTON_PRESSED(BUTTON_START) && !up) { // If not up and trying to jump
            up = 1; // Now we're jumping!

            // TODO 3.1: For each coordinate in the row and column arrays, use the swap function to swap the visible and invisible coordinates
            for (int i = 0; i < NUMCOORDS; i++) {
                swap(&visiblePersonCols[i],&invisiblePersonCols[i]);
                swap(&visiblePersonRows[i],&invisiblePersonRows[i]);
            }




        } else if (time == 45 && up) { // If we've been in the air for some time
            time = 0; // Reset the time in the air to 0
            up = 0; // Let's fall back down!

            // TODO 3.2: For each coordinate in the row and column arrays, use the swap function to swap the visible and invisible coordinates
            for (int i = 0; i < NUMCOORDS; i++) {
                swap(&visiblePersonCols[i],&invisiblePersonCols[i]);
                swap(&visiblePersonRows[i],&invisiblePersonRows[i]);
            }




        }

        // Increment time if in air
        if (up) {
            time++;
        }

        waitForVBlank();

        // Draw the game
        // TODO 2.1: Erase the invisible person
        drawPerson(invisiblePersonCols, invisiblePersonRows, NUMCOORDS, SKYCOLOR);
        // TODO 1.2: Call the drawCacti function
        drawCacti();
        // TODO 2.2: Draw the visible person
        drawPerson(visiblePersonCols, visiblePersonRows, NUMCOORDS, WHITE);
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    drawBackground();
}

// TODO 3.0: Write a function called "swap" that swaps two integers
// Don't forget to write the function prototype!
void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}


// Draw the cacti
void drawCacti() {

    // TODO 1.1: For each catcus column, erase the old cactus location (eraseCactus) and draw the new one (drawCactus)
    for (int i = 0; i < cactusColsLength; i++) {
        //erase
        eraseCactus(oldCactusCols[i]);
        //draw
        drawCactus(cactusCols[i]);
    }




}

// Draw a person pixel-by-pixel at the specified coordinates
void drawPerson(int cols[], int rows[], int numCoords, unsigned short color) {

    // TODO 2.0: Draw a pixel at each row and column pair
    for (int i = 0; i < numCoords; i++) {
        setPixel(cols[i],rows[i], color);
    }



}

// Draw the background of the scene
void drawBackground() {

    // Draw sky
    int i;
    for (i = 0; i < 240*100; i++) {
        videoBuffer[i] = SKYCOLOR;
    }

    // Draw ground
    for (; i < 240*160; i++) {
        videoBuffer[i] = SANDCOLOR;
    }
}

// Draw a cactus at specified col
void drawCactus(int col) {

    int row = 72;
    drawRect(col, row + 7, 4, 9, CACTUSCOLOR);
    drawRect(col + 4, row + 12, 3, 4, CACTUSCOLOR);
    drawRect(col + 7, row, 6, 30, CACTUSCOLOR);
    drawRect(col + 13, row + 15, 3, 4, CACTUSCOLOR);
    drawRect(col + 16, row + 10, 4, 9, CACTUSCOLOR);
}

// Erase a cactus at specified col
void eraseCactus(int col) {

    int row = 72;
    drawRect(col, row, 20, 100 - row, SKYCOLOR);
    drawRect(col, 100, 20, 30 - (100 - row), SANDCOLOR);
}

// Move the cacti to the right, and loop around the screen
void advanceCacti() {

    int arraylen = sizeof(cactusCols)/sizeof(cactusCols[0]); // this only works because cactusCols is globally defined
    for (int i = 0; i < arraylen; i++) {

        oldCactusCols[i] = cactusCols[i];

        cactusCols[i]++;
        if (cactusCols[i] > 240 - 20) {
            cactusCols[i] = 0;
        }
    }
}