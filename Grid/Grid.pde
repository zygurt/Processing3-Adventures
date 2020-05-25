int buff_size = 16;
int canvas_w = 800, canvas_h = 100; 
int w = canvas_w/buff_size, h = canvas_h/buff_size;

float step = 0.5;

Buffer b1 = new Buffer(buff_size);

void setup(){
  size(800,100);
  //fullScreen(2);
  background(0);
  //noiseSeed(1);
  frameRate(30);
  
   //Fill the buffer
   for(int i=0;i<buff_size;i++){
     b1.buff[i]=float(i)+1;
     //b1.buff[i]=noise(i*h*step);
   }
  
}


void draw(){
  //clear the background
    background(0);
    //Set the stroke and fill
    stroke(255);
    fill(255);
    //plot the buffer
    for(int i=0;i<buff_size;i++){
      ellipse(i*w+w/2,canvas_h/2,b1.buff[i]*3,b1.buff[i]*3);
    }
    b1.rotateRight(1);
 //<>// //<>//
}
