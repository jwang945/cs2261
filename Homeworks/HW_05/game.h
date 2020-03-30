#define MAXSNAKEBODIES 150 //150 is from (240*160)/(16*16) or numPx/sizeOfBodyPart
#define NUMPIVOTS 100
typedef struct{
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int dir;
    int numBods;
} SNAKEHEAD;

typedef struct{
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int dir;
    int active;
    int isTail;
} SNAKEBODY;

typedef struct{
    int row;
    int col;
    int width;
    int height;
    int curFrame;
    int aniCounter;
    int aniSwitch;
    int aniFlip;
} APPLE;

typedef struct{
    int row;
    int col;
    int dir;
    int width;
    int height;
    int active;
} PIVOT;

void initGame();
void updateGame();
void goToLose();
void goToWin();
int rand();
void spawnApple();
void initSnakeBodies();
void addNewBody();
void updateSnakeBodies();
void addPivot(int row, int col);
void checkPivots(SNAKEBODY* s);