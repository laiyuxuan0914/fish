class Lights{
  float lightSize = 0;
  int lightX;
  int lightY;
  int lightTransparent = 100;
  int points = 0;
  boolean appears;

  void sizes(){
    lightSize+=0.2;
    if(lightSize>60){
      lightSize = 60;
    }
  }
  
  void initSizes(){
    lightSize=0;
  }
  
  void LightColor(){
    lightTransparent++;
    if(lightTransparent>=200){
      lightTransparent = 200;
    }
    fill(255,lightTransparent);
    noStroke();
  }
  
  void initLightColor(){
    lightTransparent=50;
  }

  void display(){
    ellipse(lightX,lightY,lightSize,lightSize);
  }
  
  void appear(){
    if(animationFrame%60>0){
    appears = true;
    }
  }
  

  Lights(){
    for(int i=0; i<10;i++){
    lightX =floor(random(width-1));
    lightY =floor(random(height-1));
    appears = false;
    }
  }
}

  
