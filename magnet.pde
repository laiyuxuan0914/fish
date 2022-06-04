class Magnet{ 

  boolean isAlive; 

  float x; 

  float y; 

  float w=150; 

  float h=150; 

  PImage img; 

  //PImage fishSize = magnetfishS; 

 

 

void display() { 

  if (isAlive==true) { 

    image(img,x,y); 

  } 

} 

 

  void checkCollision() { 

   if (isAlive==true) { 

     if (fishX+w >x&&fishX < x+w&&fishY+h> y &&fishY < y+h ) { 

          isAlive=false; 

          //fishSize = magnetfishS; 

          if(2*(fishX)+2*(w) >2*(x)&&2*(fishX) < 2*(x)+2*(w)&&2*(fishY)+2*(h)> 2*(y) &&2*(fishY) < 2*(y+h) ){ 

             

          } 

     } 

   } 

 } 

 

 

Magnet(){ 

  isAlive=true; 

  x = random(width-150); 

  y = random(height-150); 

  img = magneting; 

   

}   

 

 

   

 

} 
