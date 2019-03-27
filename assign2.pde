PImage  startNormal, startHovered, title, bg , groundHogIdle , 
        soil, life, soldier,cabbage,gameover,restartNormal,restartHovered
        ;

int x=10; 
int soldierX;
int soldierY;
int cabbageX;
int cabbageY;
int life1=10, life2=80, life3=-300;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;
boolean groundHogRetern;

int groundHogX=320;
int groundHogY=80;
int groundHogSpeed=80;

final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
final int GAME_WIN = 3;
int gameState = GAME_START;

final int BUTTON_TOP = 360;
final int BUTTON_BOTTOM = 420;
final int BUTTON_LEFT= 248;
final int BUTTON_RIGHT = 392;
 

void setup() {
	size(640, 480, P2D);
	title = loadImage("img/title.jpg");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  bg = loadImage("img/bg.jpg");
  groundHogIdle = loadImage("img/groundhogIdle.png");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  soldier = loadImage("img/soldier.png");
  soldierY=floor(random(4)+2);
  soldierY=soldierY*80;
  cabbage = loadImage("img/cabbage.png");
  cabbageY=floor(random(4)+2);
  cabbageY=cabbageY*80;
  cabbageX=floor(random(8));
  cabbageX=cabbageX*80;
  gameover=loadImage("img/gameover.jpg");
  restartNormal=loadImage("img/restartNormal.png");
  restartHovered=loadImage("img/restartHovered.png");
  
}

void draw() {//start

image(title,0,0);
image(startNormal,248,360);


// Switch Game State


    // Game Start
switch(gameState){
 case GAME_START:
 if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
    && mouseY < BUTTON_BOTTOM && mouseY > BUTTON_TOP){
    image(startHovered,248,360);
    
    
    
    if(mousePressed){
     gameState = GAME_RUN;
   }
    }

    break;
    // Game Run

  
  
  case GAME_RUN:
  
  //bg
  background(bg);
//grass
  noStroke();
  fill(124,204,25);
  rect(0,145,640,15);
//soil
  image(soil,0,160);
//groundhog
  image(groundHogIdle,groundHogX,groundHogY);
//life
  image(life,life1,10);
  image(life,life2,10);
  image(life,life3,10);
//sun
  strokeWeight(5);
  stroke(255,255,0);
  fill(253,184,19);
  ellipse(590,50,120,120);
 //soldier
   soldierX=soldierX+2;
   if(soldierX>=640){
      soldierX=-80;}
image(soldier,soldierX,soldierY);
//cabbage
image(cabbage,cabbageX,cabbageY);

//meet soldier
if(soldierX+80>=groundHogX && soldierX>groundHogX && soldierY<groundHogY+80 &&
   groundHogY<soldierY+80 && groundHogX+80>soldierX){
 if(life1 == 10&& life2 == 80 && life3 == 150){
 life3=-300;
 groundHogX=320;
 groundHogY=80;}//3-2
 else if(life1 == 10 && life2 == 80 && life3 == -300)
 {life2=-200; life3 = -300;
 groundHogX=320;groundHogY=80;}//2-1
 else if(life1 == 10 && life2 == -200 &&life3 == -300){gameState=GAME_OVER;};}//1-0
 
if(cabbageX>=groundHogX && cabbageX<=groundHogX && cabbageY<=groundHogY 
   && cabbageY>=groundHogY)
   {if(life1 == 10 && life2 == 80 && life3 == -300){ life3 = 150;}//2-3)
 if(life1 == 10 && life2 == -200 && life3 == -300){ life2 = 80;}
 cabbageX=-200;}//1-2

break;


// Game Lose
case GAME_OVER:
background(gameover);
image(restartNormal,248,360);
if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
    && mouseY < BUTTON_BOTTOM && mouseY > BUTTON_TOP){
    if(mousePressed){
    gameState=GAME_RUN;
     groundHogX=320;
    groundHogY=80;
    life1 = 10;
    life2 = 80;
    life3 = -300;
   
    cabbageY=floor(random(4)+2);
  cabbageY=cabbageY*80;
  cabbageX=floor(random(8));
  cabbageX=cabbageX*80;
  ;}
    else {image(restartHovered,248,360);}

    }
    break;
}
}
 


void keyPressed(){
  if(key == CODED){
  switch(keyCode){
 
  case DOWN:
  groundHogY += groundHogSpeed;
  if (groundHogY>400){groundHogY=400;}
  break;
  
  case LEFT:
  groundHogX -= groundHogSpeed;
  if (groundHogX<0){groundHogX=0;}
  break;
  
  case RIGHT:
  groundHogX += groundHogSpeed;
  if (groundHogX>560){groundHogX=560;}
  break;
}
}
}

void keyReleased(){
  switch(keyCode){
    
  case DOWN:
  downPressed = false;
  break;
  
  case RIGHT:
  rightPressed = false;
  break;
  
  case LEFT:
  leftPressed = false;
  break;



}
 
}
