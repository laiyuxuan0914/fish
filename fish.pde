PImage gamestart, background, bad, bubble, life, magnet, rush;
PImage fishS, fishM, fishL;
PImage rushfish, magnetfish, bubblefish;
PFont font;

//gamestate
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
final int GAME_WIN = 3;
int gameState = GAME_START;
//button
final int BUTTON_TOP = 210;
final int BUTTON_BOTTOM = 280;
final int BUTTON_LEFT = 115;
final int BUTTON_RIGHT = 450;
//final int BUTTON_SPACEBAR=32;

boolean upPressed, downPressed, rightPressed, leftPressed;
//fishspeed
float fishSpeed=10;
//fishsize
float fishSSize=150;
float fishMSize=200;
float fishLSize=250;
//fishx,y
float fishX, fishY;
//bad fishx,y
float badX, badY;
//bubblex,y
float bubbleX, bubbleY;
//rushx,y
float rushX, rushY;
//magnetx,y
float magnetX, magnetY;
//life
int fishHealth=3;
//points
final int GAME_INIT_POINTS=0;
int gamePoints=GAME_INIT_POINTS;

void setup() {
  size(1600, 900);
  //loadimage
  background=loadImage("img/background.jpg");
  gamestart=loadImage("img/gamestart.png");
  bad=loadImage("img/bad.png");
  bubble=loadImage("img/bubble.png");
  life=loadImage("img/life.png");
  life=loadImage("img/life.png");
  rush=loadImage("img/rush.png");
  magnet=loadImage("img/magnet.png");
  fishS=loadImage("img/fishS.png");
  fishM=loadImage("img/fishM.png");
  fishL=loadImage("img/fishL.png");
  rushfish=loadImage("img/rushfish.png");
  magnetfish=loadImage("img/magnetfish.png");
  bubblefish=loadImage("img/bubblefish.png");
  //fish start place
  fishX=width/2-fishSSize/2;
  fishY=height/2-fishSSize/2;
  //bad fish init place
  // badX=
  // badY=

  //bubble init place
  // bubbleX=
  // bubbleY=

  //rush init place
  //rushX=
  //rushY=

  //magnet init place
  //magnetX=
  // magnetY=

  //font
  // font=createFont("font/font.ttf", 56);
  //  textFont(font);
}
void draw() {
  switch(gameState) {
  case GAME_START:
    image(gamestart, 0, 0);
    if (mousePressed) {
      gameState = GAME_RUN;
    }
    break;
  case GAME_RUN:
    image(background, 0, 0);
    //life
    for (int i = 0; i < fishHealth; i++) {
      image(life, 40 + i * 120, 40);
    }
    //light

    //magnet

    //bubble

    //rush

    //bad

    //fishS
    if (upPressed) {
      fishY-=fishSpeed;
      if (fishY<0)fishY=0;
    }
    if (downPressed) {
      fishY+=fishSpeed;
      if (fishY+fishSSize>height)fishY=height-fishSSize;
    }
    if (leftPressed) {
      fishX-=fishSpeed;
      if (fishX<0)fishX=0;
    }
    if (rightPressed) {
      fishX+=fishSpeed;
      if (fishX+fishSSize>width)fishX=width-fishSSize;
    }
    image(fishS, fishX, fishY);
    //fishM
    //fishL
    break;
  case GAME_WIN:
    break;
  case GAME_OVER:
    break;
  }
}
void drawPoints() {
  String pointsString=(gamePoints)+"points";
  textSize(56);
  textAlign(RIGHT, BOTTOM);
  fill(0,0,120);
  text(pointsString, width, height);
}
void addpoints(float points) {
  gamePoints+=points;
}
/*color getColor() {
  return;
}*/

void keyPressed() {
  switch(keyCode) {
  case UP:
    upPressed=true;
    break;
  case DOWN:
    downPressed=true;
    break;
  case LEFT:
    leftPressed=true;
    break;
  case RIGHT:
    rightPressed=true;
    break;
  }
}

void keyReleased() {
  switch(keyCode) {
  case UP:
    upPressed=false;
    break;
  case DOWN:
    downPressed=false;
    break;
  case LEFT:
    leftPressed=false;
    break;
  case RIGHT:
    rightPressed=false;
    break;
  }
}
