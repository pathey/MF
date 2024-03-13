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
int map_x, map_y, theta, flag;
float true_x, true_y;
float v_x = 0, v_y = 0;
  
// Function to generate the fruit
// within the boundary 
void setup() 
{ 
    gameover = 0;
  
    // Stores height and width
    map_x = 1;
    map_y = 9;
    true_x = 1.0;
    true_y = 9.0;

    theta = 270;
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

void calc_movement(int theta){
    temp_true_x
    true_x = true_x + sin(theta)
    true_y = true_y + cos(theta)
    if (true_x > 20.0 || true_x < 20.0){
        true_x
    }

}

// Function to draw the boundaries
void draw()
{
    system("cls");
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            if (i == map_x && j == map_y)
                    printf("0");
            else {
                printf("%c", map[i][j]);
            }
        }
        printf("\n");
    }

    // Print the score after the 
    // game ends 
    printf("X: %d", true_x); 
    printf("\n");
    printf("Y: %d", true_y); 
    printf("\n");
    printf("Theta: %d", theta); 
    printf("\n");
    printf("press X to quit the game.\n\n"); 
}

// Function to perform 3D rendering
int render3d() {
    printf("This will be a 3D render.\n");
    char render_cont;
    
    while (render_cont != 'n') {
        printf("Press n to resume the game.\n");
        scanf(" %c", &render_cont);

        if (render_cont == 'n') {
            // Signal to resume the game
            return 1;
        }
    }

    // Signal not to resume the game
    return 0;
}
  
// Function to take the input 
void input() 
{
    int last_flag;
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
        case 'r':

            flag = 5;
            break;
        case 'x': 
            gameover = 1; 
            break; 
        } 
    } 
} 

// Function for the logic behind 
// each movement

// Currently only functions to move directly up/down and left/right, need to check if I can leave it as is/I want to make it correspond to where the user is looking
void logic() 
{ 
    sleep(0.2);
    int tempx = map_x;
    int tempy = map_y;
    int resumeGame;
    switch (flag) {
        case 1:
            map_y--;
            v_y == -0.25;
            if(kbhit()){
                input();
            }
            else{
                flag = 0;
            }
            break;
        case 2: 
            map_x++;
            v_x == +0.25;
            if(kbhit()){
                input();
            }
            else{
                flag = 0;
            }
            break; 
        case 3: 
            map_y++;
            v_y == +0.25;
            if(kbhit()){
                input();
            }
            else{
                flag = 0;
            }
            break; 
        case 4: 
            map_x--;
            v_x == -0.25;
            if(kbhit()){
                input();
            }
            else{
                flag = 0;
            }
            break;
        case 5:
            resumeGame = 1;
            do {
                // Call render3d and check the return value
                resumeGame = render3d();

            } while (resumeGame);
            flag = 0;
            break;
        default: 
            break;
    }
    if (map[map_x][map_y] == '#'){
        map_x = tempx;
        map_y = tempy;
    }
  
    // If the game is over 
    if (map_x < 0 || map_x > height 
        || map_y < 0 || map_y > width) 
        gameover = 1; 
  
// The comment below is code I snagged online for reference. It just randomly generates a fruit location for a snake game, but
// I scrapped the relevant use case for this code
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