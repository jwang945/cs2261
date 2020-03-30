//structs
typedef struct{
    int row;
    int col;
    int cdel;
    int rdel;
    int oldRow;
    int oldCol;
    int height;
    int width;
} TIGER;

typedef struct{
    int row;
    int col;
    int cdel;
    int rdel;
    int oldRow;
    int oldCol;
    int height;
    int width;
    int erased;
    int respawn; //starts at 0, after it's been erased, will count up to respawntime, if equals respawntime, sets as unerased 
} BUNNY;

enum  {WHITEID = 3};
//constants
#define BUNNYCOUNT 4
#define BUNNYHEIGHT 10
#define BUNNYWIDTH 10
#define RESPAWNTIME 100
#define BUNNIESTOEAT 30

//variables
extern int bunniesEaten;
//prototypes
void initGame();
void updateGame();
void drawGame();

void initTiger();
void updateTiger();
void drawTiger();

void initBunnies();
void updateBunny(BUNNY* bunny);
void drawBunny(BUNNY* bunny);