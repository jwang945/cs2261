typedef struct {
    int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
    int rdel;
	int height;
	int width;
	unsigned short color;
} PLAYER;

typedef struct {
    int row;
    int col;
    int oldRow;
    int rdel;
    int height;
    int width;
    unsigned short color;
    int active;
} BOMB;

//constants
#define BOMBCOUNT 50
#define BOMBSIZE 10
#define BOMBSTOSURVIVE 100
//variables
extern int loseFlag;
extern int bombsSurvived;
//prototypes
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();

void initBombs();
void updateBomb();
void drawBomb();

void chanceToSpawn();