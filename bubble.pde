class Bubble{ 

  boolean isAlive; 

  float x; 

  float y; 

  float w=150; 

  float h=150; 

  PImage img; 

 // PImage fishSize = bubblefishS; 

 

 

void display() { 

  if (isAlive==true) { 

    image(img,x,y); 

  } 

} 

 

 void checkCollision() { 

   if (isAlive==true) { 

     if (fishX+w >x&& fishX < x+w&&fishY+h > y && fishY < y+h ) { 

       isAlive=false; 

       //fishHealth++; 

       //fishSize = bubblefishS; 

     } 

 } 

} 

//void update() { 

  //img=name; 

//}   

 

Bubble(){ 

  isAlive=true; 

  x = random(width-150); 

  y = random(height-150); 

  img = bubbleing; 

   

}   

 

  

   

 

} 
