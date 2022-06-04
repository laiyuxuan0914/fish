class Magnet extends Item {

  Magnet(float x, float y) {
    super(x, y);
    isAlive=true;
    img = magneting;
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
      itemImage=2;
      magnetTimeOn = true;
    }
  }
  

  
}
