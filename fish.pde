PImage gamestart, background, bad, bubbleing, life, magneting, rushing, win, lose;

PImage fishS, fishM, fishL;

PImage baddown, badleft, badright, badup;

PImage rushfishS, rushfishM, rushfishL;

PImage magnetfishS, magnetfishM, magnetfishL;

PImage bubblefishS, bubblefishM, bubblefishL;

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

final int itemChance=1;


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

Bubble bubble;

float bubbleSSize=150;

float bubbleMSize=200;

float bubbleLSize=250;

//rushx,y

float rushX, rushY;

Rush rush;

float rushSSize=150;

float rushMSize=200;

float rushLSize=250;

//magnetx,y

float magnetX, magnetY;

Magnet magnet;

float magnetSSize=150;

float magnetMSize=200;

float magnetLSize=250;



//life

int fishHealth=3;

//points

final int GAME_INIT_POINTS=0;

int gamePoints=GAME_INIT_POINTS;

//light

Lights [] lights;

//item

Item[] items;
int itemTime=0;
//bads

Bad[]bads;

int badtime=0;

int j=0;

int time =0;

int min = 0;

int sec = 0;

int animationFrame = 0;

int points = 0;

boolean isHit =false;

boolean isAlive=false;

float timer = 0;

float [] lightsTimer;

boolean [] lightsON;



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

  bubbleing=loadImage("img/bubble.png");

  life=loadImage("img/life.png");

  life=loadImage("img/life.png");

  rushing=loadImage("img/rush.png");

  magneting=loadImage("img/magnet.png");

  fishS=loadImage("img/fishS.png");

  fishM=loadImage("img/fishM.png");

  fishL=loadImage("img/fishL.png");

  rushfishS=loadImage("img/rushfishS.png");

  rushfishM=loadImage("img/rushfishM.png");

  rushfishL=loadImage("img/rushfishL.png");

  magnetfishS=loadImage("img/magnetfishS.png");

  magnetfishM=loadImage("img/magnetfishM.png");

  magnetfishL=loadImage("img/magnetfishL.png");

  bubblefishS=loadImage("img/bobfishS.png");

  bubblefishM=loadImage("img/bobfishM.png");

  bubblefishL=loadImage("img/bobfishL.png");

  win=loadImage("img/win.jpg");

  lose=loadImage("img/lose.jpg");

  //fish start place INIT PLACE

  fishX=width/2-fishSSize/2;

  fishY=height/2-fishSSize/2;

  //bad fish init place
  bads=new Bad[100];
  badfishReborn();

  //item init place
  items=new Item[20];
  itemsReborn();
  //font
  // font=createFont("font/font.ttf", 56);
  //  textFont(font);


  //light new array

  lights = new Lights[10];
  for (int i = 0; i<lights.length; i++) {
    lights[i] = new Lights();
  }
  isHit =false;



  //lights on
  lightsON = new boolean[10];
  for (int i = 0; i<lights.length; i++) {
    lightsON[i] = false;
  }

  lightsTimer = new float[10];
  for (int i = 0; i<lights.length; i++) {
    lightsTimer[i] = 0;
  }
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

    //light timer
    for (int i = 0; i<lights.length; i++) {
      lightsTimer[i]=floor(random(60));
      if (lightsTimer[i]==30) {
        lightsON[i] = true;
      }
    }

    //light
    for (int i = 0; i<lights.length; i++) {
      if (lightsON[i]) {
        lights[i].sizes();
        lights[i].LightColor();
        lights[i].display();
      }
    }

    //bad
    for (int i=0; i<100; i++) {
      if (bads[i]!=null&&bads[i].isAlive ) {
        bads[i].update();
        bads[i].display();
        bads[i].checkCollision();
        bads[i].direction();
      }
    }

    badtime++;
    if (badtime>180) {
      badtime=0;
      badfishReborn();
      break;
    }

    //item
    for (int i=0; i<items.length; i++) {
      if (items[i]!=null&&items[i].isAlive ) {
        items[i].display();
        items[i].checkCollision();
      }
    }

    itemTime++;
    if (itemTime>600) {
      itemTime=0;
      itemsReborn();
      break;
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
    if (mousePressed) {
      gameState = GAME_RUN;
      Lights [] lights;
      lights = new Lights[10];
      bads=new Bad[100];
      fishHealth=3;
      gamePoints=GAME_INIT_POINTS;
      time =0;
      min = 0;
      sec = 0;
      animationFrame = 0;
      points = 0;
      isHit =false;
      timer = 0;

      fishX=width/2-fishSSize/2;
      fishY=height/2-fishSSize/2;

      fishSize = fishS;
      gamePoints=0;

      fishX=width/2-fishSSize/2;
      fishY=height/2-fishSSize/2;

      //light restart
      for (int i = 0; i<lights.length; i++) {
        gamePoints=0;
        lightsON[i] = false;
        points=0;
      }
      //badfish restart
      badfishReborn();
    }
    break;


  case GAME_OVER:
    image(lose, 0, 0);
    if (mousePressed) {
      gameState = GAME_RUN;
      Lights [] lights;
      lights = new Lights[10];
      bads=new Bad[100];
      fishHealth=3;
      gamePoints=GAME_INIT_POINTS;

      badtime=0;
      itemTime=0;
      time =0;
      min = 0;
      sec = 0;
      animationFrame = 0;
      points = 0;
      isHit =false;
      timer = 0;
      fishX=width/2-fishSSize/2;
      fishY=height/2-fishSSize/2;
      fishSize = fishS;
      gamePoints=0;
      fishX=width/2-fishSSize/2;
      fishY=height/2-fishSSize/2;

      //light restart
      for (int i = 0; i<lights.length; i++) {
        gamePoints=0;
        lightsON[i] = false;
        points=0;
      }
      //item reborn
      itemsReborn();
      //badfish restart
      badfishReborn();
    }
    break;
  }
}

