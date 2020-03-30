# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 3 "game.c" 2
# 1 "game.h" 1


typedef struct{
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int dir;
    int numBods;
} SNAKEHEAD;

typedef struct{
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int dir;
    int active;
    int isTail;
} SNAKEBODY;

typedef struct{
    int row;
    int col;
    int width;
    int height;
    int curFrame;
    int aniCounter;
    int aniSwitch;
    int aniFlip;
} APPLE;

typedef struct{
    int row;
    int col;
    int dir;
    int width;
    int height;
    int active;
} PIVOT;

void initGame();
void updateGame();
void goToLose();
void goToWin();
int rand();
void spawnApple();
void initSnakeBodies();
void addNewBody();
void updateSnakeBodies();
void addPivot(int row, int col);
void checkPivots(SNAKEBODY* s);
# 4 "game.c" 2


OBJ_ATTR shadowOAM[128];
SNAKEHEAD snakeHead;
SNAKEBODY snakeBodies[150];
PIVOT pivots[100];
APPLE apple;
int currEnd;
int currNumPivots;


enum {NORTH, EAST, SOUTH, WEST};

void initGame() {

    currEnd = 0;
    initSnakeBodies();

    for (int i = 0; i < 100; i++) {
        pivots[i].active = 0;
        pivots[i].width = snakeHead.width;
        pivots[i].height = snakeHead.height;
    }
    currNumPivots = -1;

    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512/2);

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);

    hideSprites();


    apple.width = 16;
    apple.height = 16;
    apple.row = rand() % (160 - apple.height);
    apple.col = rand() % (240 - apple.width);
    apple.curFrame = 4;
    apple.aniCounter = 1;
    apple.aniSwitch = 20;
    apple.aniFlip = 1;

    shadowOAM[0].attr0 = apple.row | (0<<13) | (0<<14);
    shadowOAM[0].attr1 = apple.col | (1<<14);
    shadowOAM[0].attr2 = ((1 * 2)*32+(4 * 2));


    snakeHead.row = 80;
    snakeHead.col = 120;
    snakeHead.cdel = 1;
    snakeHead.rdel = 1;
    snakeHead.width = 16;
    snakeHead.height = 16;
    snakeHead.dir = 1;
    snakeHead.numBods = 0;

    shadowOAM[1].attr0 = snakeHead.row | (0<<13) | (0<<14);
    shadowOAM[1].attr1 = snakeHead.col | (1<<14);
    shadowOAM[1].attr2 = ((0)*32+(0));


    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void updateGame() {

    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && snakeHead.dir != SOUTH) {
        snakeHead.dir = NORTH;
        addPivot(snakeHead.row, snakeHead.col);
    }
    if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7)))) && snakeHead.dir != NORTH) {
        snakeHead.dir = SOUTH;
        addPivot(snakeHead.row, snakeHead.col);
    }
    if ((!(~(oldButtons)&((1<<5))) && (~buttons & ((1<<5)))) && snakeHead.dir != EAST) {
        snakeHead.dir = WEST;
        addPivot(snakeHead.row, snakeHead.col);
    }
    if ((!(~(oldButtons)&((1<<4))) && (~buttons & ((1<<4)))) && snakeHead.dir != WEST) {
        snakeHead.dir = EAST;
        addPivot(snakeHead.row, snakeHead.col);
    }




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




    shadowOAM[1].attr0 = snakeHead.row | (0<<13) | (0<<14);
    shadowOAM[1].attr1 = snakeHead.col | (1<<14);
    shadowOAM[1].attr2 = ((0)*32+((snakeHead.dir) * 2));



    updateSnakeBodies();



    if (snakeHead.col < 0 || snakeHead.col > 240 - snakeHead.width - 1) {
        hideSprites();
        waitForVBlank();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
        goToLose();
    }

    if (snakeHead.row < 0 || snakeHead.row > 160 - snakeHead.height - 1) {
        hideSprites();
        waitForVBlank();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
        goToLose();
    }


    if (collision(snakeHead.col, snakeHead.row, snakeHead.width, snakeHead.height, apple.col, apple.row, apple.width, apple.height)) {

        spawnApple();

        addNewBody();
    }


    for (int i = 1; i < currEnd; i++) {

        if (collision(snakeHead.col, snakeHead.row, snakeHead.width, 1, snakeBodies[i].col, snakeBodies[i].row, snakeBodies[i].width, snakeBodies[i].height)) {
            hideSprites();
            waitForVBlank();
            DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
            goToLose();
        }
    }
