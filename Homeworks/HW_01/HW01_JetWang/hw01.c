// GBA Video Registers and Flags
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(col, row, rowlen) ((row)*(rowlen)+(col))

// Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

// Function Prototypes
void setPixel(int, int, unsigned short);
void drawRect(int, int, int, int, unsigned short);
void delay(int);
void drawJ(int, int, unsigned short);
void drawE(int, int, unsigned short);
void drawT(int, int, unsigned short);
// Global Variables
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;
int main() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    while(1) {

        drawT(170, 20, BLACK);
        drawJ(10, 20, RED);
        delay(250);

        drawJ(10, 20, BLACK);
        drawE(100, 20, GREEN);
        delay(250);

        drawE(100, 20, BLACK);
        drawT(170, 20, BLUE);
        delay(250);

    }
    return 0;
}

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, 240)] = color;
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