int buff_size = 16;
int rows = 16, cols = 16;
int canvas_w = 800, canvas_h = 800; 
int w = canvas_w/cols, h = canvas_h/rows;

float step = 0.01;

Buffer b1 = new Buffer(buff_size);
Buffer2D b2d = new Buffer2D(rows,cols);

void setup(){
  size(800,800);
  //fullScreen(2);
  background(0);
  //noiseSeed(1);
  frameRate(10);
  surface.setLocation(1920/4, 1200/4);
   //Fill the buffer
   for(int i=0;i<buff_size;i++){
     b1.buff[i]=float(i)+1;
     //b1.buff[i]=noise(i*h*step);
   }
   ////Fill the 2D buffer
   ////int count=1;
   //for(int i=0;i<rows;i++){
   //  for(int j=0;j<cols;j++){
   //  //b2d.buff[i][j]=float(count);
   //  b2d.buff[i][j]=noise(i*h*step,j*step);
   //  //count++;
   //  }
   //}
   
   for(int i=0;i<rows;i++){
     //b2d.buff[i][j]=float(count);
     b2d.buff[i][0]=noise(i*h*step,0);
     //count++;
   }
   
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
    //Set the stroke and fill
    stroke(255);
    fill(255);
    ////plot the buffer
    //for(int i=0;i<buff_size;i++){
    //  ellipse(i*w+w/2,canvas_h/2,b1.buff[i]*3,b1.buff[i]*3);
    //}
    //b1.rotateRight(1);
    for(int i=0;i<rows;i++){
      for(int j=0;j<cols;j++){
         fill(((-1*b2d.buff[i][j])+1)*255);
         ellipse(j*w+w/2,i*h+h/2,b2d.buff[i][j]*60,b2d.buff[i][j]*60);//b2d.buff[i][j]=count;
       }
     }
     noiseSeed(frameCount%cols);
     b2d.rotateLeft();
     for(int i=0;i<rows;i++){
       b2d.buff[i][0]=noise((i+1)*h*step,0);
     }
     b2d.rotateUp();
     for(int j=0;j<cols;j++){
       b2d.buff[cols-1][j]=noise(0,(j+1)*w*step);
     }
     //if(frameCount%3==0){
     //  b2d.rotateRight();
     //}
     //if(frameCount%11==0){
     //  b2d.rotateUp();
     //}
     //if(frameCount%5==0){
     //  b2d.rotateDown();
     //}

    //noLoop(); //<>//
}
