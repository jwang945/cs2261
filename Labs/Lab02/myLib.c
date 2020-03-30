#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    // TODO #1: implement this function
   for (int i = 0; i < height; i++) {
       for (int j = 0; j < width; j++) {
           setPixel(col + i, row + j, color);
       }
   }




}

void fillScreen(unsigned short color) {
    // TODO #2: implement this function
    // note: you may only use a single loop
    for (unsigned short i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }



}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    // TODO #5.0: implement this function
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