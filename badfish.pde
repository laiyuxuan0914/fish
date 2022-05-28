class Bad {
  boolean isAlive;
  float x, y;
  float w=150;
  float h=150;
  float speed;
  PImage img;
  float direction=-1;

  Bad(float x, float y) {
    isAlive=true;
    this.y=y;
    this.x=x;
    speed=6;
    img=bad;
  }

  void checkCollision() {

    if (isOutOfScreen()) {
      isAlive=false;
      direction=-1;
    }

    if (fishX+150 >x&&
      fishX < x+w&&
      fishY+150 > y &&
      fishY < y+h ) {
      isAlive=false;
      fishHealth--;
      direction=-1;
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

  void direction() {
    if (direction==-1) {
      if (fishX+fishSSize>x&&fishX<x+w&&fishY>y+h) {
        direction=1;
      } else if (fishX+fishSSize>x&&fishX<x+w&&fishY+fishSSize<y) {
        direction=2;
      } else if (fishY<y+h&&fishY+fishSSize>y&&fishX+fishSSize<x) {
        direction=3;
      } else if (fishY<y+h&&fishY+fishSSize>y&&fishX>x+w) {
        direction=4;
      } else {
        direction=-1;
      }
    }

  }

  void update() {
    if (direction==1) {
      movedown();
      img=baddown;
    } else if ( direction==2) {
      moveup();
      img=badup;
    } else if (direction==3) {
      moveleft();
      img=badleft;
    } else if (direction==4) {
      moveright();
      img=badright;
    }
  }

  boolean isOutOfScreen() {
    return  x < 0 || x+w > width  || y < 0 || y+h > height ;
  }
}
