//Spirograph code from a fourier series viewpoint
//TODO
//Render whole spirograph in a frame and take values from mouse position

//Create function for applying next level

int SQUIGGLE_LENGTH = 50;

int canvas_w = 800, canvas_h = 800; 
int INIT_VAL = canvas_w/2;
//int w = canvas_w/40, h = canvas_h/40;
int w = 40, h = 40;


float[] squiggle_x = new float[SQUIGGLE_LENGTH];
float[] squiggle_y = new float[SQUIGGLE_LENGTH];

float[] squiggle_x1 = new float[SQUIGGLE_LENGTH];
float[] squiggle_y1 = new float[SQUIGGLE_LENGTH];

float[] squiggle_x2 = new float[SQUIGGLE_LENGTH];
float[] squiggle_y2 = new float[SQUIGGLE_LENGTH];

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
  }
  for(int n=0;n<SQUIGGLE_LENGTH;n=n+1){
    squiggle_x1[n] = INIT_VAL;
    squiggle_y1[n] = INIT_VAL;
  }
  for(int n=0;n<SQUIGGLE_LENGTH;n=n+1){
    squiggle_x2[n] = INIT_VAL;
    squiggle_y2[n] = INIT_VAL;
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
  }

  for(int n=(SQUIGGLE_LENGTH-1);n>0;n=n-1){
    squiggle_x1[n] = squiggle_x1[n-1];
    squiggle_y1[n] = squiggle_y1[n-1];
  }
  
  for(int n=(SQUIGGLE_LENGTH-1);n>0;n=n-1){
    squiggle_x2[n] = squiggle_x2[n-1];
    squiggle_y2[n] = squiggle_y2[n-1];
  }

  //Create new point
  
  squiggle_x[0] = squiggle_x[1]+random(-10,10);
  squiggle_y[0] = squiggle_y[1]+random(-10,10); //<>// //<>//
  
  squiggle_x1[0] = squiggle_x1[1]+random(-10,10);
  squiggle_y1[0] = squiggle_y1[1]+random(-10,10); //<>//
  
  squiggle_x2[0] = squiggle_x2[1]+random(-10,10);
  squiggle_y2[0] = squiggle_y2[1]+random(-10,10); //<>//

  //loop around screen
  if (squiggle_x[0]<0){
    squiggle_x[0] = squiggle_x[0] + canvas_w;
  }
  if (squiggle_x[0]>canvas_w){
    squiggle_x[0] = squiggle_x[0] - canvas_w;
  }
  
  if (squiggle_y[0]<0){
    squiggle_y[0] = squiggle_y[0] + canvas_h;
  }
  if (squiggle_y[0]>canvas_h){
    squiggle_y[0] = squiggle_y[0] - canvas_h;
  }


//loop around screen
  if (squiggle_x1[0]<0){
    squiggle_x1[0] = squiggle_x1[0] + canvas_w;
  }
  if (squiggle_x1[0]>canvas_w){
    squiggle_x1[0] = squiggle_x1[0] - canvas_w;
  }
  
  if (squiggle_y1[0]<0){
    squiggle_y1[0] = squiggle_y1[0] + canvas_h;
  }
  if (squiggle_y1[0]>canvas_h){
    squiggle_y1[0] = squiggle_y1[0] - canvas_h;
  }
  
  //loop around screen
  if (squiggle_x2[0]<0){
    squiggle_x2[0] = squiggle_x2[0] + canvas_w;
  }
  if (squiggle_x2[0]>canvas_w){
    squiggle_x2[0] = squiggle_x2[0] - canvas_w;
  }
  
  if (squiggle_y2[0]<0){
    squiggle_y2[0] = squiggle_y2[0] + canvas_h;
  }
  if (squiggle_y2[0]>canvas_h){
    squiggle_y2[0] = squiggle_y2[0] - canvas_h;
  }

  //Draw all the lines
  
  for(int n=0;n<SQUIGGLE_LENGTH-1;n=n+1){
    stroke(100-n);
    strokeWeight(max(0,(SQUIGGLE_LENGTH-n)/4));
    line(squiggle_x[n],squiggle_y[n],squiggle_x[n+1],squiggle_y[n+1]);
    line(squiggle_x1[n],squiggle_y1[n],squiggle_x1[n+1],squiggle_y1[n+1]);
    line(squiggle_x2[n],squiggle_y2[n],squiggle_x2[n+1],squiggle_y2[n+1]);
  }


  //if(frameCount<=60*10){
  //  saveFrame("Frames/frame_####.png");
  //}else{
  //  noLoop();
  //}
  //noLoop();
}
