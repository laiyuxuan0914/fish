class Rush{ 

  boolean isAlive; 

  float rushx; 

  float rushy; 

  float w=150; 

  float h=150; 

 // PImage fishSize = rushfishS; 

  PImage img; 

  //int time = 3000; 

 

 

void display() { 

  if (isAlive==true) { 

    image(img,rushx,rushy); 

  } 

} 

 

 void checkCollision() { 

 

   if (isAlive==true) { 

     if (fishX+150 >rushx&&fishX < rushx+w&&fishY+150 > rushy &&fishY < rushy+h ) { 

          isAlive=false; 

         // fishSize = rushfishS; 

          //int currentTime = millis(); 

          fishSpeed=15; 

          //if(currentTime > time){ 

            //fishSpeed=10; 

          //} 

      } 

   } 

 } 

 

//void update() { 

  //img=name; 

//}   

 

Rush(){ 

  isAlive=true; 

  rushx = random(width-150); 

  rushy = random(height-150); 

  img = rushing; 

   

}   

 

 

} 
