int buff_size = 16;
int rows = 20, cols = 20;
int canvas_w = 600, canvas_h = 600; 
int w = canvas_w/cols, h = canvas_h/rows;

float step = 0.01;

Buffer b1 = new Buffer(buff_size);
Buffer2D b2d = new Buffer2D(rows,cols);

void setup(){
  size(600,600);
  //fullScreen(2);
  background(0);
  //noiseSeed(1);
  frameRate(30);
  surface.setLocation(0, 0);
  //Set all of 2D buffer to zero
  b2d.initZeros();
   //Fill the buffer
   //for(int i=0;i<buff_size;i++){
   //  b1.buff[i]=float(i)+1;
   //  //b1.buff[i]=noise(i*h*step);
   //}
   ////Fill the 2D buffer
   ////int count=1;
   //for(int i=0;i<rows;i++){
   //  for(int j=0;j<cols;j++){
   //  //b2d.buff[i][j]=float(count);
   //  b2d.buff[i][j]=noise(i*h*step,j*step);
   //  //count++;
   //  }
   //}
   
   ////Fill 2d buffer with random noise.
   //for(int i=0;i<rows;i++){
   //  //b2d.buff[i][j]=float(count);
   //  b2d.buff[i][0]=noise(i*h*step,0);
   //  //count++;
   //}
   
   //b2d.buff[0][0] = 0.5;
   //b2d.buff[3][5] = 0.5;
   //b2d.buff[7][9] = 0.5;
   //b2d.buff[11][13] = 0.5;
  //println(b2d.buff[0][0]);
  //println(b2d.buff[0][1]);
  //println(b2d.buff[1][0]);
}


void draw(){
  //clear the background
    background(0);
    float scale = 30;
    int N = 2048;
    int n = frameCount%N;
    int a = 15;
    int f_right = 10, f_down = 20;
    
    //Set the stroke and fill
    stroke(255);
    fill(255);
    ////plot the buffer
    //for(int i=0;i<buff_size;i++){
    //  ellipse(i*w+w/2,canvas_h/2,b1.buff[i]*3,b1.buff[i]*3);
    //}
    //b1.rotateRight(1);
    
    //Plot the Buffer
    for(int i=0;i<rows;i++){
      for(int j=0;j<cols;j++){
         fill(((-1*b2d.buff[i][j]/a)+1)*255);
         ellipse(j*w+w/2,i*h+h/2,b2d.buff[i][j],b2d.buff[i][j]);//b2d.buff[i][j]=count;
       }
     }

     
     //Insert new values
     //float sine_val = a*sin(f_right*TWO_PI*n/N);
     b2d.shiftDown(a*sin(f_down*TWO_PI*n/N));
     b2d.shiftRight(a*sin(f_right*TWO_PI*n/N));
     
     //b2d.shiftRight(a*float(mouseX)/canvas_w);
     
     //noiseSeed(frameCount%cols);
     //b2d.rotateLeft();
     //for(int i=0;i<rows;i++){
     //  b2d.buff[i][0]=a*noise((i+1)*h*step,0);
     //}
     //b2d.rotateUp();
     //for(int j=0;j<cols;j++){
     //  b2d.buff[cols-1][j]=a*noise(0,(j+1)*w*step);
     //}
     //if(frameCount%3==0){
     //  b2d.rotateRight();
     //}
     //if(frameCount%11==0){
     //  b2d.rotateUp();
     //}
     //if(frameCount%5==0){
     //  b2d.rotateDown();
     //}
 //<>//
    //noLoop(); //<>//
}
