#include "myLib.h"
#include "stdlib.h"

// prototypes
void initialize();
void update();
void draw();
void drawFailScreen();
void drawWinScreen();
void checkForRestart();
void erase();
// buttons
unsigned short buttons;
unsigned short oldButtons;

//bumper
int bumpRow;
int bumpCol;
int bumpOCol;
int bumpHeight;
int bumpWidth;
int bumpVx;
int bumpStrength;

//"ball"
int ballRow;
int ballCol;
int ballORow;
int ballOCol;
int ballSize;
int ballVx;
int ballVy;

//target
int targetRow;
int targetCol;
int targetSize;

//mine
int mineRow;
int mineCol;
int mineSize;
//time
int time;
int timeStep;

//fail/win flags
int failFlag;
int winFlag;

int main() {

	initialize();

	while (1) {
		oldButtons = buttons;
		buttons = BUTTONS;
		if (!failFlag && !winFlag) {
			update();
			waitForVBlank();
			if (!failFlag && !winFlag) {
				draw(); //in update, if sets a flag, have to check again or else will draw one more time
			}
			

			time++;
		}
		if (failFlag) {
			drawFailScreen();
			checkForRestart();
		}
		if (winFlag) {
			drawWinScreen();
			checkForRestart();
		}
		
	}
}

// sets up the display and the game objects
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	buttons = BUTTONS;
	oldButtons = BUTTONS;

	//make whole screen black
	drawRect(0,0,240,160,BLACK);

	//initialize bottom bumper
	bumpRow = 155;
	bumpCol = 60;
	bumpOCol = bumpCol;
	bumpHeight = 3;
	bumpWidth = 120;
	bumpVx = 0; //here this is what affects the ball
	bumpStrength = 3; //how much the bump affects the velocity of the ball
	

	//initialize "ball"
	ballRow = 70;
    ballCol = 120;
    ballORow = ballRow;
    ballOCol = ballCol;
    ballSize = 5;
    ballVx = 1;
    ballVy = 2;
	
	//initialize target
	targetCol = 120 - targetSize / 2;
	targetRow = 30;
	targetSize = 12;

	//initialize mine
	mineCol  = 40;
	mineRow = 50;
	mineSize = 15;
	//draw target
	drawRect(targetCol, targetRow, targetSize, targetSize, BLUE);

	// draw mine
	drawRect(mineCol, mineRow, mineSize, mineSize, YELLOW);

	//initialize time
	time = 0;
	timeStep = 3;

	//initialize flags
	failFlag = 0; 
	winFlag = 0;
}

// performs all of the game's calculations
void update() {
	//--------------------BUMPER---------------------------
	bumpVx = 0; //only when the button is held do we want bumpVx to have a value
	//key input
	if (BUTTON_HELD(BUTTON_LEFT)) {
		bumpOCol = bumpCol;
		bumpCol = bumpCol - 1;
		bumpVx = -bumpStrength;
	}
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		bumpOCol = bumpCol;
		bumpCol = bumpCol + 1;
		bumpVx = bumpStrength;
	}

	//boundary checks, only need to check left and right
	if (bumpCol < 0) { //checks leftside
		bumpOCol = bumpCol;
		bumpCol = 0;
		bumpVx = 0;
	}
	if (bumpCol + bumpWidth - 1 > SCREENWIDTH - 1) { //check rightside
		bumpOCol = bumpCol;
		bumpCol = (SCREENWIDTH - 1) - (bumpWidth - 1);
		bumpVx = 0;
	}
	//----------------------------------------------------

	//--------------------BALL----------------------------
	//update ball position
	ballOCol = ballCol;
	ballORow = ballRow;
	if (time % timeStep == 0 && time != 0) {
		//update ball position
		ballCol += ballVx;
		ballRow += ballVy;

		//boundary checks
		if (ballCol < 0) { //check leftside
			ballCol = 0;
			ballVx = -ballVx;
		}
		if (ballCol + ballSize >= SCREENWIDTH) { //check rightside
			ballCol = SCREENWIDTH - ballSize;
			ballVx = -ballVx;
		}
		if (ballRow < 0) { // check topside
			ballRow = 0;
			ballVy = -ballVy;
		}
		if (ballRow + ballSize - 1 > SCREENHEIGHT - 1) { //check bottomside
		    failFlag = 1; //game is lost bc hit bottom
			erase();
		}

		//check collision with paddle
		if (collision(ballCol, ballRow, ballSize, ballSize, bumpCol, bumpRow, bumpWidth, bumpHeight)) {
			ballVy = -ballVy;
			ballVx += bumpVx;
		}

		//check collision with target
		if (collision(ballCol, ballRow, ballSize, ballSize, targetCol, targetRow, targetSize, targetSize)) {
			winFlag = 1; //game is won bc hit target
			erase();
		}

		//check collision with mine
		if (collision(ballCol, ballRow, ballSize, ballSize, mineCol, mineRow, mineSize, mineSize)) {
			failFlag = 1; //game is lost bc hit mine
			erase();
		}
	}
	
	//----------------------------------------------------
}

