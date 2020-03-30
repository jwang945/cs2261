# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 39 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 65 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 78 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {

   for (int i = 0; i < height; i++) {
       for (int j = 0; j < width; j++) {
           setPixel(col + i, row + j, color);
       }
   }




}

void fillScreen(unsigned short color) {


    for (unsigned short i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }



}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {

    int topA = rowA;
    int leftA = colA;
    int rightA = colA + widthA;
    int bottomA = rowA + heightA;

    int topB = rowB;
    int leftB = colB;
    int rightB = colB + widthB;
    int bottomB = rowB + heightB;

    return (bottomA >= topB && topA <= bottomB && rightA >= leftB && leftA <= rightB);





}
