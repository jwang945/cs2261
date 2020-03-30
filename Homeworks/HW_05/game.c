#include "myLib.h"
#include "spritesheet.h"
#include "game.h"

//prototypes
OBJ_ATTR shadowOAM[128]; //shadowOAM to DMA into realOAM
SNAKEHEAD snakeHead; //snakehead, only one
SNAKEBODY snakeBodies[MAXSNAKEBODIES]; //snake bodies, has multiple possible, pool objects
PIVOT pivots[NUMPIVOTS]; //when head changes dir, add a pivot
APPLE apple; //only one apple
int currEnd; //index of body to grab from
int currNumPivots;

//direction enum
enum {NORTH, EAST, SOUTH, WEST};

void initGame() {
    //init snakeBodies
    currEnd = 0;
    initSnakeBodies();
    //make all pivots inactive
    for (int i = 0; i < NUMPIVOTS; i++) {
        pivots[i].active = 0;
        pivots[i].width = snakeHead.width; 
        pivots[i].height = snakeHead.height;
    }
    currNumPivots = -1;
    //load sprite palette
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    //load sprite tiles
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    //hide sprites
    hideSprites();

    //spawn and init apple
    apple.width = 16;
    apple.height = 16;
    apple.row = rand() % (SCREENHEIGHT - apple.height);
    apple.col = rand() % (SCREENWIDTH - apple.width);
    apple.curFrame = 4;
    apple.aniCounter = 1;
    apple.aniSwitch = 20;
    apple.aniFlip = 1;
    //shadowOAM apple
    shadowOAM[0].attr0 = apple.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = apple.col | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_TILEID(4 * 2,1 * 2);

    //set snake fields
    snakeHead.row = 80;
    snakeHead.col = 120;
    snakeHead.cdel = 1;
    snakeHead.rdel = 1;
    snakeHead.width = 16;
    snakeHead.height = 16;
    snakeHead.dir = 1;
    snakeHead.numBods = 0;
    //shadowOAM snakehead
    shadowOAM[1].attr0 = snakeHead.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr1 = snakeHead.col | ATTR1_SMALL;
    shadowOAM[1].attr2 = ATTR2_TILEID(0,0);

    //copy to real OAM
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void updateGame() {
    //player input------------------------------------------------------------------------------------------                            
    if (BUTTON_PRESSED(BUTTON_UP) && snakeHead.dir != SOUTH) { //if opposite, do not change dir
        snakeHead.dir = NORTH;
        addPivot(snakeHead.row, snakeHead.col); //add a pivot when the snakeHead changes dir               
    }                                          
    if (BUTTON_PRESSED(BUTTON_DOWN) && snakeHead.dir != NORTH) { 
        snakeHead.dir = SOUTH;                     
        addPivot(snakeHead.row, snakeHead.col);                     
    }
    if (BUTTON_PRESSED(BUTTON_LEFT) && snakeHead.dir != EAST) {
        snakeHead.dir = WEST;
        addPivot(snakeHead.row, snakeHead.col); 
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT) && snakeHead.dir != WEST) {
        snakeHead.dir = EAST;
        addPivot(snakeHead.row, snakeHead.col); 
    }
    //player input------------------------------------------------------------------------------------------

    //movement------------------------------------------------------------------------------------------
    //update the row and col of the snakeHead based on the dir
    switch(snakeHead.dir) { 
        case NORTH:
            snakeHead.row -= snakeHead.rdel;
            break;
        case EAST:
            snakeHead.col += snakeHead.cdel;
            break;
        case SOUTH:
            snakeHead.row += snakeHead.rdel;
            break;
        case WEST:
            snakeHead.col -= snakeHead.cdel;
            break;
    }
    //movement------------------------------------------------------------------------------------------

    //update location of head---------------------------------------------------------------------------
    //shadowOAM
    shadowOAM[1].attr0 = snakeHead.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr1 = snakeHead.col | ATTR1_SMALL;
    shadowOAM[1].attr2 = ATTR2_TILEID((snakeHead.dir) * 2,0); //multiply by 2 bc 16x16 px sprites
    //update location of head---------------------------------------------------------------------------

    //update bodies
    updateSnakeBodies();
    //check for collision-------------------------------------------------------------------
    //wall collisions
    //left and right sides
    if (snakeHead.col < 0 || snakeHead.col > SCREENWIDTH - snakeHead.width - 1) {
        hideSprites();
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128 * 4);
        goToLose();
    }
    //top and bottom sides
    if (snakeHead.row < 0 || snakeHead.row > SCREENHEIGHT - snakeHead.height - 1) {
        hideSprites();
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128 * 4);
        goToLose();
    }
    //apple collisions
    //if there's a collision with the snakehead and apple
    if (collision(snakeHead.col, snakeHead.row, snakeHead.width, snakeHead.height, apple.col, apple.row, apple.width, apple.height)) {
        //spawn apple in new location
        spawnApple();
        //add new sprite behind the snakehead
        addNewBody();
    }
    //body collisions
    //check every body segment
    for (int i = 1; i < currEnd; i++) {
        //if collision with all body segments except the one right behind the snakeHead, goToLose()
        if (collision(snakeHead.col, snakeHead.row, snakeHead.width, 1, snakeBodies[i].col, snakeBodies[i].row, snakeBodies[i].width, snakeBodies[i].height)) {
            hideSprites();
            waitForVBlank();
            DMANow(3, shadowOAM, OAM, 128 * 4);
            goToLose();
        }
    }
    //check pivot fake segments
    // for (int i = 0; i < currNumPivots; i++) {
    //     if (collision(snakeHead.col, snakeHead.row, snakeHead.width, 1, pivots[i].col, pivots[i].row, pivots[i].width, pivots[i].height) && pivots[i].active) {
    //         hideSprites();
    //         waitForVBlank();
    //         DMANow(3, shadowOAM, OAM, 128 * 4);
    //         //goToLose();
    //     }
    // }
    //check for collision-------------------------------------------------------------------

    //update apple animation----------------------------------------------------------------
    apple.aniCounter += 1; //increment every loop
    if ((apple.aniCounter % apple.aniSwitch) == 0) { //every 20 loops, want to change animation state of apple
        apple.aniCounter = 1; //reset aniCounter
        //change animation frame
        //curFrame is 4 to start with
        shadowOAM[0].attr2 = ATTR2_TILEID(apple.curFrame * 2,1 * 2);
        //change curFrame
        if (apple.curFrame == 4 || apple.curFrame == 1) {
            apple.aniFlip *= -1; //flip increment of curFrame so aniFrame goes 4 3 2 1 2 3 4 3 2 1 2 3...
        }
        apple.curFrame = apple.curFrame + apple.aniFlip; //add aniFlip to curFrame, can be -1 or +1
    }
    //update apple animation----------------------------------------------------------------

    //check win condition----------------------------------------------
    if (currEnd == 10) { //if  currEnd is 10, or ate 10 apples, goToWin()
        hideSprites();
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128 * 4);
        goToWin();
    }
    //check win condition----------------------------------------------

    //copy shadowOAM to real OAM
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void spawnApple() {
    //tryAgain acts as flag to see if the apple was spawned in a "safe" location, where there is no snake
    int tryAgain = 1;
    int colToTry;
    int rowToTry;
    while (tryAgain) {
        tryAgain = 0;
        rowToTry = rand() % (SCREENHEIGHT - apple.height);
        colToTry = rand() % (SCREENWIDTH - apple.width);
        if (!collision(snakeHead.col, snakeHead.row, snakeHead.width, snakeHead.height, colToTry, rowToTry, apple.width, apple.height)) {
            //if no collision with head
            for (int i = 0; i < currEnd; i++) {
                if (collision(snakeBodies[i].col, snakeBodies[i].row, snakeBodies[i].width, snakeBodies[i].height, colToTry, rowToTry, apple.width, apple.height)) {
                    //if collision with body, have to tryAgain
                    tryAgain = 1;
                }
            }
        } else {
            //if collision with head, have to tryAgain
            tryAgain = 1;
        }
    }
    //when get past while loop, move "safe" row and col to apple's fields and move into shadowOAM
    apple.row = rowToTry;
    apple.col = colToTry;
    shadowOAM[0].attr0 = apple.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = apple.col | ATTR1_SMALL;
}

