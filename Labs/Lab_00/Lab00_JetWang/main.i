# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 24 "main.c"
void setPixel(int, int, unsigned short);
void delay();
void updateBG(int);
void updateCharacter(int);
void drawCharacterAt(int,int,int);
unsigned short backgroundColor(int);
void drawRain(int,int);

int cx[48] = {3 ,4 ,5 ,6 ,7 ,8 ,9 ,9 ,10,11,12,12,13,14,15,16,17,17,18,19,19,19,19,19,38,37,36,35,34,33,32,32,31,30,29,29,28,27,26,25,24,24,23,22,22,22,22,22};
int cy[48] = {38,38,38,38,38,38,38,39,39,39,39,40,40,40,40,40,40,41,41,41,42,43,44,45,38,38,38,38,38,38,38,39,39,39,39,40,40,40,40,40,40,41,41,41,42,43,44,45};
unsigned short bg[272];

int main() {
    *(unsigned short *)0x4000000 = 1027;

    int i = 0;
    for(i = 0; i < 25200; i++)
    {
        ((unsigned short *)0x6000000)[i] = ((16) | (16)<<5 | (31)<<10);
    }
    for(i=25200;i<38400;i++)
    {
        ((unsigned short *)0x6000000)[i] = ((16) | (16)<<5 | (16)<<10);
    }
    for(i=0;i<105;i++)
    {
        bg[i] = ((16) | (16)<<5 | (31)<<10);
    }
    for(i=105;i<272;i++)
    {
        bg[i] = ((16) | (16)<<5 | (16)<<10);
    }

    int j = 0;
    while(1)
    {
        if(j%500==0)
        {
            for(i = 0; i < 25200; i++)
            {
                ((unsigned short *)0x6000000)[i] = ((16) | (16)<<5 | (31)<<10);
            }
            for(i=25200;i<38400;i++)
            {
                ((unsigned short *)0x6000000)[i] = ((16) | (16)<<5 | (16)<<10);
            }
        }
        updateBG(j);

        if(j%8==0)
        {
            updateCharacter(j/8);
        }

        j++;
        delay();
    }
}

void updateBG(int i)
{
    drawRain(i,i+20 );
    drawRain(i+7,i+26 );
    drawRain(i,i+20 );
    drawRain(i+17,i );
    drawRain(i+30,i+32);
    drawRain(i+17,i+60);
    drawRain(i+42,i+44);
    drawRain(i+11,i+46);
    drawRain(i+86,i+93);
    drawRain(i+88,i+77);
    drawRain(i+77,i+66);
    drawRain(i+66,i+55);
    drawRain(i+55,i+40);
    drawRain(i+2,i+3 );
    drawRain(i,i+20 );
    drawRain(i+7,i+26 );
    drawRain(i,i+20 );
    drawRain(i+17,i );
    drawRain(i+30,i+32);
    drawRain(i+17,i+60);
    drawRain(i+42,i+44);
    drawRain(i+11,i+46);
    drawRain(i+86,i+93);
    drawRain(i+88,i+77);
    drawRain(i+77,i+66);
    drawRain(i+66,i+55);
    drawRain(i+55,i+40);
    drawRain(i+2,i+3 );
# 121 "main.c"
}

void drawRain(int x, int y)
{
    setPixel(x,y,((29) | (29)<<5 | (29)<<10));
    setPixel(x-1,y-1,backgroundColor(y-1));

    setPixel(x*2,y*2,((29) | (29)<<5 | (29)<<10));
    setPixel((x-1)*2,(y-1)*2,backgroundColor((y-1)*2));

    setPixel(x*3,y*3,((29) | (29)<<5 | (29)<<10));
    setPixel((x-1)*3,(y-1)*3,backgroundColor((y-1)*3));

    setPixel((x+10)*2,(y+20)*2,((29) | (29)<<5 | (29)<<10));
    setPixel((x+9)*2,(y+19)*2,backgroundColor((y+19)*2));

    setPixel((x-40)*3,(y-14)*3,((29) | (29)<<5 | (29)<<10));
    setPixel((x-41)*3,(y-15)*3,backgroundColor((y-15)*3));
}

unsigned short backgroundColor(int col)
{
    return(bg[col%272]);
}

int characterposition = 0;
int up = 1;
void updateCharacter(int i)
{
    characterposition = i%6;
    if(up == 1)
    {
        int k;
        for(k=0;k<43;k++)
        {
            int j;
            for(j=0;j<48;j++)
            {
                setPixel(100+k,39+j,((16) | (16)<<5 | (31)<<10));
            }
        }
        drawCharacterAt(100, 40 + characterposition, i);
        if(characterposition == 5)
        {
            up = 0;
        }
    }
    else
    {
        int k;
        for(k=0;k<43;k++)
        {
            int j;
            for(j=0;j<48;j++)
            {
                setPixel(100+k,46+j,((16) | (16)<<5 | (31)<<10));
            }
        }
        drawCharacterAt(100, 45 - characterposition, i);
        if(characterposition == 5)
        {
            up = 1;
        }
    }
}

