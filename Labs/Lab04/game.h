// TODO 2.0: Make the player struct as per the instructions
// Player Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int bulletTimer;
} PLAYER;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BULLET;


// Ball Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BALL;

// Constants
#define BULLETCOUNT 5
#define BALLCOUNT 5

// Variables
// UNCOMMENT 2.0
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern BALL balls[BALLCOUNT];
extern int ballsRemaining;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void drawBar();
// UNCOMMENT 2.3
void initPlayer();
void updatePlayer();
void drawPlayer();
// UNCOMMENT 3.2
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
void initBalls();
void updateBall(BALL *);
void drawBall(BALL *);