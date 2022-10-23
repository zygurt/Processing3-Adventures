//Spirograph code from a fourier series viewpoint
//TODO
//Render whole spirograph in a frame and take values from mouse position

//Create function for applying next level


int canvas_w = 800, canvas_h = 800; 
//int w = canvas_w/40, h = canvas_h/40;
int w = 40, h = 40;
//int w = 20-1, h = 20-1;
float[] pix_array = new float[w*h]; 
int f_count = 0;
int update_frame = 600;
float step = 0.5;
float f = 0.5;
float t_start = 0;
float T = 10*100;
//int[] numbers = new int[3];
//float[] pos = new float[2];
//pos[0] = 0;
//pos[1] = 0;

float x_screen_prev = 0;
float y_screen_prev = 0;
boolean first_loop = true;

//void gear_transform(float x, float y, float t, float phase_x, float phase_y, float teeth, float radius){
//  pos[0] = sin(x*t+phase_x);
//  pos[1] = sin(y*t+phase_y);
//}

int degrees = 360;
float[] x_vals = new float[degrees];
float[] y_vals = new float[degrees];

float fx = 10, fy = 10;
float change = 0.01;

void setup(){
  size(800,800);
  //fullScreen(2);
  background(0);
  //noiseSeed(1);
  frameRate(120);
colorMode(RGB, 400);
 t_start = millis();
}


void draw(){
  //clear the background
  //if (mousePressed == true){
    background(0);
  //}
  float x=0,y=0, x_screen, y_screen;
  
  //float t = f_count;
  //t = millis()-t_start;
  float A = 1;
  float B = 1;
  float omega_x = 1;
  float omega_y = 1;
  float phase_x = 0;
  float phase_y = 0;
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
  //while (t<T){
    //fx = noise(f_count)*8;//*width/800;
    //fy = noise(f_count)*8;//*height/800;
    //fx = f_count/100.0;
    //fy = f_count/100.0;
     fx = mouseX/100.0;
    fy = mouseY/100.0;
    
    //fx = fx+change;
    //fy = fy+change;
    //if (fx > 15){
    //  change = -1*change;
    //}
    //if (fx < 10){
    //  change = -1*change;
    //}
    
    
    //text(fx, 10, 10);
    //text(fy, 60, 10);
    
  //  for (int t = 0; t<2*T; t=t+1){
   
  //  //t = millis()-t_start;
  //  //omega_x = mouseX;
  //  //omega_y = mouseY;
    
  //  //Generate the base circle
  //  x = A*cos((TWO_PI*t)/T+phase_x+PI);
  //  y = B*sin((TWO_PI*t)/T+phase_y+PI);
    
  //  //Add second layer
    
  //  //gear_transform(
    
  //  x = x+0.25*A*cos((TWO_PI*t*fx)/T+phase_x);
  //  y = y+0.25*B*sin((TWO_PI*t*fy)/T+phase_y);
    
  //  //x = x+0.2*A*cos((TWO_PI*t*50)/T+phase_x);
  //  //y = y+0.2*B*sin((TWO_PI*t*50)/T+phase_y);
    
  //  //x = sin(omega_x*t+phase_x);
  //  //y = sin(omega_y*t+phase_y);
    
  //  //x = x-(0.5*sin((omega_x*10)*t+phase_x));
  //  //y = y-(0.3*sin((omega_y*15)*t+phase_y));
    
  //  x_screen = (((x/2)+1)/2)*(canvas_h);
  //  y_screen = (((y/2)+1)/2)*(canvas_h);
  //  strokeCap(ROUND);
  //  strokeWeight(4);
  //  strokeJoin(ROUND);
  //  //stroke(t/(5*T)*255);
  //  stroke(0x0000FF);
  //  if (!first_loop){
  //    line(x_screen_prev, y_screen_prev, x_screen, y_screen);
  //  }else{
  //    first_loop = false;
  //  }
  //  x_screen_prev = x_screen;
  //  y_screen_prev = y_screen;
  //  //circle(x_screen, y_screen, extent);
  //  ////point(x_screen*canvas_w, y_screen*canvas_h);
  //}
  //  first_loop = true;
    
    
  for (int t = 0; t<5*T; t=t+1){
   
    //t = millis()-t_start;
    //omega_x = mouseX;
    //omega_y = mouseY;
    
    //Generate the base circle
    x = A*cos((TWO_PI*t)/T+phase_x); //<>//
    y = B*sin((TWO_PI*t)/T+phase_y);
    
    //Add second layer
    
    //gear_transform(
    
    x = x+0.5*A*cos((TWO_PI*t*fx)/T+phase_x);
    y = y+0.5*B*sin((TWO_PI*t*fy)/T+phase_y);
    
    x = x+0.2*A*cos((TWO_PI*t*10)/T+phase_x);
    y = y+0.2*B*sin((TWO_PI*t*20)/T+phase_y);
    
    //x = sin(omega_x*t+phase_x);
    //y = sin(omega_y*t+phase_y);
    
    //x = x-(0.5*sin((omega_x*10)*t+phase_x));
    //y = y-(0.3*sin((omega_y*15)*t+phase_y));
    
    x_screen = (((x/2)+1)/2)*(canvas_h);
    y_screen = (((y/2)+1)/2)*(canvas_h);
    strokeCap(ROUND);
    strokeWeight(4);
    strokeJoin(ROUND);
    //stroke(t/(5*T)*255);
    stroke(255);
    if (!first_loop){
      line(x_screen_prev, y_screen_prev, x_screen, y_screen);
    }else{
      first_loop = false;
    }
    x_screen_prev = x_screen;
    y_screen_prev = y_screen;
    //circle(x_screen, y_screen, extent);
    ////point(x_screen*canvas_w, y_screen*canvas_h);
  } //<>//
  first_loop = true;
  f_count = (f_count+1);//%update_frame;
  //if(fx > 10 ){
  //  saveFrame("Frames/frame_####.png");
  //  }else{
  //    noLoop();
  //  }
    
  //if(frameCount<=60*10){
  //  //saveFrame("Frames/frame_####.png");
  //}else{
  //  //noLoop();
  //}
  //noLoop();
}