void drawCharacterAt(int x, int y, int t)
{
    int i;


    for(i = 14; i < 28; i++)
    {
        int j;
        for(j = 0; j < 11; j++)
        {
            setPixel(x + i, y + j, ((18) | (13)<<5 | (10)<<10));
        }
    }


    setPixel(x + 20, y, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 21, y, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 18, y+1, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 19, y+1, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 20, y+1, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 21, y+1, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 22, y+1, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 23, y+1, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 19, y+2, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 20, y+2, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 21, y+2, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 22, y+2, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 20, y+3, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 21, y+3, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 17, y+6, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 18, y+6, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 23, y+6, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));
    setPixel(x + 24, y+6, ((10+t/2) | (31+t/2)<<5 | (29+t/2)<<10));


    setPixel(x + 20, y+9, ((14) | (10)<<5 | (8)<<10));
    setPixel(x + 21, y+9, ((14) | (10)<<5 | (8)<<10));


    for(i = 11; i < 31; i++)
    {
        int j;
        for(j = 15; j < 23; j++)
        {
            setPixel(x + i, y + j, ((28) | (23)<<5 | (13)<<10));
        }
    }
    for(i = 12; i < 30; i++)
    {
        setPixel(x + i, y + 23, ((28) | (23)<<5 | (13)<<10));
    }
    for(i = 13; i < 29; i++)
    {
        int j;
        for(j = 24; j < 35; j++)
        {
            setPixel(x + i, y + j, ((28) | (23)<<5 | (13)<<10));
        }
    }
    setPixel(x + 16, y + 14, ((28) | (23)<<5 | (13)<<10));
    setPixel(x + 17, y + 14, ((28) | (23)<<5 | (13)<<10));
    setPixel(x + 17, y + 13, ((28) | (23)<<5 | (13)<<10));
    setPixel(x + 24, y + 13, ((28) | (23)<<5 | (13)<<10));
    setPixel(x + 24, y + 14, ((28) | (23)<<5 | (13)<<10));
    setPixel(x + 25, y + 14, ((28) | (23)<<5 | (13)<<10));


    for(i = 18; i < 24; i++)
    {
        int j;
        for(j = 11; j < 18; j++)
        {
            setPixel(x + i, y + j, ((18) | (13)<<5 | (10)<<10));
        }
    }
    setPixel(x + 20, y + 18, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 21, y + 18, ((18) | (13)<<5 | (10)<<10));


    setPixel(x + 31, y + 15, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 32, y + 15, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 31, y + 16, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 31, y + 17, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 31, y + 18, ((18) | (13)<<5 | (10)<<10));
    for(i = 32; i < 35; i++)
    {
        int j;
        for(j = 16; j < 30; j++)
        {
            setPixel(x + i, y + j, ((18) | (13)<<5 | (10)<<10));
        }
    }
    for(i = 22; i < 32; i++)
    {
        int j;
        for(j = 27; j < 30; j++)
        {
            setPixel(x + i, y + j, ((18) | (13)<<5 | (10)<<10));
        }
    }
    setPixel(x + 22, y + 24, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 23, y + 24, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 22, y + 25, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 23, y + 25, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 22, y + 26, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 23, y + 26, ((18) | (13)<<5 | (10)<<10));


    setPixel(x + 9, y + 15, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 10, y + 15, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 10, y + 16, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 10, y + 17, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 10, y + 18, ((18) | (13)<<5 | (10)<<10));
    for(i = 7; i < 10; i++)
    {
        int j;
        for(j = 16; j < 30; j++)
        {
            setPixel(x + i, y + j, ((18) | (13)<<5 | (10)<<10));
        }
    }
    for(i = 10; i < 20; i++)
    {
        int j;
        for(j = 27; j < 30; j++)
        {
            setPixel(x + i, y + j, ((18) | (13)<<5 | (10)<<10));
        }
    }
    setPixel(x + 18, y + 24, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 19, y + 24, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 18, y + 25, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 19, y + 25, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 18, y + 26, ((18) | (13)<<5 | (10)<<10));
    setPixel(x + 19, y + 26, ((18) | (13)<<5 | (10)<<10));


    for(i = 3; i < 39; i++)
    {
        int j;
        for(j = 35; j < 46; j++)
        {
            setPixel(x + i, y + j, ((31) | (30)<<5 | (25)<<10));
        }
    }
    for(i = 1; i < 3; i++)
    {
        int j;
        for(j = 36; j < 45; j++)
        {
            setPixel(x + i, y + j, ((31) | (30)<<5 | (25)<<10));
        }
    }
    for(i = 37; i < 43; i++)
    {
        setPixel(x, y + i, ((31) | (30)<<5 | (25)<<10));
    }
    for(i = 39; i < 41; i++)
    {
        int j;
        for(j = 36; j < 45; j++)
        {
            setPixel(x + i, y + j, ((31) | (30)<<5 | (25)<<10));
        }
    }
    for(i = 37; i < 43; i++)
    {
        setPixel(x + 41, y + i, ((31) | (30)<<5 | (25)<<10));
    }


    for(i=0;i<48;i++) {
        setPixel(x + cx[i], y + cy[i], ((24) | (23)<<5 | (19)<<10));
    }

}

void setPixel(int row, int col, unsigned short color)
{
    ((unsigned short *)0x6000000)[((col)*240+(row))] = color;
}

void delay() {
    int i;
    volatile int b;
    for(i=0;i<30000;i++) {
        b++;
    }
}
