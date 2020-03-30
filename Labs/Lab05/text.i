# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 40 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 66 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 77 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 117 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "text.c" 2
# 1 "text.h" 1

void drawChar(int, int, char, unsigned short);
void drawString(int, int, char *, unsigned short);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2


void drawChar(int col, int row, char ch, unsigned short color) {

    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 6; j++) {
            if (fontdata_6x8[(48*ch) + j + (6*i)]) {
                setPixel(col+j, row+i, color);
            }
        }
    }
}


void drawString(int col, int row, char *str, unsigned short color) {

    int index = 0;
    while (str[index] != '\0') {
        drawChar(col + (index*6), row, str[index], color);
        index += 1;
    }
}
