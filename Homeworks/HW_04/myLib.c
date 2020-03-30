#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Set a pixel on the screen in Mode 3
void setPixel3(int col, int row, unsigned short color) {

	videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

// Set a pixel on the screen in Mode 4
void setPixel4(int col, int row, unsigned char colorIndex) {

    // TODO 1.0: Write this function
    unsigned short pixelData = videoBuffer[OFFSET(col, row, SCREENWIDTH) / 2];
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= (colorIndex << 8);
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[OFFSET(col, row, SCREENWIDTH) / 2] = pixelData;

}

// Draw a rectangle at the specified location and size in Mode 3
void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {

	for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(col, row + r, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
	}
}

// Draw a rectangle at the specified location and size in Mode 4
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {

    // TODO 5.0: Write this function using DMA
    volatile unsigned short colorData = colorIndex << 8 | colorIndex;
    //iterate through height
    for (int curHeight = 0; curHeight < height; curHeight++) {
        //CONDITION 1 even column, even width
        if (width < 3) { //is a bullet
            //can't DMA, draw px instead
            setPixel4(col, row + curHeight, colorIndex);
        }else if (!(col & 1) && !(width & 1)) {
            DMANow(3, &colorData, &videoBuffer[OFFSET(col, row + curHeight, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
        }else if (!(col & 1) && (width & 1)) { //CONDITION 2 even column, odd width
            DMANow(3, &colorData, &videoBuffer[OFFSET(col, row + curHeight, SCREENWIDTH)/2], DMA_SOURCE_FIXED | ((width-1)/2));
            //now set last pixel
            setPixel4(col + width - 1, row + curHeight, colorIndex);
        }else if ((col & 1) && (width & 1)) {  //CONDITION 3 odd column, odd width
            //set first pixel
            setPixel4(col, row + curHeight, colorIndex);
            //DMA rest
            DMANow(3, &colorData, &videoBuffer[OFFSET(col + 1, row + curHeight, SCREENWIDTH)/2], DMA_SOURCE_FIXED | ((width-1)/2));
        }else { //CONDITION 4 odd column, even width
            //set first pixel
            setPixel4(col, row + curHeight, colorIndex);
            //DMA middle
            DMANow(3, &colorData, &videoBuffer[OFFSET(col + 1, row + curHeight, SCREENWIDTH)/2], DMA_SOURCE_FIXED | ((width-2)/2));
            //set last pixel
            setPixel4(col + width -1, row + curHeight, colorIndex);
        }
    }

}

// Fill the entire screen with a single color in Mode 3
void fillScreen3(volatile unsigned short color) {
    unsigned short c = color;
	DMANow(3, &c, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

// Fill the entire screen with a single color in Mode 4
void fillScreen4(volatile unsigned char colorIndex) {

    // TODO 2.0: Write this function using DMA
    volatile unsigned short color = colorIndex << 8 | colorIndex;
    DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | ((SCREENWIDTH * SCREENHEIGHT) / 2));

}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int col, int row, int width, int height, const unsigned short *image) {

    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(0, r, width)], &videoBuffer[OFFSET(col, row + r, SCREENWIDTH)], width);
    }
}

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage4(int col, int row, int width, int height, const unsigned short *image) {

    // TODO 4.0: Write this function using DMA
    for (int imageRow = 0; imageRow < height; imageRow++) {
        DMANow(3, &image[OFFSET(0, imageRow, width/2)], &videoBuffer[OFFSET(col, row + imageRow, SCREENWIDTH)/2], width / 2);
    }

}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage4(const unsigned short *image) {

    // TODO 3.0: Write this function using DMA
    DMANow(3, image, videoBuffer, ((SCREENWIDTH * SCREENHEIGHT)) / 2);
}

// Pause code execution until vertical blank begins
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage() {

    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // Turn DMA off
    dma[channel].cnt = 0;

    // Set source and destination
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Set control and begin
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}