void initSnakeBodies() {
    //init all snakeBodies as inactive for object pooling
    for (int i = 0; i < MAXSNAKEBODIES; i++) {
        snakeBodies[i].row = 0;
        snakeBodies[i].col = 0;
        snakeBodies[i].cdel = 1;
        snakeBodies[i].rdel = 1;
        snakeBodies[i].width = 16;
        snakeBodies[i].height = 16;
        snakeBodies[i].dir = NORTH;
        snakeBodies[i].active = 0;
        snakeBodies[i].isTail = 0;
    }
}

void addNewBody() {
    snakeBodies[currEnd].active = 1; //set as active
    snakeBodies[currEnd].isTail = 1; //newest body part is tail
    snakeBodies[currEnd-1].isTail = 0; //set older part as not tail
    if (currEnd == 0) { //first one to add, add to head
        snakeBodies[currEnd].dir = snakeHead.dir;
        switch(snakeHead.dir) {
            case NORTH: //add to bottom
                snakeBodies[currEnd].row = snakeHead.row + snakeHead.height;
                snakeBodies[currEnd].col = snakeHead.col;
                break;
            case EAST: //add to left
                snakeBodies[currEnd].row = snakeHead.row;
                snakeBodies[currEnd].col = snakeHead.col - snakeHead.width;
                break;
            case SOUTH: //add to top
                snakeBodies[currEnd].row = snakeHead.row - snakeHead.height;
                snakeBodies[currEnd].col = snakeHead.col;
                break;
            case WEST: //add to right
                snakeBodies[currEnd].row = snakeHead.row;
                snakeBodies[currEnd].col = snakeHead.col + snakeHead.width;
                break;
        }
    } else { //add onto end of body
        snakeBodies[currEnd].dir = snakeBodies[currEnd-1].dir;
            switch(snakeBodies[currEnd-1].dir) { //instead of adding from snakeHead, add from snakeBodies[currEnd-1]
                case NORTH: //add to bottom
                    snakeBodies[currEnd].row = snakeBodies[currEnd-1].row + snakeBodies[currEnd-1].height;
                    snakeBodies[currEnd].col = snakeBodies[currEnd-1].col;
                    break;
                case EAST:
                    snakeBodies[currEnd].row = snakeBodies[currEnd-1].row;
                    snakeBodies[currEnd].col = snakeBodies[currEnd-1].col - snakeBodies[currEnd-1].width;
                    break;
                case SOUTH:
                    snakeBodies[currEnd].row = snakeBodies[currEnd-1].row - snakeBodies[currEnd-1].height;
                    snakeBodies[currEnd].col = snakeBodies[currEnd-1].col;
                    break;
                case WEST:
                    snakeBodies[currEnd].row = snakeBodies[currEnd-1].row;
                    snakeBodies[currEnd].col = snakeBodies[currEnd-1].col + snakeBodies[currEnd-1].width;
                    break;
            }
    }
    shadowOAM[currEnd+2].attr0 = snakeBodies[currEnd].row | ATTR0_4BPP | ATTR0_SQUARE; //+2 bc 0 is apple and 1 is head
    shadowOAM[currEnd+2].attr1 = snakeBodies[currEnd].col | ATTR1_SMALL;
    shadowOAM[currEnd+2].attr2 = ATTR2_TILEID(0,1 * 2); //multiply by 2 bc 16x16 px sprites
    currEnd++; //increment currEnd causes added new body segment
}

