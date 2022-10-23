int canvas_w = 800, canvas_h = 800; 
//int w = canvas_w/40, h = canvas_h/40;
int w = 40, h = 40;
//int w = 20-1, h = 20-1;
float[] pix_array = new float[w*h]; 
int f_count = 0;
int update_frame = 600;
float step = 0.5;
float f = 0.5;

//int[] numbers = new int[3];
//float[] pos = new float[2];
//pos[0] = 0;
//pos[1] = 0;


//void gear_transform(float x, float y, float t, float phase_x, float phase_y, float teeth, float radius){
//  pos[0] = sin(x*t+phase_x);
//  pos[1] = sin(y*t+phase_y);
//}

int degrees = 360;
float[] x_vals = new float[degrees];
float[] y_vals = new float[degrees];

void setup(){
  size(800,800);
  //fullScreen(2);
  background(0);
  //noiseSeed(1);
  frameRate(120);
// Use a for() loop to quickly iterate
// through all values in an array.

}


void draw(){
  //clear the background
  //background(0);
  float x=0,y=0, x_screen, y_screen;
  
  float t = f_count;
  t = millis();
  float omega_x = 1;
  float omega_y = 1;
  float phase_x = 0;
  float phase_y = HALF_PI;
  float extent = 10;
  
 //gear_transform(x,  y,  t,  phase_x,  phase_y,  0,  0);
  
  //for (int i=0; i < degrees; i++) {       
  //  x_vals[i] = sin(TWO_PI/degrees * i+phase_x);
  //  y_vals[i] = sin(TWO_PI/degrees * i+phase_y);
    
  //  x_vals[i] = x_vals[i]-(0.2*sin(2+(TWO_PI/degrees) * i+phase_x));
  //  y_vals[i] = y_vals[i]-(0.3*sin(TWO_PI/degrees * i+phase_y));
    
  //  //cos_vals[i] = cos(TWO_PI/degrees * i);
  //  circle((x_vals[i]+1)/2*canvas_w, (y_vals[i]+1)/2*canvas_h, extent);
  //}
  
  x = sin(omega_x*t+phase_x);
  y = sin(omega_y*t+phase_y);
  
  x = x-(0.5*sin((omega_x*10)*t+phase_x));
  y = y-(0.3*sin((omega_y*15)*t+phase_y));
  
  x_screen = (((x/2)+1)/2)*(canvas_w);
  y_screen = (((y/2)+1)/2)*(canvas_h);
  strokeCap(ROUND);
  stroke(0xFFFFFF);
  circle(x_screen, y_screen, extent);
  ////point(x_screen*canvas_w, y_screen*canvas_h);
   //<>//
  //f_count = (f_count+1);//%update_frame;
  if(frameCount<=60*10){
    //saveFrame("Frames/frame_####.png");
  }else{
    //noLoop();
  }
  //noLoop();
}
