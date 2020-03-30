#include "myLib.h"
// TODO 1.0: Include your .h files here.
#include "ACbg.h"
#include "spritesheet.h"

void initialize();

unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];

typedef struct {
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} ANISPRITE;

ANISPRITE villager;

// States used for villager.aniState
// Idle does not have an actual image associated with it;
// Whenever villager is idle, just show whatever state villager was before (prevAniState)
enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

int main() {

    initialize(); 

	while(1) {

        // TODO 2.1: Set previous state to current state (if not idle)
		//           then reset villager's state to idle
		// NOTE: We reset villager's state to idle at the beginning of every
		//       frame so that we can easily check to see if any button was pressed.
		// Look for the TODO past the button input section for more explanation, but don't complete it yet
        if (villager.aniState != SPRITEIDLE) {
            villager.prevAniState = villager.aniState;
            villager.aniState = SPRITEIDLE;
        }

        // Change the animation frame every 18 frames of gameplay
		if(villager.aniCounter % 18 == 0) {
			// TODO 2.2: Change the frame here
			//           Remember that there are only numFrames number of frames
            villager.curFrame = (villager.curFrame + 1) % villager.numFrames;
		}
		
        // Control movement and change animation state
		if(BUTTON_HELD(BUTTON_UP)) {
			// TODO 2.3: Set villager's aniState here accordingly
			vOff--;
            villager.aniState = SPRITEBACK;
		}
		if(BUTTON_HELD(BUTTON_DOWN)) {
			// TODO 2.4: Set villager's aniState here accordingly
			vOff++;
            villager.aniState = SPRITEFRONT;
		}
		if(BUTTON_HELD(BUTTON_LEFT)) {
			// TODO 2.5: Set villager's aniState here accordingly
			hOff--;
            villager.aniState = SPRITELEFT;
		}
		if(BUTTON_HELD(BUTTON_RIGHT)) {
			// TODO 2.6: Set villager's aniState here accordingly 
			hOff++;
            villager.aniState = SPRITERIGHT;
		}

		// TODO 2.7: If the villager aniState is idle (thus no key is held), 
		//           we want the frame to be villager standing (frame 0)
		//           in whatever direction villager was facing (set aniState to prevAniState)
        //           Else, if villager aniState is not idle, we want to increment aniCounter
        if (villager.aniState == SPRITEIDLE) {
            //if idle, want frame to be frame 0
            villager.curFrame = 0;
            villager.aniState = villager.prevAniState;
        } else {
            //increment aniCounter
            villager.aniCounter += 1;
        }
        // TODO 2.8: Using the proper flags from myLib.h, set up all of your sprite attributes.
        //           (seriously, go look in myLib.h for sprite stuff)
        //           Remember, you will want to consider your current frame and animation state
        //           when telling attr2 which tile index to find the image at.
        //           Hint: frames are the rows of the spritesheet, and animation states are the columns
        //           Hint: since this sprite is 64x64, you are going to have to do some multiplication...
        //				   (each tile is 8x8)
        //           When villager is idle (the aniState SPRITEIDLE), the frame should be 0

        //-------------2.8-------------------
        shadowOAM[0].attr0 = villager.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = villager.col | ATTR1_LARGE;
        shadowOAM[0].attr2 = ATTR2_TILEID(villager.aniState * 8, villager.curFrame * 8);
        //-------------2.8-------------------
		waitForVBlank();

        // TODO 2.9: Copy the shadowOAM into the OAM
        DMANow(3, shadowOAM, OAM, 128 * 4); //128 indices in shadowOAM and each index has a struct with 4 shorts so 128 * 4 
        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;
	}

	return 0;
}


void initialize() {

    // Load the background's palette and tiles into a desired space in memory
    DMANow(3, ACbgPal, PALETTE, 256);
    DMANow(3, ACbgTiles, &CHARBLOCK[0], ACbgTilesLen / 2);
    DMANow(3, ACbgMap, &SCREENBLOCK[28], 1024 * 4);

    // Tell the BG0 control register where to look for its tiles and tile map AND
    // 		how to read them from this location (using the given settings)
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;
    
    // TODO 1.1: Load the spritesheet Tiles and Pal into THEIR desired spaces in memory
    // (Sprite Palette and Background Palette are 2 different things)
    //sprite palette
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    //sprite tiles
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    // TODO 1.2: Hide all sprites with hideSprites().  You must complete this function yourself in myLib.c.
    hideSprites();

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; // TODO 1.3: Enable Sprites here    

    villager.width = 64;
    villager.height = 64;
    villager.cdel = 1;
    villager.rdel = 1;
    villager.col = SCREENWIDTH/2 - (villager.width/2);
	villager.row = SCREENHEIGHT/2 - (villager.height/2) - 10;

	// TODO 2.0: Just read this (carefully).  No code needs to be edited here.
	/*	=== Animation Variables ===
	*	aniCounter: Used to count how many frames have passed
	*	curFrame: which frame of animation villager is in (row in spritesheet)
    *   numFrames: the total number of frames
	*	aniState: which state of animation villager is in (column in spritesheet)
	*/
	villager.aniCounter = 0;
    villager.curFrame = 0;
    villager.numFrames = 3;

	villager.aniState = SPRITEFRONT; 

    buttons = BUTTONS;
    
    // Because why not start here?
	hOff = 134;
	vOff = 172;

}