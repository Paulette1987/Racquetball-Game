void setup(){
size(640,360);
}

int score = 0;
float dir = random(-5,5);
float xsp = 1.5;
float ysp = 1.5;
float isp;
float x;
float y;
int p;
int game = 0;

void draw(){ 
  if(game == 0){
  background(50,100);
  textSize(50);
  fill(140,120,220,150);
  text("Racquetball Game",100,80);  //layout for menu page
  fill(180,160,230,120);
  //for loop for three buttons(options) of paddles
  for(int i=0;i<=400;i+=200){
  rect(40+i,200,160,30);
  }
  textSize(15);
  fill(30,20,85);
  text("100-pixel paddle",56,220);
  text("200-pixel paddle",256,220);
  text("300-pixel paddle",456,220);
  textSize(30);
  fill(255,255,255,130);
  text("Choose a paddle to START!",120,160);
  textSize(15);
  text("FYI: The bigger the paddle, the greater the starting speed of the ball.",65,260);
  } 
  if(mousePressed == true && game == 0 && mouseY<=230 && mouseY>=200){
    // if 1st rect, paddle = p1 and game = true
    if(mouseX>=40 && mouseX<=200){
      p = 100;
      game = 1;
      isp = 1.5;
      x = random(0,640);
      y = random(0,200);
    }
    // if 2nd rect, paddle = p2 and game = true
    if(mouseX>=240 && mouseX<=400){
      p = 200;
      game = 1;
      isp = 2;
      xsp = 2;
      ysp = 2;
      x = random(0,640);
      y = random(0,200);
    }
    // if 3rd rect, paddle = p3 and game = true
    if(mouseX>=440 && mouseX<=600){
      p = 300;
      game = 1;
      isp = 2.5;
      xsp = 2.5;
      ysp = 2.5;
      x = random(0,640);
      y = random(0,200);
  }
  }
  if((mousePressed == false && game == 1)){ //mousePressed == false 
  game = 1;
  background(50);
  //set up score 
  textSize(20);
  fill(200,210,215);
  text("Points: "+score,520,30);
  //paddle
  rectMode(CENTER);
  fill(255);
  rect(mouseX,330,p,20);
  //ball
  fill((int)random(1,255),(int)random(1,255),(int)random(1,255));
  ellipse(x,y,20,20);
  }
  //rainbow effect 
  if(mousePressed == true && game == 1){
  fill((int)random(1,255),(int)random(1,255),(int)random(1,255));
  ellipse(x,y,20,20);
  }
  //chooses direction
  if(dir>=0){
    x=x-xsp;
    }
  else{x=x+xsp;}
  y+=ysp;
  
  if(x>=width || x<=0){ //if touching right or left edges
    xsp = xsp*-1;
  }
  if(y<=0){ //if touching upper bound
    ysp = ysp*-1;
  }
  if(y>=310 && y<=320 && x>=mouseX-p/2 && x<=mouseX+p/2){ //if touching the
    ysp = ysp*-1;//top of the paddle or within the paddle's width
    score++;
    ysp-=0.4;
    xsp-=0.4;
  }
  
  if(y >= height && game ==1){ //if reached the bottom and the display window is the game
   game = 2; // then exit and display GAME OVER
   textSize(50);
   fill(255,255,255,100);
   text("GAME OVER",180,120);
   textSize(25);
   text("Press any KEY to restart",180,160);
  }
  if(keyPressed == true && game == 2){ //only when any key is pressed and the display window
   game = 1; // is of the GAME OVER, then the attributes may restart
   x = random(0,640);
   y = random(0,200);
   score = 0;
   dir = random(-5,5);
   xsp = isp;
   ysp = isp;
  }
}
