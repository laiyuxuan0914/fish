class Rush extends Item {

  int rushTime=0;
  boolean rushTimeCheck=false;
  Rush(float x, float y) {
    super(x, y);
    isAlive=true;
    img = rushing;
  }

  void display() {
    if (isAlive==true) {
      image(img, x, y);
    }
  }

  void checkCollision() {
    if (fishX+150 >x&&
      fishX < x+w&&
      fishY+150 > y &&
      fishY < y+h ) {
      isAlive=false;
      rushTimeCheck=true;
      checkTime();
    }
  }

  void checkTime() {
    if (rushTimeCheck==true) {
      rushTime++;
    }
    println(rushTime);
    if (rushTime<180) {
      fishSpeed=20;
    } else {
      fishSpeed=10;
      rushTimeCheck=false;
    }
  }
}
