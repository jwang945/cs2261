#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "tiger.h"
//variables
TIGER tiger;
BUNNY bunnies[BUNNYCOUNT];
int bunniesEaten;

//initialize the  game
void initGame() {
    
    //initialize tiger
    initTiger();
    //load tiger palette
    unsigned short colors[0] = {WHITE}; //make custom white color
    DMANow(3, tigerPal, PALETTE, 256);
    PALETTE[256-1] = colors[0]; //add custom color to palatte
    //initialize bunny
    initBunnies();

    bunniesEaten = 0; //initilize bunniesEaten var
}

void updateGame() {
    updateTiger();

    for (int i = 0; i < BUNNYCOUNT; i++) {
        updateBunny(&bunnies[i]);
    }
}

void drawGame() {
    fillScreen4(PALETTE[0]);

    drawTiger();

    for (int i = 0; i < BUNNYCOUNT; i++) {
        drawBunny(&bunnies[i]);
    }
}
void initTiger() {
    tiger.row = 70;
    tiger.col = 120;
    tiger.cdel = 1;
    tiger.rdel = 1;
    tiger.oldRow = tiger.row;
    tiger.oldCol = tiger.col;
    tiger.height = 24;
    tiger.width = 24;
}

void updateTiger() {
    //set oldRow and oldCol
    tiger.oldRow = tiger.row;
    tiger.oldCol = tiger.col;


    if (BUTTON_HELD(BUTTON_LEFT) && (tiger.col - tiger.cdel) > 0 ) {
        tiger.col -= tiger.cdel;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && (tiger.col + tiger.cdel + tiger.width) < SCREENWIDTH) {
        tiger.col += tiger.cdel;
    }
    if (BUTTON_HELD(BUTTON_UP) && (tiger.row - tiger.rdel) > 0) {
        tiger.row -= tiger.rdel;
    }
    if (BUTTON_HELD(BUTTON_DOWN) && (tiger.row + tiger.rdel + tiger.height) < SCREENHEIGHT) {
        tiger.row += tiger.rdel;
    }
}

void drawTiger() {
    //draw the tiger using the bitmap from usenti at the correct location
    drawImage4(tiger.col, tiger.row, tiger.width, tiger.height, tigerBitmap);
}

void initBunnies() {
    for (int i = 0; i < BUNNYCOUNT; i++) {
        bunnies[i].row = rand() % (160 - BUNNYHEIGHT); 
        bunnies[i].col = rand() % (240 - BUNNYWIDTH);
        bunnies[i].cdel = 2;
        bunnies[i].rdel = 2;
        bunnies[i].height = BUNNYHEIGHT;
        bunnies[i].width = BUNNYWIDTH;
        bunnies[i].erased = 0;
        bunnies[i].respawn = 0;
    }
}

void updateBunny(BUNNY *bunny) {
    //only update the bunny if it is not erased
    if (!bunny->erased) {
        //bounce bunny if collision with wall
        //top wall
        if ((bunny->row) <= 1) {
            bunny->rdel *= -1;
        }
        //bottom wall
        if ((bunny->row + bunny->height - 1) >= SCREENHEIGHT - 2) {
            bunny->rdel *= -1;
        }
        //left wall
        if ((bunny->col) <= 1) {
            bunny->cdel *= -1;
        }
        //right wall
        if ((bunny->col + bunny->width - 1) >= SCREENWIDTH - 2) {
            bunny->cdel *= -1;
        }

        //move bunny with delta
        bunny->row += bunny->rdel;
        bunny->col += bunny->cdel;

        //check collision with tiger
        if (collision(bunny->col, bunny->row, bunny->width, bunny->height, tiger.col, tiger.row, tiger.width, tiger.height)) {
            //if collision, erase the bunny
            bunny->erased = 1;
            bunniesEaten += 1;
            drawRect4(bunny->col, bunny->row, bunny->width, bunny->height, WHITEID);
        }
    } else {
        //bunny is erased
        bunny->respawn += 1;
        //wait for a certain amount of time before setting the bunny as unerased and draw the bunny
        if (bunny->respawn >= RESPAWNTIME) {
            bunny->respawn = 0;
            bunny->erased = 0;
            bunny->col = rand() % (240 - BUNNYWIDTH);
            bunny->row = rand() % (160 - BUNNYHEIGHT);
        }
    }
}

void drawBunny(BUNNY *bunny) {
    if (!bunny->erased) {
        //if the bunny isn't erased, draw it
        drawRect4(bunny->col, bunny->row, bunny->width, bunny->height, WHITEID);
    }
}