void itemsReborn() {
  for (int i=0; i<items.length; i++) {
    if (items[i]==null||!bads[i].isAlive) {
      float newX=random(width-150);
      float newY=random(height-150);
      float choose=random(2);
      if (choose<0.66) {
        items[i]=new Bubble(newX, newY);
      } else if (choose>=0.66&&choose<1.33) {
        items[i]=new Rush(newX, newY);
      } else if (choose>=1.33) {
        items[i]=new Magnet(newX, newY);
      }
      break;
    }
  }
}


void badfishReborn() {
  for (int i=0; i<100; i++) {
    if (bads[i]==null||!bads[i].isAlive ) {
      bads[i] = new Bad(random(width-150), random(height-150));
      break;
    }
  }
}



void drawPoints() {



  //add 1 point a second

  if (animationFrame%60==0) {

    points++;
  }



  //lights change to another places



  for (int i = 0; i<lights.length; i++) {

    if (lights[i].lightSize==60) {

      if (lightsON[i]==true) {

        points=0;



        lightsTimer[i]=floor(random(60));

        lights[i].initSizes();

        lights[i].initLightColor();

        lights[i].lightX =floor(random(width-1));

        lights[i].lightY =floor(random(height-1));
      }
    }
  }



  //text

  gamePoints = addpoints(points);

  String pointsString=(gamePoints)+"points";

  textSize(56);

  textAlign(RIGHT, BOTTOM);

  getColor();

  text(pointsString, width, height);



  //time

  time = floor(animationFrame/60);

  sec = time;

  String timeString="0";



  if (time<60) {

    sec = time;

    min = 0;

    timeString="0"+(min)+":0"+(sec);
  }

  if (time<60 && time>9) {

    sec = time;

    min = 0;

    timeString="0"+(min)+":"+(sec);
  }

  if (time>60 && time<=69) {

    sec = time-60;

    min = 1;

    timeString="0"+(min)+":0"+(sec);
  }



  if (time>69 && time<120) {

    sec = time-60;

    min = 1;

    timeString="0"+(min)+":"+(sec);
  }



  textSize(56);

  textAlign(LEFT, BOTTOM);

  getColor();

  text(timeString, 0, height);
}





int addpoints(int points) {

  //boolean isHit (fish and lights)

  for (int i = 0; i<lights.length; i++) {

    float distance = dist(fishX+fishSSize/2, fishY+fishSSize/2, lights[i].lightX, lights[i].lightY);

    if (distance<lights[i].lightSize/2+fishSSize/2-10) {

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
