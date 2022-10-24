//Spirograph code from a fourier series viewpoint
//TODO
//Render whole spirograph in a frame and take values from mouse position

//Create function for applying next level

int SQUIGGLE_LENGTH = 50;
int R_DEFAULT = 15;
float ANGLE_CHANGE = 60;
int canvas_w = 800, canvas_h = 800; 
int INIT_VAL = canvas_w/2;
//int w = canvas_w/40, h = canvas_h/40;
int w = 40, h = 40;


float[] squiggle_x = new float[SQUIGGLE_LENGTH];
float[] squiggle_y = new float[SQUIGGLE_LENGTH];
int[] plot_line = new int[SQUIGGLE_LENGTH];

void setup(){
  size(800,800);
  //fullScreen(2);
  background(0);
  //noiseSeed(1);
  frameRate(60);
  colorMode(RGB, 100);
  //Empty the initial array
  for(int n=0;n<SQUIGGLE_LENGTH;n=n+1){
    squiggle_x[n] = INIT_VAL;
    squiggle_y[n] = INIT_VAL;
    plot_line[n] = 1;
  }
}


void draw(){
  //clear the background
  //if (mousePressed == true){
    background(0);
  //}

 //<>//
  ////Move points through array
  for(int n=(SQUIGGLE_LENGTH-1);n>0;n=n-1){
    squiggle_x[n] = squiggle_x[n-1];
    squiggle_y[n] = squiggle_y[n-1];
    plot_line[n] = plot_line[n-1];
  }


  //Create new point
  
  //Find angle from point 2->point 1
  float x = (squiggle_x[1]-squiggle_x[2]);
  float y = (squiggle_y[1]-squiggle_y[2]);
  
  float r = sqrt(x*x+y*y);
  float theta = degrees(atan2(y,x));
  
  
  float MINUS_ANGLE = ANGLE_CHANGE;
  float POS_ANGLE = ANGLE_CHANGE;
  
  //if (squiggle_x[1]<=canvas_w/2 && squiggle_y[1]<=canvas_h/2){
  //  //bottom left
  //  MINUS_ANGLE = ANGLE_CHANGE/4;
  //  POS_ANGLE = ANGLE_CHANGE;
  //}else if (squiggle_x[1]<canvas_w/2 && squiggle_y[1]>canvas_h/2){
  //  //top left
  //  MINUS_ANGLE = ANGLE_CHANGE/4;
  //  POS_ANGLE = ANGLE_CHANGE;
  //}else if (squiggle_x[1]>canvas_w/2 && squiggle_y[1]<=canvas_h/2){
  //  //bottom right
  //  MINUS_ANGLE = -ANGLE_CHANGE/4;
  //  POS_ANGLE = ANGLE_CHANGE;
  //}else{//(squiggle_x[1]<=canvas_w/2 && squiggle_y[1]<=canvas_h/2){
  //  //top right
  //  MINUS_ANGLE = ANGLE_CHANGE/4;
  //  POS_ANGLE = ANGLE_CHANGE;
  //}
  
  
  float r_new = R_DEFAULT*random(0,1);
  float theta_new = theta+random(-MINUS_ANGLE,POS_ANGLE);
  
  //Something needs to go here to guide the line back towards the centre
  //Could find the distance to the point from the centre?
  //Could do a check to see if the point will go off the screen?
  float x_change_pos = 0;
  //if (squiggle_x[1]<canvas_w/2){
  //  x_change_pos = -1*30*(abs(squiggle_x[1]-canvas_w/2));
  //}else if (squiggle_x[1]>canvas_w/2){
  //  x_change_pos = 30*(abs(squiggle_x[1]-canvas_w/2));
  //}
  
  float y_change_pos = 0;
  //if (squiggle_y[1]<canvas_h/2){
  //  y_change_pos = -1*30*(abs(squiggle_y[1]-canvas_h/2));
  //}else if (squiggle_y[1]>canvas_h/2){
  //  y_change_pos = 30*(abs(squiggle_y[1]-canvas_h/2));
  //}
  
  
  
  
  float x_change = r_new*cos(radians(theta_new))+x_change_pos;
  float y_change = r_new*sin(radians(theta_new))+y_change_pos;
  
  
  
  squiggle_x[0] = squiggle_x[1]+x_change;
  squiggle_y[0] = squiggle_y[1]+y_change; //<>//
  
  while (squiggle_x[0]< 0 || squiggle_x[0]> canvas_w || squiggle_y[0]< 0 || squiggle_y[0]> canvas_h){
    r_new = R_DEFAULT*random(0,1);
    theta_new = theta+random(-MINUS_ANGLE,POS_ANGLE);
    x_change = r_new*cos(radians(theta_new));
    y_change = r_new*sin(radians(theta_new));
    squiggle_x[0] = squiggle_x[1]+x_change;
    squiggle_y[0] = squiggle_y[1]+y_change;
  }
  
  
  
  plot_line[0] = 1;
 //<>// //<>//
  //loop around screen
  if (squiggle_x[0]<0){
    squiggle_x[0] = squiggle_x[0] + canvas_w;
    plot_line[0] = 0;
  }
  if (squiggle_x[0]>canvas_w){
    squiggle_x[0] = squiggle_x[0] - canvas_w;
    plot_line[0] = 0;
  }
  
  if (squiggle_y[0]<0){
    squiggle_y[0] = squiggle_y[0] + canvas_h;
    plot_line[0] = 0;
  }
  if (squiggle_y[0]>canvas_h){
    squiggle_y[0] = squiggle_y[0] - canvas_h;
    plot_line[0] = 0;
  }

  //Draw all the lines
  
  for(int n=0;n<SQUIGGLE_LENGTH-1;n=n+1){
    stroke(100-n);
    strokeWeight(max(0,(SQUIGGLE_LENGTH-n)/4));
    if(plot_line[n] == 1){
      line(squiggle_x[n],squiggle_y[n],squiggle_x[n+1],squiggle_y[n+1]);
    }
  }


  //if(frameCount<=60*10){
  //  saveFrame("Frames/frame_####.png");
  //}else{
  //  noLoop();
  //}
  //noLoop();
}
