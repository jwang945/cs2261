// Player Struct
typedef struct {
	int row;
	int col;
	int cdel;
	int height;
	int width;
	unsigned char color;
	int bulletTimer;
	int cDirection; // So the bullet knows which cdel to take
} PLAYER;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned char color;
	int active;
} BULLET;

// Ball Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int isAlien;
	int active;
} BALL;

// Constants
#define BULLETCOUNT 5
#define BALLCOUNT 5

// Variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern BALL balls[BALLCOUNT];
extern int ballsRemaining;

// Custom Game Colors
#define NUMCOLORS 6
// This does an enum trick to make them the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

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