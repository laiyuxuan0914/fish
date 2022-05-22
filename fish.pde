PImage gamestart, background, bad, bubble, life, magnet, rush, win, lose;
PImage fishS, fishM, fishL;
PImage baddown, badleft, badright, badup;
PImage rushfishS, magnetfishS, bubblefishS;
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
//light
Lights [] lights;
//bads
Bad[]bads;

int animationFrame = 0;
int points = 0;
boolean isHit =false;

void setup() {
  size(1600, 900);
  //loadimage
  background=loadImage("img/background.jpg");
  gamestart=loadImage("img/gamestart.png");
  bad=loadImage("img/bad.png");
  baddown=loadImage("img/baddown.png");
  badleft=loadImage("img/badleft.png");
  badright=loadImage("img/badright.png");
  badup=loadImage("img/badup.png");
  bubble=loadImage("img/bubble.png");
  life=loadImage("img/life.png");
  life=loadImage("img/life.png");
  rush=loadImage("img/rush.png");
  magnet=loadImage("img/magnet.png");
  fishS=loadImage("img/fishS.png");
  fishM=loadImage("img/fishM.png");
  fishL=loadImage("img/fishL.png");
  rushfishS=loadImage("img/rushfishS.png");
  magnetfishS=loadImage("img/magnetfishS.png");
  bubblefishS=loadImage("img/bobfishS.png");
  win=loadImage("img/win.jpg");
  lose=loadImage("img/lose.jpg");
  //fish start place
  fishX=width/2-fishSSize/2;
  fishY=height/2-fishSSize/2;
  //bad fish init place
  bads=new Bad[1];
  for (int i = 0; i<bads.length; i++) {
    bads[i] = new Bad(random(width), random(height));
  }

  //bubble init place
   
    image(bubble,bubbleX,bubbleY);
  //bubbleX=
    bubbleX = random(width-150);
  //bubbleY=
    bubbleY = random(height-150);
  
  //rush init place
    image(rush,rushX,rushY);
  //rushX=
    rushX = random(width-150);
  //rushY=
    rushY = random(height-150);

  //magnet init place   
    image(magnet,magnetX,magnetY);
  //magnetX=
    magnetX = random(width-150);
  //magnetY=
    magnetY = random(height-150);

  //font
  // font=createFont("font/font.ttf", 56);
  //  textFont(font);

  //light new array
  lights = new Lights[10];
  for (int i = 0; i<lights.length; i++) {
    lights[i] = new Lights();
  }
  isHit =false;
}
void draw() {
  animationFrame++;
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
    for (int i = 0; i<lights.length; i++) {
      lights[i].sizes();
      lights[i].LightColor();
      lights[i].display();
    }
     //rush
      image(rush,rushX,rushY);
      if(fishX >= rushX && fishX + 150 <= rushX + 150
      && fishY >= rushY && fishY + 150 <= rushY + 150){
      fishSpeed=15; 
      
      }
    //magnet
      image(magnet,magnetX,magnetY);
    //bubble
      image(bubble,bubbleX,bubbleY);
  
    //bad
    for (int i = 0; i<bads.length; i++) {
      bads[i].update();
      bads[i].display();
      bads[i].checkCollision();
    }

    if (fishHealth<1) {
      gameState=GAME_OVER;
    }
    //fishS

    PImage fishSize = fishS;
    if (gamePoints>0) {
      fishSize = fishS;
    }
    //fishM
    if (gamePoints>20) {
      fishSize = fishM;
      fishSSize = 200;
    }
    //fishL
    if (gamePoints>50) {
      fishSize = fishL;
      fishSSize = 250;
    }

    //fish image
    image(fishSize, fishX, fishY);

    //fish keyPress
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


    //point
    drawPoints();

    //to gamewin case
    if (gamePoints>=100) {
      gameState = GAME_WIN;
    }
    break;

  case GAME_WIN:
    image(win, 0, 0);

    //to gamerun case
    if (mousePressed) {
      gameState = GAME_RUN;
      //light restart
      for (int i = 0; i<lights.length; i++) {
        gamePoints=0;
        points=0;
        lights[i].initSizes();
        lights[i].initLightColor();
        lights[i].lightX =floor(random(width-1));
        lights[i].lightY =floor(random(height-1));
        fishX=width/2-fishSSize/2;
        fishY=height/2-fishSSize/2;
      }

      //badfish restart
      for (int i = 0; i<bads.length; i++) {
        bads[i].isAlive=true;
       
        bads[i].update();
        bads[i].display();
        bads[i].checkCollision();
        bads[i].x=random(width);
        bads[i].y=random(height);
      }
    }
    break;

  case GAME_OVER:
    break;
  }
}
void badfishReborn() {
  if (points==20||points==40||points==60||points==75||points==90) {
    for (int i = 0; i<bads.length; i++) {
      if ( bads[i].isAlive==false) {
        bads[i].isAlive=true;
      }
      bads[i].x=random(width);
      bads[i].y=random(height);
    }
  }
}
void drawPoints() {

  //add 1 point a second
  if (animationFrame%60==0) {
    points++;
  }

  //lights change to another places
  if (points==5) {
    for (int i = 0; i<lights.length; i++) {
      points=0;
      lights[i].initSizes();
      lights[i].initLightColor();
      lights[i].lightX =floor(random(width-1));
      lights[i].lightY =floor(random(height-1));
    }
  }

  //text
  gamePoints = addpoints(points);
  String pointsString=(gamePoints)+"points";
  textSize(56);
  textAlign(RIGHT, BOTTOM);
  getColor();
  text(pointsString, width, height);
}


int addpoints(int points) {
  //boolean isHit (fish and lights)
  for (int i = 0; i<lights.length; i++) {
    if (fishX+150 > lights[i].lightX-lights[i].lightSize/2 &&
      fishX < lights[i].lightX+lights[i].lightSize/2 &&
      fishY+150 > lights[i].lightY-lights[i].lightSize/2 &&
      fishY < lights[i].lightY+lights[i].lightSize/2 ) {
      isHit = true;
    } else {
      isHit = false;
    }

    //addpoints & the lights change to another places
    if (isHit) {
      lights[i].lightX =floor(random(width-1));
      lights[i].lightY =floor(random(height-1));
      return(gamePoints+=points);
    }
  }
  return(gamePoints);
}
void getColor() {
  if (gamePoints>=20) {
    fill(0, 0, 120);
  }
  if (gamePoints>=20) {
    fill(255, 255, 255);
  }
  if (gamePoints>=50) {
    fill(255, 255, 0);
  }
}

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
