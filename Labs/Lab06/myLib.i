# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 27 "myLib.h"
extern unsigned short *videoBuffer;
# 47 "myLib.h"
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
# 83 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 94 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 134 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "myLib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


void setPixel3(int col, int row, unsigned short color) {

 videoBuffer[((row)*(240)+(col))] = color;
}


void setPixel4(int col, int row, unsigned char colorIndex) {


    unsigned short pixelData = videoBuffer[((row)*(240)+(col)) / 2];
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= (colorIndex << 8);
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((row)*(240)+(col)) / 2] = pixelData;

}


void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {

 for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
 }
}


void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {


    volatile unsigned short colorData = colorIndex << 8 | colorIndex;

    for (int curHeight = 0; curHeight < height; curHeight++) {

        if (width < 3) {

            setPixel4(col, row + curHeight, colorIndex);
        }else if (!(col & 1) && !(width & 1)) {
            DMANow(3, &colorData, &videoBuffer[((row + curHeight)*(240)+(col))/2], (2 << 23) | width/2);
        }else if (!(col & 1) && (width & 1)) {
            DMANow(3, &colorData, &videoBuffer[((row + curHeight)*(240)+(col))/2], (2 << 23) | ((width-1)/2));

            setPixel4(col + width - 1, row + curHeight, colorIndex);
        }else if ((col & 1) && (width & 1)) {

            setPixel4(col, row + curHeight, colorIndex);

            DMANow(3, &colorData, &videoBuffer[((row + curHeight)*(240)+(col + 1))/2], (2 << 23) | ((width-1)/2));
        }else {

            setPixel4(col, row + curHeight, colorIndex);

            DMANow(3, &colorData, &videoBuffer[((row + curHeight)*(240)+(col + 1))/2], (2 << 23) | ((width-2)/2));

            setPixel4(col + width -1, row + curHeight, colorIndex);
        }
    }

}


void fillScreen3(volatile unsigned short color) {
    unsigned short c = color;
 DMANow(3, &c, videoBuffer, (2 << 23) | (240 * 160));
}


void fillScreen4(volatile unsigned char colorIndex) {


    volatile unsigned short color = colorIndex << 8 | colorIndex;
    DMANow(3, &color, videoBuffer, (2 << 23) | ((240 * 160) / 2));

}


void drawImage3(int col, int row, int width, int height, const unsigned short *image) {

    for(int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width)+(0))], &videoBuffer[((row + r)*(240)+(col))], width);
    }
}


void drawImage4(int col, int row, int width, int height, const unsigned short *image) {


    for (int imageRow = 0; imageRow < height; imageRow++) {
        DMANow(3, &image[((imageRow)*(width)+(0))/2], &videoBuffer[((row + imageRow)*(240)+(col))/2], width / 2);
    }

}


void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, 240 * 160);
}


void drawFullscreenImage4(const unsigned short *image) {


    DMANow(3, image, videoBuffer, ((240 * 160)) / 2);
}


void waitForVBlank() {

 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}


void flipPage() {

    if ((*(unsigned short *)0x4000000) & (1<<4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(unsigned short *)0x4000000) ^= (1<<4);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {


    dma[channel].cnt = 0;


    dma[channel].src = src;
    dma[channel].dst = dst;


    dma[channel].cnt = cnt | (1 << 31);
}


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
