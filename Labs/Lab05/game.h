// Player Struct
typedef struct {
	int col;
	int row;
	int oldCol;
	int oldRow;
	int cdel;
	int rdel;
	int width;
	int height;
	unsigned short color;
	int bulletTimer;
} PLAYER;

// Bullet Struct
typedef struct {
	int col;
	int row;
	int oldCol;
	int oldRow;
	int cdel;
	int rdel;
	int width;
	int height;
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
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern BALL balls[BALLCOUNT];
extern int ballsRemaining;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void drawBar();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
void initBalls();
void updateBall(BALL *);
void drawBall(BALL *);