// performs all of the writing to the screen
void draw() {
	//erase old bumper
	drawRect(bumpOCol,bumpRow,bumpWidth,bumpHeight, BLACK);
	//draw bumper
	drawRect(bumpCol,bumpRow,bumpWidth,bumpHeight, WHITE);
	//erase old ball
	drawRect(ballOCol, ballORow, ballSize, ballSize, BLACK);
	//draw ball
	drawRect(ballCol,ballRow,ballSize,ballSize, RED);
}

//when ball hits bottom and lose
void drawFailScreen() {
	//draw U
	drawRect(30,40,5,40,RED);
	drawRect(35,75,15,5,RED);
	drawRect(50,40,5,40,RED);

	//draw L
	drawRect(100,40,5,40,RED);
	drawRect(105,75,15,5,RED);

	//draw O
	drawRect(130,40,5,40,RED);
	drawRect(135,40,15,5,RED);
	drawRect(135,75,15,5,RED);
	drawRect(150,40,5,40,RED);

	//draw S
	drawRect(160,40,20,5,RED);
	drawRect(160,55,20,5,RED);
	drawRect(160,75,20,5,RED);
	drawRect(160,45,5,10,RED);
	drawRect(175,60,5,15,RED);

	//draw E
	drawRect(190,40,20,5,RED);
	drawRect(190,57,20,5,RED);
	drawRect(190,75,20,5,RED);
	drawRect(190,45,5,12,RED);
	drawRect(190,62,5,13,RED);
}
//when ball hits target
void drawWinScreen() {
	//draw U
	drawRect(30,40,5,40,BLUE);
	drawRect(35,75,15,5,BLUE);
	drawRect(50,40,5,40,BLUE);

	//draw W
	drawRect(100,40,5,40,BLUE);
	drawRect(110,40,5,40,BLUE);
	drawRect(120,40,5,40,BLUE);
	drawRect(100,75,25,5,BLUE);

	//draw I
	drawRect(135,40,5,40,BLUE);

	//draw N
	drawRect(150,40,5,40,BLUE);
	drawRect(170,40,4,40,BLUE);
	drawRect(150,50,5,5,BLUE);
	drawRect(155,55,5,5,BLUE);
	drawRect(160,60,5,5,BLUE);
	drawRect(165,65,5,5,BLUE);
}

void checkForRestart() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		initialize();
	}
}

void erase() {
	drawRect(bumpCol,bumpRow,bumpWidth,bumpHeight, BLACK);
	drawRect(ballCol, ballRow, ballSize, ballSize, BLACK);
	drawRect(ballOCol, ballORow, ballSize, ballSize, BLACK);
	drawRect(targetCol, targetRow, targetSize, targetSize, BLACK);
	drawRect(mineCol, mineRow, mineSize, mineSize, BLACK);
}