#include "myLib.h"
#include "stdlib.h"

// prototypes
void initialize();
void update();
void draw();

// buttons
unsigned short buttons;
unsigned short oldButtons;

// background
unsigned short bgColor;

// green rectangles
int gRow0, gRow1, gRow2, gRow3;
int gCol0, gCol1, gCol2, gCol3;
int gHeight;
int gWidth;

// blue rectangle
int bRow;
int bCol;
int bOldRow;
int bOldCol;
int bRDel;
int bCDel;
int bHeight;
int bWidth;

int main() {

	initialize();

	while (1) {
		// TODO #3.2: update the button variables each frame
		oldButtons = buttons;
		buttons = BUTTONS;

		update();
		waitForVBlank();
		draw();
	}
}

// sets up the display and the game objects
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	// TODO #3.1: intialize your button variables
	buttons = BUTTONS;
	oldButtons = BUTTONS;

	// initialize background
	// UNCOMMENT #2
	bgColor = CYAN;
	fillScreen(bgColor);

	// Initialize green rectangles
	gHeight = 19;
	gWidth = 15;

	gRow0 = (SCREENHEIGHT / 2) - (gHeight / 2); // middle
	gCol0 = 5;									// left

	gRow1 = (SCREENHEIGHT / 2) - (gHeight / 2); // middle
	gCol1 = SCREENWIDTH - gWidth - 5;			// right

	gRow2 = SCREENHEIGHT - gHeight - 5;		    // bottom
	gCol2 = (SCREENWIDTH / 2) - (gWidth / 2);   // middle

	gRow3 = 5;								    // top
	gCol3 = (SCREENWIDTH / 2) - (gWidth / 2);   // middle

	// initialize blue rectangle
	bHeight = 17;
	bWidth = 10;
	bRow = (SCREENHEIGHT / 2) - (bHeight / 2);
	bCol = (SCREENWIDTH / 2) - (bWidth / 2);
	bOldRow = bRow;
	bOldCol = bCol;
	bRDel = 1;
	bCDel = 1;
}

// performs all of the game's calculations
void update() {
	// change the background color if Start is pressed
	// UNCOMMENT #3
	if (BUTTON_PRESSED(BUTTON_START)) {
		if (bgColor == CYAN)
			bgColor = YELLOW;
		else
			bgColor = CYAN;
		fillScreen(bgColor);
	}

	// boundary checks
	if (bCol < 0) { // left
		bOldCol = bCol;
		bCol = 0;
	}
	if (bCol + bWidth - 1 > SCREENWIDTH - 1) { // right
		bOldCol = bCol;
		bCol = (SCREENWIDTH - 1) - (bWidth - 1);
	}
	if (bRow < 0) { // top
		bOldRow = bRow;
		bRow = 0;
	}
	if (bRow + bHeight - 1 > SCREENHEIGHT - 1) { // bottom
		bOldRow = bRow;
		bRow = (SCREENHEIGHT - 1) - (bHeight - 1);
	}

	// move the blue rectangle with the buttons
	// TODO #4: make the blue rectangle move with the arrow keys
	if (BUTTON_HELD(BUTTON_UP)) {
		bOldRow = bRow;
		bRow = bRow - 1;
	}
	if (BUTTON_HELD(BUTTON_DOWN)) {
		bOldRow = bRow;
		bRow = bRow + 1;
	}
	if (BUTTON_HELD(BUTTON_LEFT)) {
		bOldCol = bCol;
		bCol = bCol - 1;
	}
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		bOldCol = bCol;
		bCol = bCol + 1;
	}



	// reset blue rectangle to center upon collision with a green rectangle
	// TODO #5.1: set the col and row of the blue rectangle to it's initial position
	// (i.e. the middle of the screen) if the blue rectangle collides with any of the
	// green rectangles

	//g0
	if (collision(bCol, bRow, bWidth, bHeight, gCol0, gRow0, gWidth, gHeight)) {
		bRow = (SCREENHEIGHT / 2) - (bHeight / 2);
	    bCol = (SCREENWIDTH / 2) - (bWidth / 2);
	}
	//g1
	if (collision(bCol, bRow, bWidth, bHeight, gCol1, gRow1, gWidth, gHeight)) {
		bRow = (SCREENHEIGHT / 2) - (bHeight / 2);
	    bCol = (SCREENWIDTH / 2) - (bWidth / 2);
	}
	//g2
	if (collision(bCol, bRow, bWidth, bHeight, gCol2, gRow2, gWidth, gHeight)) {
		bRow = (SCREENHEIGHT / 2) - (bHeight / 2);
	    bCol = (SCREENWIDTH / 2) - (bWidth / 2);
	}
	//g3
	if (collision(bCol, bRow, bWidth, bHeight, gCol3, gRow3, gWidth, gHeight)) {
		bRow = (SCREENHEIGHT / 2) - (bHeight / 2);
	    bCol = (SCREENWIDTH / 2) - (bWidth / 2);
	}
}

// performs all of the writing to the screen
void draw() {
	// UNCOMMENT #1
	// erase the previous blue rectangle location
	drawRect(bOldCol, bOldRow, bWidth, bHeight, bgColor);

	// draw the new blue rectangle location
	drawRect(bCol, bRow, bWidth, bHeight, BLUE);

	// draw stationary green rectangles
	drawRect(gCol0, gRow0, gWidth, gHeight, GREEN);
	drawRect(gCol1, gRow1, gWidth, gHeight, GREEN);
	drawRect(gCol2, gRow2, gWidth, gHeight, GREEN);
	drawRect(gCol3, gRow3, gWidth, gHeight, GREEN);

	// Update old variables
	bOldRow = bRow;
	bOldCol = bCol;
}