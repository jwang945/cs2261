#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "alien.h"
// TODO 4.3: Include alien.h


// Variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
BALL balls[BALLCOUNT];
int ballsRemaining;

// Initialize the game
void initGame() {

	initPlayer();
    initBullets();
    initBalls();

    // Initialize the score
	ballsRemaining = BALLCOUNT;

    // Initialize the colors
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};

    //TODO 4.2: Load the alien image's colors
	DMANow(3, alienPal, PALETTE, 256);

    // Load the custom game colors to the end
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

// Updates the game each frame
void updateGame() {

	updatePlayer();

	// Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet(&bullets[i]);

	// Update all the balls
	for (int i = 0; i < BALLCOUNT; i++)
		updateBall(&balls[i]);
}

// Draws the game each frame
void drawGame() {

    fillScreen4(BLACKID);

	drawPlayer();
	drawBar();

	// Draw all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		drawBullet(&bullets[i]);

	// Draw all the balls
	for (int i = 0; i < BALLCOUNT; i++)
		drawBall(&balls[i]);
}

// Draws the bar protecting the player
void drawBar() {
	drawRect4(0, 120, 240, 3, REDID);
}

// Initialize the player
void initPlayer() {

	player.row = 130;
	player.col = 118;
	player.cdel = 2;
	player.height = 10;
	player.width = 5;
	player.color = GREENID;
	player.bulletTimer = 20;
}

// Handle every-frame actions of the player
void updatePlayer() {

	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT)
		&& player.col >= player.cdel) {

		player.col -= player.cdel;
        player.cDirection = -1;

	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

		player.col += player.cdel;
        player.cDirection = 1;

	} else {
        player.cDirection = 0;
    }

	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 13) {

		fireBullet();
		player.bulletTimer = 0;
	}

	player.bulletTimer++;
}

// Draw the player
void drawPlayer() {

	drawRect4(player.col, player.row, player.width, player.height, player.color);
}

// Initialize the pool of bullets
void initBullets() {

	for (int i = 0; i < BULLETCOUNT; i++) {

		bullets[i].height = i+1; // Varies size for testing drawRect
		bullets[i].width = i+1;    // Varies size for testing drawRect
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].rdel = -2;
        bullets[i].cdel = 0;
		bullets[i].color = WHITEID;
		bullets[i].active = 0;
	}
}

// Spawn a bullet
void fireBullet() {

	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {

			// Position the new bullet
			bullets[i].row = player.row;
			bullets[i].col = player.col + player.width/2
				- bullets[i].width/2;

            // Slant it in the direction of player movement
            bullets[i].cdel = player.cDirection;

			// Take the bullet out of the pool
			bullets[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {

	// If active, update; otherwise ignore
	if (b->active) {
		if (b->row + b->height-1 >= 0
            && b->col + b->cdel > 0
            && b->col + b->cdel < SCREENWIDTH-1) {

			b->row += b->rdel;
            b->col += b->cdel;
		} else {
			b->active = 0;
		}
	}
}

// Draw a bullet
void drawBullet(BULLET* b) {

	if(b->active) {
		drawRect4(b->col, b->row, b->width, b->height, b->color);
	}
}

// Initialize the balls
void initBalls() {

	for (int i = 0; i < BALLCOUNT; i++) {
		balls[i].row = rand() % 110;
		balls[i].col = rand() % 130 + 10;
		balls[i].rdel = 2;
		balls[i].cdel = 2;
        balls[i].isAlien = i & 1; // Makes only i=1,3 an alien
		balls[i].active = 1;

		if (balls[i].isAlien) {
			balls[i].height = 32;
			balls[i].width = 40;
		} else {
			balls[i].height = 12;
			balls[i].width = 12;
		}
	}
}

// Handle every-frame actions of a ball
void updateBall(BALL* b) {

	if (b->active) {

		// Bounce the ball off the sides of the box
		if (b->row <= 1 || b->row + b->height-1 >= 119)
			b->rdel *= -1;
		if (b->col <= 1 || b->col + b->width-1 >= SCREENWIDTH-2)
			b->cdel *= -1;

		// Move the ball
		b->row += b->rdel;
		b->col += b->cdel;

		// Handle ball-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active && collision(b->col, b->row, b->width, b->height,
				bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)) {

				// Put ball back in the pool
				bullets[i].active = 0;
				b->active = 0;

				// Update the score
				ballsRemaining--;
			}
		}
	}
}
// Draw a ball
void drawBall(BALL* b) {

	// UNCOMMENT 4.0
	if(b->active) {
		if (b->isAlien)
			drawImage4(b->col, b->row, b->width, b->height, alienBitmap);
		else
			drawRect4(b->col, b->row, b->width, b->height, BLUEID);
	}
}