void updateSnakeBodies() { //move all snakeBodies based on dir
    for (int i = 0; i < MAXSNAKEBODIES; i++) {
        if (snakeBodies[i].active) {
            switch(snakeBodies[i].dir) {
                case NORTH:
                    snakeBodies[i].row -= snakeBodies[i].rdel;
                    break;
                case EAST:
                    snakeBodies[i].col += snakeBodies[i].cdel;
                    break;
                case SOUTH:
                    snakeBodies[i].row += snakeBodies[i].rdel;
                    break;
                case WEST:
                    snakeBodies[i].col -= snakeBodies[i].cdel;
                    break;
            }
            checkPivots(&snakeBodies[i]); //check pivots will change the snakeBodies' dirs
            //update shadowOAM
            shadowOAM[i+2].attr0 = snakeBodies[i].row | ATTR0_4BPP | ATTR0_SQUARE; //+2 bc 0 is apple and 1 is head
            shadowOAM[i+2].attr1 = snakeBodies[i].col | ATTR1_SMALL;
            shadowOAM[i+2].attr2 = ATTR2_TILEID(0,1 * 2); //multiply by 2 bc 16x16 px sprites
        }
    }
}

void addPivot(int row, int col) {
    for (int i = 0; i < NUMPIVOTS; i++) {
        if (!pivots[i].active) {
            //also add a snakebody here for fluid motion
            if (currEnd != 0) { //if not just the head, if only head, don't need to add a pivot
                currNumPivots++;
                pivots[i].active = 1;
                pivots[i].row = row;
                pivots[i].col = col;
                pivots[i].dir = snakeHead.dir;
                shadowOAM[127 - i].attr0 = pivots[i].row | ATTR0_4BPP | ATTR0_SQUARE; //+2 bc 0 is apple and 1 is head
                shadowOAM[127 - i].attr1 = pivots[i].col | ATTR1_SMALL;
                shadowOAM[127 - i].attr2 = ATTR2_TILEID(0,1 * 2); //multiply by 2 bc 16x16 px sprites
            }
            break;
        }
    }
}

void checkPivots(SNAKEBODY* s) {
    for (int i = 0; i < NUMPIVOTS; i++) {
        if (pivots[i].active) { //only check active pivots
            if (s->col == pivots[i].col && s->row == pivots[i].row) {
                //if the snake body segment is in the pivot location
                //change the dir of the snakebody segment to the pivotdir
                s->dir = pivots[i].dir;
                if (s->isTail) {
                    //if last body segment has had their direction changed by pivots[i], deactivate it
                    pivots[i].active = 0;
                    currNumPivots--; //decrement numPivots
                    shadowOAM[127-i].attr0 = ATTR0_HIDE; //hide the fake body segment that makes movement look fluid
                }
            }
        }
    }
}