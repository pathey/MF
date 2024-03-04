// This is "MazeFighter" or MF
// Written by Peter Athey
// Have to run set PATH=D:\MinGW\bin;%PATH% beforehand on my machine, this comment is so I have it stored somewhere convenient
// Followed by gcc MF.c -o MF.exe


#include <stdio.h> 
#include <stdlib.h> 
#include <unistd.h> 
#include <conio.h>


int i, j, height = 20, width = 20;
// This array is hard coded because this is the map, it will be intended to be a maze, so I will need it to
// be hard coded as the intended maze
char map[20][20] = {{'#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', '#', '#', '#', '#', '#', ' ', '#', '#', '#', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
                   {'#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'}};

int gameover, score; 
int x, y, fruitx, fruity, flag; 
  
// Function to generate the fruit
// within the boundary 
void setup() 
{ 
    gameover = 0;
  
    // Stores height and width 
    x = 1;
    y = 9;
// label1: 
//     fruitx = rand() % 20; 
//     if (fruitx == 0) 
//         goto label1; 
// label2: 
//     fruity = rand() % 20; 
//     if (fruity == 0) 
//         goto label2; 
//     score = 0; 
} 
  
// Function to draw the boundaries 
void draw() 
{ 
    system("cls"); 
    for (i = 0; i < height; i++) { 
        for (j = 0; j < width; j++) { 
            if (i == x && j == y) 
                    printf("0");
            else {
                printf("%c", map[i][j]);
            }
        } 
        printf("\n"); 
    } 
  
    // Print the score after the 
    // game ends 
    printf("score = %d", score); 
    printf("\n"); 
    printf("press X to quit the game"); 
} 
  
// Function to take the input 
void input() 
{ 
    if (kbhit()) { 
        switch (getch()) { 
        case 'a': 
            flag = 1; 
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
            gameover = 1; 
            break; 
        } 
    } 
} 
  
// Function for the logic behind 
// each movement 
void logic() 
{ 
    sleep(0.1);
    int tempx = x;
    int tempy = y;
    switch (flag) {
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
    if (map[x][y] == '#'){
        x = tempx;
        y = tempy;
    }
  
    // If the game is over 
    if (x < 0 || x > height 
        || y < 0 || y > width) 
        gameover = 1; 
  
    // If snake reaches the fruit 
    // then update the score 
    // if (x == fruitx && y == fruity) { 
    // label3: 
    //     fruitx = rand() % 20; 
    //     if (fruitx == 0) 
    //         goto label3; 
  
    // After eating the above fruit 
    // generate new fruit 
    // label4: 
    //     fruity = rand() % 20; 
    //     if (fruity == 0) 
    //         goto label4; 
    //     score += 10; 
    //} 
} 
  
// Driver Code 
void main() 
{ 
    int m, n; 
  
    // Generate boundary 
    setup(); 
  
    // Until the game is over 
    while (!gameover) { 
  
        // Function Call 
        draw(); 
        input(); 
        logic(); 
    } 
} 