
PImage magnet,bad,rush,life,bob,fish,fishpro,fishmax,background;

void setup(){
  size(1600,900);
magnet=loadImage("img/magnet.png");
bad= loadImage("img/bad.png");
rush=loadImage("img/rush.png");
life=loadImage("img/life.png");
bob=loadImage("img/bob.png");
fish=loadImage("img/fish.png");
fishpro=loadImage("img/fishpro.png");
fishmax=loadImage("img/fishmax.png");
background=loadImage("img/background.png");

}
void draw(){
  image(background,0,0);
 image(bad,5,500); 
 image(magnet,10,300); 
 image(life,50,5); 
 image(life,170,5); 
 image(life,290,5); 
 image(bob,500,5); 
 image(fish,250,500); 
 image(rush,400,150);
 image(fishpro,800,150);
 image(fishmax,500,150);

 
 
}
