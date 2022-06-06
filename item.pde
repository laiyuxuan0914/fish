class Item {
  boolean isAlive;
  float x, y;
  float w=150;
  float h=150;
  PImage img;
  PImage fishChange;
  Item(float x, float y) {
    isAlive = true;
    this.x = x;
    this.y = y;
  }


  void display() {
    if (isAlive==true) {
      image(img, x, y);
    }
  }
  
  void fishChange(){
      fishSize = fishChange; 
  }

  void checkCollision() {
    if (fishX+150 >x&&
      fishX < x+w&&
      fishY+150 > y &&
      fishY < y+h ) {
      isAlive=false;
    }
  }

}
