#include <stdlib.h>
#include "myLib.h"
#include "game.h"

//variables
PLAYER player;
BOMB bombs[BOMBCOUNT];
int loseFlag;
int bombsSurvived;

void initGame() {
    loseFlag = 0;
    bombsSurvived = 0;
    initPlayer();
    initBombs();
}
void updateGame() {
    updatePlayer();
    for (int i = 0; i < BOMBCOUNT; i++) {
        updateBomb(&bombs[i]);
    }
    chanceToSpawn();
}
void drawGame() {
    drawPlayer();
    for (int i = 0; i < BOMBCOUNT; i++) {
        drawBomb(&bombs[i]);
    }
}

void initPlayer() {
    player.row = 140;
    player.col = 118;
    player.oldRow = player.row;
    player.oldCol = player.col;
    player.cdel = 2;
    player.rdel = 2;
    player.height = 10;
    player.width = 5;
    player.color = COLOR(255, 175, 75);
}
void updatePlayer() {
    if (BUTTON_HELD(BUTTON_LEFT) && (player.col - player.cdel) >= 0) {
        player.col -= player.cdel;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && (player.col + player.cdel + player.width) <= SCREENWIDTH) {
        player.col += player.cdel;
    }
    if (BUTTON_HELD(BUTTON_UP) && (player.row - player.rdel) >= 0) {
        player.row -= player.rdel;
    }
    if (BUTTON_HELD(BUTTON_DOWN) && (player.row + player.rdel + player.height) <= SCREENHEIGHT) {
        player.row += player.rdel;
    }
}
void drawPlayer() {
    drawRect(player.oldCol, player.oldRow, player.width, player.height, BLACK);
	drawRect(player.col, player.row, player.width, player.height, player.color);

	player.oldRow = player.row;
	player.oldCol = player.col;
}

void initBombs() {
    for (int i = 0; i < BOMBCOUNT; i++) {
        bombs[i].row = 0;
        bombs[i].col = rand() % 240;
        bombs[i].oldRow = bombs[i].row;
        bombs[i].rdel = rand() % 3 + 1;
        bombs[i].height = BOMBSIZE;
        bombs[i].width = BOMBSIZE;
        bombs[i].color = COLOR(rand()%255, rand()%255, rand()%255);
        bombs[i].active = 0;
    }
}
void updateBomb(BOMB* bomb) {
    if (bomb->active) {
        //check collision
        if (collision(player.col, player.row, player.width, player.height, bomb->col, bomb->row, bomb->width, bomb->height)) {
            loseFlag = 1;
        }
        //move down
        bomb -> row = (bomb -> row) + bomb -> rdel;
        //check if below screen
        if (bomb->row > 170) {
            bomb->active = 0;
            bomb->row = 0;
            bomb->col = rand() % 240;
            bombsSurvived += 1;
        }
        
    }
}
void drawBomb(BOMB* bomb) {
    if (bomb->active) {
        drawRect(bomb->col, bomb->oldRow,bomb->width, bomb->height, BLACK);
        drawRect(bomb->col, bomb-> row, bomb->width, bomb-> height, bomb-> color);
    }
    bomb->oldRow = bomb->row;
}

void chanceToSpawn() {
    if (!(rand() % 8)) {
        //activate a bomb
        for (int i = 0; i < BOMBCOUNT; i++) {
            if (!bombs[i].active) {
                bombs[i].active = 1;
                break;
            }
        }
    }
}