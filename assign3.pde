PImage bg1img;
PImage bg2img;
PImage enemyimg;
PImage fighterimg;
PImage hpimg;
PImage treasureimg;
PImage start1img;
PImage start2img;
PImage end1img;
PImage end2img;
int tx,ty,hp,ex,ey,bx1,gameState,hit,get,i;
final int GAME_START=1, GAME_OVER=2, GAME_RUN=3;
float fx, fy;
float speed = 5;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;


void setup(){
  size(640,480);
  bx1=0;
//  hp=floor(random(200));
  tx=floor(random(640));
  ty=floor(random(480));
  ex=-420;
  ey=floor(random(480));
  fx=floor(random(640));
  fy=floor(random(480));
  bg1img= loadImage("img/bg1.png");
  bg2img= loadImage("img/bg2.png");
  enemyimg= loadImage("img/enemy.png");
  fighterimg= loadImage("img/fighter.png");
  hpimg= loadImage("img/hp.png");
  treasureimg= loadImage("img/treasure.png"); 
  start1img= loadImage("img/start1.png");
  start2img= loadImage("img/start2.png");
  end1img= loadImage("img/end1.png");
  end2img= loadImage("img/end2.png");
  gameState=GAME_START;
    fill(255,0,0);
  hp=40;
  
}

void draw(){
  
  switch(gameState){
    case GAME_START:
      image(start2img,0,0);
      if( mouseY>380 && mouseY<410 && mouseX>200 && mouseX<450){
        noStroke();
        image(start1img,0,0);
        if(mousePressed){
          gameState= GAME_RUN;
        }
      }
    break;
    case GAME_RUN:
      //
      background(0);
      image(bg1img,bx1,0);
      image(bg2img,bx1+640,0);
      image(bg1img,bx1+1280,0);
      bx1--;
      bx1%=1280; 
      //

      rect(10,10,200,20);
      image(hpimg,5,5);
      if(hp<=0){
        gameState= GAME_OVER; 
      }
       //
      if(get!=1) 
      {
         image(treasureimg,tx,ty );
      } else {
        tx=floor(random(640));
        ty=floor(random(480));
        image(treasureimg,tx,ty);
        get=0;
      }
      
      //
      image(fighterimg,fx,fy);
      if (upPressed) {
        fy -= speed;
        image(fighterimg,fx,fy);
      }
      if (downPressed) {
        fy += speed;
        image(fighterimg,fx,fy);
      }
      if (leftPressed) {
        fx -= speed;
        image(fighterimg,fx,fy);
      }
      if (rightPressed) {
        fx += speed;
        image(fighterimg,fx,fy);
      }
      if(fx>=width){
        fx=0;
      }
      if(fx<0){
        fx=width;
      }
      if(fy>=height){
        fy=0;
      }
      if(fy<0){
        fy=height;
      }
      //
      if(hit!=1) {
        
        for(i=0;i<5;i++){
         image(enemyimg,ex+70*i,ey);
        }
        ex+=3;
      if(ex>640){
         ey=floor(random(480));
         ex=-420;
        }
        ex %= 640;
        
         
    
  }
      //
    break;  
    case GAME_OVER:
      image(end1img,0,0);
      //rect(200,310,250,40);
      if( mouseY>310 && mouseY<350 && mouseX>200 && mouseX<450 ){
        noStroke();
        image(end2img,0,0);
        if(mousePressed){
          gameState= GAME_RUN;
          hp=40;
        }
      }
    break;
    
  }
}


void keyPressed(){
  if (key == CODED) { 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }

}
void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }

}
