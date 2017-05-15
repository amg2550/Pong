int rectX=300;
int rectY=600;
int rectPos=500;
int rectW=200;
int directionX=1;
int directionY=1;
int ellipseX=300;
int ellipseY=50;
int radius=50;
int timer= millis();
int speed=5;
int score=0;
PFont font;

void setup(){
  size(720,720);
  smooth();
}
void draw(){
  int timer= second();
  println(timer,score);
  background(102);
  textSize(34);
  text(timer, 0,30,300);
  text(score, 675, 30, 300);
  font= loadFont("Arial-BoldMT-48.vlw");
  rect(rectX+20,rectY,rectW,40);
  
  if(keyPressed&&key==CODED){
    if(keyCode==LEFT){
    rectX-=2;
    rectPos-=2;
    }
  }
  if(keyPressed&&key==CODED){
    if(keyCode==RIGHT){
    rectX+=2;
    rectPos+=2;
    }
  }
  if(rectX > width+rectW-220){
    rectX= -rectW;
    rectPos=0;
  }
  if(rectX<0-rectW){
    rectX= width+rectW-220;
    rectPos=width+200;
  }
  ellipse(ellipseX,ellipseY,radius,radius);
  ellipseX += speed*directionX;
  ellipseY += speed*directionY;
  if((ellipseX >width-radius)){
    directionX= -directionX;
    directionY= +directionY;
  }
  if((ellipseX<0+radius)){
    directionX++;
  }
  if(ellipseY<0+radius){
    directionY= -directionY;
  }
  if(ellipseY==rectY && rectX<=ellipseX && ellipseX<=rectPos){
    directionY--;
  }
  if(ellipseY>= 600+radius){
    score++;
    ellipseX=300;
    ellipseY=50;
  }
  if(score>=10){
    background(255);
    fill(102);
    textFont(font);
    text("GAME OVER",215,height/4);
    fill(255,0,0);
    rectMode(CENTER);
    rect(width/2,350,200,200);
    fill(0);
    textFont(font);
    text("EXIT", 307, height/2);
    if(mousePressed){
        exit();
      }
    }
  }