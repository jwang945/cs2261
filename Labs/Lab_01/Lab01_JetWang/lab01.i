# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"
# 23 "lab01.c"
void setPixel(int, int, unsigned short);
void drawTriangle(int, int);
void drawRect(int, int);


volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);


    drawTriangle(10,10);
    drawTriangle(50,100);
    drawRect(150,60);
    while(1);
    return 0;
}


void setPixel(int col, int row, unsigned short color) {





    videoBuffer[((row)*(240)+(col))] = color;
}

void drawTriangle(int col, int row) {


    for (int i = 0; i < 10; i++) {
        for (int j = i; j < 10; j++) {
            setPixel(col + i, row + j, ((31) | (31)<<5 | (31)<<10));
        }
    }
}

void drawRect(int col, int row) {


    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 20; j++) {
            setPixel(col + i, row + j, ((31) | (31)<<5 | (31)<<10));
        }
    }
}
