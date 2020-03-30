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
void drawTriangle(int, int);
void drawRect(int, int);

// Global Variables
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // TODO: Call your drawTriangle function twice your drawRect function once
    drawTriangle(10,10);
    drawTriangle(50,100);
    drawRect(150,60);
    while(1);
    return 0;
}


void setPixel(int col, int row, unsigned short color) {
    // TODO: Complete this function

    //unsigned short *pixelAddress = 0x06000000 + 2*((col) + 240*(row));
    //*pixelAddress = color;

    videoBuffer[OFFSET(col, row, 240)] = color;
}

void drawTriangle(int col, int row) {

    // TODO: Complete this function
    for (int i = 0; i < 10; i++) {
        for (int j = i; j < 10; j++) {
            setPixel(col + i, row + j, WHITE);
        }
    }
}

void drawRect(int col, int row) {

    // TODO: Complete this function
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 20; j++) {
            setPixel(col + i, row + j, WHITE);
        }
    }
}
