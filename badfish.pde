class Bad {
  boolean isAlive;
  float x, y;
  float w=150;
  float h=150;
  float speed;
  PImage img;

  Bad(float x, float y) {
    isAlive=true;
    this.y=y;
    this.x=x;
    speed=10;
    img=bad;
  }

  void checkCollision() {
    if (isAlive==true) {
      if (fishX+150 >x&&
        fishX < x+w&&
        fishY+150 > y &&
        fishY < y+h ) {
        isAlive=false;
        fishHealth--;
      }
    }
  }

  void movedown() {
    y+=speed;
  }
  void moveleft() {
    x-=speed;
  }
  void moveup() {
    y-=speed;
  }
  void moveright() {
    x+=speed;
  }

  void display() {
    if (isAlive==true) {
      image(img, x, y);
    }
  }

  void update() {
    if (fishX+fishSSize>x&&fishX<x+w&&fishY>y+h) {
      movedown();
      img=baddown;
    } else if (fishX+fishSSize>x&&fishX<x+w&&fishY+fishSSize<y) {
      moveup();
      img=badup;
    } else if (fishY<y+h&&fishY+fishSSize<y&&fishX+fishSSize<x) {
      moveleft();
      img=badleft;
    } else if (fishY<y+h&&fishY+fishSSize<y&&fishX>x+w) {
      moveright();
      img=badright;
    } else {
      display();
    }



  }


}
