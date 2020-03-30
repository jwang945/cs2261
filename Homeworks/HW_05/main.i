# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "startscreen.h" 1
# 22 "startscreen.h"
extern const unsigned short startscreenTiles[6160];


extern const unsigned short startscreenMap[1024];


extern const unsigned short startscreenPal[256];
# 3 "main.c" 2
# 1 "mainscreen.h" 1
# 22 "mainscreen.h"
extern const unsigned short mainscreenTiles[864];


extern const unsigned short mainscreenMap[1024];


extern const unsigned short mainscreenPal[256];
# 4 "main.c" 2
# 1 "winscreen.h" 1
# 22 "winscreen.h"
extern const unsigned short winscreenTiles[800];


extern const unsigned short winscreenMap[1024];


extern const unsigned short winscreenPal[256];
# 5 "main.c" 2
# 1 "losescreen.h" 1
# 22 "losescreen.h"
extern const unsigned short losescreenTiles[128];


extern const unsigned short losescreenMap[1024];


extern const unsigned short losescreenPal[256];
# 6 "main.c" 2

void initialize();
void game();
void initGame();
void srand();
void updateGame();

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


enum {START, GAME, PAUSE, WIN, LOSE};
int state;


unsigned short buttons;
unsigned short oldButtons;

int seed;

int main() {

    initialize();

    while(1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((16)<<8) | (0<<14) | (0<<7);

    buttons = (*(volatile unsigned short *)0x04000130);
    goToStart();
}

void goToStart() {
    seed = 0;
    waitForVBlank();
    state = START;

    DMANow(3, startscreenPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, startscreenTiles, &((charblock *)0x6000000)[0], 12320/2);

    DMANow(3, startscreenMap, &((screenblock *)0x6000000)[16], 2048/2);
}

void start() {

    waitForVBlank();
    seed++;


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initGame();
        goToGame();
    }
}

void goToGame() {
    srand(seed);
    state = GAME;
    waitForVBlank();

    DMANow(3, mainscreenPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, mainscreenTiles, &((charblock *)0x6000000)[0], 1728/2);

    DMANow(3, mainscreenMap, &((screenblock *)0x6000000)[16], 2048/2);
}

void game() {
    updateGame();
    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToPause();




}

void goToPause() {

    waitForVBlank();
    state = PAUSE;
}

void pause() {
    waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToGame();
    else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))
        goToStart();
}

void goToWin() {
    waitForVBlank();
    state = WIN;

    DMANow(3, winscreenPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, winscreenTiles, &((charblock *)0x6000000)[0], 1600/2);

    DMANow(3, winscreenMap, &((screenblock *)0x6000000)[16], 2048/2);
}

void win() {
    waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToStart();
}

void goToLose() {
    waitForVBlank();
    state = LOSE;

    DMANow(3, losescreenPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, losescreenTiles, &((charblock *)0x6000000)[0], 256/2);

    DMANow(3, losescreenMap, &((screenblock *)0x6000000)[16], 2048/2);
}

void lose() {
    waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToStart();
}
