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
# 178 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 189 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 229 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2

# 1 "ACbg.h" 1
# 22 "ACbg.h"
extern const unsigned short ACbgTiles[6384];


extern const unsigned short ACbgMap[4096];


extern const unsigned short ACbgPal[256];
# 4 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "main.c" 2

void initialize();

unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];

typedef struct {
 int row;
 int col;
    int rdel;
    int cdel;
 int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} ANISPRITE;

ANISPRITE villager;




enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

int main() {

    initialize();

 while(1) {






        if (villager.aniState != SPRITEIDLE) {
            villager.prevAniState = villager.aniState;
            villager.aniState = SPRITEIDLE;
        }


  if(villager.aniCounter % 18 == 0) {


            villager.curFrame = (villager.curFrame + 1) % villager.numFrames;
  }


  if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {

   vOff--;
            villager.aniState = SPRITEBACK;
  }
  if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {

   vOff++;
            villager.aniState = SPRITEFRONT;
  }
  if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {

   hOff--;
            villager.aniState = SPRITELEFT;
  }
  if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {

   hOff++;
            villager.aniState = SPRITERIGHT;
  }





        if (villager.aniState == SPRITEIDLE) {

            villager.curFrame = 0;
            villager.aniState = villager.prevAniState;
        } else {

            villager.aniCounter += 1;
        }
# 104 "main.c"
        shadowOAM[0].attr0 = villager.row | (0<<13) | (0<<14);
        shadowOAM[0].attr1 = villager.col | (3<<14);
        shadowOAM[0].attr2 = ((villager.curFrame * 8)*32+(villager.aniState * 8));

  waitForVBlank();


        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
        (*(volatile unsigned short *)0x04000010) = hOff;
        (*(volatile unsigned short *)0x04000012) = vOff;
 }

 return 0;
}


void initialize() {


    DMANow(3, ACbgPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, ACbgTiles, &((charblock *)0x6000000)[0], 12768 / 2);
    DMANow(3, ACbgMap, &((screenblock *)0x6000000)[28], 1024 * 4);



    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (3<<14);




    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512/2);

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);


    hideSprites();

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    villager.width = 64;
    villager.height = 64;
    villager.cdel = 1;
    villager.rdel = 1;
    villager.col = 240/2 - (villager.width/2);
 villager.row = 160/2 - (villager.height/2) - 10;
# 157 "main.c"
 villager.aniCounter = 0;
    villager.curFrame = 0;
    villager.numFrames = 3;

 villager.aniState = SPRITEFRONT;

    buttons = (*(volatile unsigned short *)0x04000130);


 hOff = 134;
 vOff = 172;

}