# 162 "game.c"
    apple.aniCounter += 1;
    if ((apple.aniCounter % apple.aniSwitch) == 0) {
        apple.aniCounter = 1;


        shadowOAM[0].attr2 = ((1 * 2)*32+(apple.curFrame * 2));

        if (apple.curFrame == 4 || apple.curFrame == 1) {
            apple.aniFlip *= -1;
        }
        apple.curFrame = apple.curFrame + apple.aniFlip;
    }



    if (currEnd == 10) {
        hideSprites();
        waitForVBlank();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
        goToWin();
    }



    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void spawnApple() {

    int tryAgain = 1;
    int colToTry;
    int rowToTry;
    while (tryAgain) {
        tryAgain = 0;
        rowToTry = rand() % (160 - apple.height);
        colToTry = rand() % (240 - apple.width);
        if (!collision(snakeHead.col, snakeHead.row, snakeHead.width, snakeHead.height, colToTry, rowToTry, apple.width, apple.height)) {

            for (int i = 0; i < currEnd; i++) {
                if (collision(snakeBodies[i].col, snakeBodies[i].row, snakeBodies[i].width, snakeBodies[i].height, colToTry, rowToTry, apple.width, apple.height)) {

                    tryAgain = 1;
                }
            }
        } else {

            tryAgain = 1;
        }
    }

    apple.row = rowToTry;
    apple.col = colToTry;
    shadowOAM[0].attr0 = apple.row | (0<<13) | (0<<14);
    shadowOAM[0].attr1 = apple.col | (1<<14);
}

void initSnakeBodies() {

    for (int i = 0; i < 150; i++) {
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
    snakeBodies[currEnd].active = 1;
    snakeBodies[currEnd].isTail = 1;
    snakeBodies[currEnd-1].isTail = 0;
    if (currEnd == 0) {
        snakeBodies[currEnd].dir = snakeHead.dir;
        switch(snakeHead.dir) {
            case NORTH:
                snakeBodies[currEnd].row = snakeHead.row + snakeHead.height;
                snakeBodies[currEnd].col = snakeHead.col;
                break;
            case EAST:
                snakeBodies[currEnd].row = snakeHead.row;
                snakeBodies[currEnd].col = snakeHead.col - snakeHead.width;
                break;
            case SOUTH:
                snakeBodies[currEnd].row = snakeHead.row - snakeHead.height;
                snakeBodies[currEnd].col = snakeHead.col;
                break;
            case WEST:
                snakeBodies[currEnd].row = snakeHead.row;
                snakeBodies[currEnd].col = snakeHead.col + snakeHead.width;
                break;
        }
    } else {
        snakeBodies[currEnd].dir = snakeBodies[currEnd-1].dir;
            switch(snakeBodies[currEnd-1].dir) {
                case NORTH:
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
    shadowOAM[currEnd+2].attr0 = snakeBodies[currEnd].row | (0<<13) | (0<<14);
    shadowOAM[currEnd+2].attr1 = snakeBodies[currEnd].col | (1<<14);
    shadowOAM[currEnd+2].attr2 = ((1 * 2)*32+(0));
    currEnd++;
}

void updateSnakeBodies() {
    for (int i = 0; i < 150; i++) {
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
            checkPivots(&snakeBodies[i]);

            shadowOAM[i+2].attr0 = snakeBodies[i].row | (0<<13) | (0<<14);
            shadowOAM[i+2].attr1 = snakeBodies[i].col | (1<<14);
            shadowOAM[i+2].attr2 = ((1 * 2)*32+(0));
        }
    }
}

void addPivot(int row, int col) {
    for (int i = 0; i < 100; i++) {
        if (!pivots[i].active) {

            if (currEnd != 0) {
                currNumPivots++;
                pivots[i].active = 1;
                pivots[i].row = row;
                pivots[i].col = col;
                pivots[i].dir = snakeHead.dir;
                shadowOAM[127 - i].attr0 = pivots[i].row | (0<<13) | (0<<14);
                shadowOAM[127 - i].attr1 = pivots[i].col | (1<<14);
                shadowOAM[127 - i].attr2 = ((1 * 2)*32+(0));
            }
            break;
        }
    }
}

void checkPivots(SNAKEBODY* s) {
    for (int i = 0; i < 100; i++) {
        if (pivots[i].active) {
            if (s->col == pivots[i].col && s->row == pivots[i].row) {


                s->dir = pivots[i].dir;
                if (s->isTail) {

                    pivots[i].active = 0;
                    currNumPivots--;
                    shadowOAM[127-i].attr0 = (2<<8);
                }
            }
        }
    }
}
