# 1 "hw01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hw01.c"
# 23 "hw01.c"
void setPixel(int, int, unsigned short);
void drawRect(int, int, int, int, unsigned short);
void delay(int);
void drawJ(int, int, unsigned short);
void drawE(int, int, unsigned short);
void drawT(int, int, unsigned short);

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;
int main() {

    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);
    while(1) {

        drawT(170, 20, 0);
        drawJ(10, 20, ((31) | (0)<<5 | (0)<<10));
        delay(250);

        drawJ(10, 20, 0);
        drawE(100, 20, ((0) | (31)<<5 | (0)<<10));
        delay(250);

        drawE(100, 20, 0);
        drawT(170, 20, ((0) | (0)<<5 | (31)<<10));
        delay(250);

    }
    return 0;
}

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void delay(int time) {
    volatile int trash = 0;
    for (int i = 0; i < time * 1000; i++) {
        trash++;
    }
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            setPixel(col + i, row + j, color);
        }
    }
}

void drawJ(int col, int row, unsigned short color) {
    drawRect(col, row, 80, 20, color);
    drawRect(col + 30, row + 20, 20, 80, color);
    drawRect(col, row + 100, 50, 20, color);
}
void drawE(int col, int row, unsigned short color) {
    drawRect(col, row, 60, 20, color);
    drawRect(col, row + 50, 60, 20, color);
    drawRect(col, row + 100, 60, 20, color);
    drawRect(col, row + 20, 20, 30, color);
    drawRect(col, row + 70, 20, 30, color);
}
void drawT(int col, int row, unsigned short color) {
    drawRect(col, row, 60, 20, color);
    drawRect(col + 20, row + 20, 20, 100, color);
}
