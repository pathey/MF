// This is "MazeFighter" or MF
// Written by Peter Athey

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <conio.h>

int i, j, height = 30;
int width = 30, gameover, score;
int x, y, fruitx, fruity, flag;

void draw(){
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            if (i == 0 || i == width - 1 || j == 0 || j == height - 1) {
                printf("#");
            }
            else {
                printf(" ");
            }
        }
    printf("\n");
    }
}

void setup(){
    gameover = 0;
    x = height/2;
    y = width/2;
    label1:
        fruitx = rand()%20;
        if (fruitx == 0)
            goto label1;
    label2:
        fruity=rand()%20;
        if(fruity == 0)
            goto label2;
    score = 0;

}

void input(){
    if(kbhit()){
        switch(getch()){
            case 'a':
                flag=1;
                break;
            case 's':
                flag = 2;
                break;
            case 'd':
                flag = 3;
                break;
            case 'w':
                flag = 4;
                break;
            case 'x':
                gameover=1;
                break;

        }
    }
}

void logic(){
    sleep(0.01);
    switch(flag){
        case 1:
            y--;
            flag = 0;
            break;
        case 2:
            x++;
            flag = 0;
            break;
        case 3:
            y++;
            flag = 0;
            break;
        case 4:
            x--;
            flag = 0;
            break;
        default:
        break;
    }
    if( x < 0 || x > height || y < 0 || y > width)
        gameover = 1;
    if( x == fruitx && y == fruity){
        
        label3:
        fruitx = rand()%20;
        if(fruitx == 0)
            goto label3;
        label4:
        fruity=rand()%20;
        if(fruity==0)
            goto label4;
        score +=10;
    }
}

int main(){
    int m, n;
    setup();
    while(!gameover){
        while(!gameover){
            draw();
            input();
            logic();
        }
    }

    return 0;
}