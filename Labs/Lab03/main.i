# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 39 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 64 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 74 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "coords.h" 1

extern int visiblePersonRows[190];
extern int visiblePersonCols[190];
extern int invisiblePersonRows[190];
extern int invisiblePersonCols[190];
# 3 "main.c" 2


void initialize();
void drawCacti();
void drawPerson(int cols[], int rows[], int numCoords, unsigned short color);
void drawBackground();
void drawCactus(int col);
void eraseCactus(int col);
void advanceCacti();
void swap(int* a, int* b);


unsigned short buttons;
unsigned short oldButtons;
# 25 "main.c"
int cactusCols[] = {0, 73, 147};
int oldCactusCols[] = {0, 73, 147};


int cactusColsLength = 3;


int up = 0;
int time = 0;

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        advanceCacti();
        if (((!(~(oldButtons) & ((1<<3)))) && (~(buttons) & ((1<<3)))) && !up) {
            up = 1;


            for (int i = 0; i < 190; i++) {
                swap(&visiblePersonCols[i],&invisiblePersonCols[i]);
                swap(&visiblePersonRows[i],&invisiblePersonRows[i]);
            }




        } else if (time == 45 && up) {
            time = 0;
            up = 0;


            for (int i = 0; i < 190; i++) {
                swap(&visiblePersonCols[i],&invisiblePersonCols[i]);
                swap(&visiblePersonRows[i],&invisiblePersonRows[i]);
            }




        }


        if (up) {
            time++;
        }

        waitForVBlank();



        drawPerson(invisiblePersonCols, invisiblePersonRows, 190, ((15) | (15)<<5 | (31)<<10));

        drawCacti();

        drawPerson(visiblePersonCols, visiblePersonRows, 190, ((31) | (31)<<5 | (31)<<10));
    }
}


void initialize() {

    (*(unsigned short *)0x4000000) = 3 | (1<<10);
    drawBackground();
}



void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}



void drawCacti() {


    for (int i = 0; i < cactusColsLength; i++) {

        eraseCactus(oldCactusCols[i]);

        drawCactus(cactusCols[i]);
    }




}


void drawPerson(int cols[], int rows[], int numCoords, unsigned short color) {


    for (int i = 0; i < numCoords; i++) {
        setPixel(cols[i],rows[i], color);
    }



}


void drawBackground() {


    int i;
    for (i = 0; i < 240*100; i++) {
        videoBuffer[i] = ((15) | (15)<<5 | (31)<<10);
    }


    for (; i < 240*160; i++) {
        videoBuffer[i] = ((31) | (31)<<5 | (15)<<10);
    }
}


void drawCactus(int col) {

    int row = 72;
    drawRect(col, row + 7, 4, 9, ((3) | (31)<<5 | (3)<<10));
    drawRect(col + 4, row + 12, 3, 4, ((3) | (31)<<5 | (3)<<10));
    drawRect(col + 7, row, 6, 30, ((3) | (31)<<5 | (3)<<10));
    drawRect(col + 13, row + 15, 3, 4, ((3) | (31)<<5 | (3)<<10));
    drawRect(col + 16, row + 10, 4, 9, ((3) | (31)<<5 | (3)<<10));
}


void eraseCactus(int col) {

    int row = 72;
    drawRect(col, row, 20, 100 - row, ((15) | (15)<<5 | (31)<<10));
    drawRect(col, 100, 20, 30 - (100 - row), ((31) | (31)<<5 | (15)<<10));
}


void advanceCacti() {

    int arraylen = sizeof(cactusCols)/sizeof(cactusCols[0]);
    for (int i = 0; i < arraylen; i++) {

        oldCactusCols[i] = cactusCols[i];

        cactusCols[i]++;
        if (cactusCols[i] > 240 - 20) {
            cactusCols[i] = 0;
        }
    }
}
