int canvas_w = 800, canvas_h = 800; 
//int w = canvas_w/40, h = canvas_h/40;
int w = 40, h = 40;
//int w = 20-1, h = 20-1;
float[] pix_array = new float[w*h]; 
int f_count = 0;
int update_frame = 1;
float step = 0.5;
float f = 0.1; //Frequency scaling

void setup(){
  size(800,800);
  //fullScreen(2);
  background(0);
  //noiseSeed(1);
  
    //  //fill the pix_array
    //for(int i=0;i<w;i++){
    //  for(int j=0;j<h;j++){
    //    //pix_array[j+i*h] = int(random(10,40));
    //    pix_array[j+i*h] = pix_array[j+i*h]+noise(i*h*step,j*step);
    //    if (pix_array[j+i*h]>1){
    //      pix_array[j+i*h]-=1;
    //    }
    //    //ellipse((i+1)*(canvas_w/w),(j+1)*(canvas_h/h),pix_array[j*i+j],pix_array[j*i+j]);
    //  }
    //}
  
}


void draw(){
  //clear the background
  if (f_count==0){
    //noiseSeed(frameCount);
    background(0);
    
     //fill the pix_array
    for(int i=0;i<w;i++){
      for(int j=0;j<h;j++){
        //pix_array[j+i*h] = int(random(10,40));
        pix_array[j+i*h] = pix_array[j+i*h]+0.01;//random(0,0.02);//noise(i*h*step,j*step);
        pix_array[j+i*h] = sin((f*j*(i+frameCount))/TWO_PI)/2+0.5;
        //if (pix_array[j+i*h]>1){
        //  pix_array[j+i*h]-=1;
        //}
        //ellipse((i+1)*(canvas_w/w),(j+1)*(canvas_h/h),pix_array[j*i+j],pix_array[j*i+j]);
      }
    }
    //plot the pix_array
    for(int i=1;i<w-1;i++){
      for(int j=1;j<h-1;j++){
        stroke(255*pix_array[j+i*h]);
        fill(255*pix_array[j+i*h]);
        ellipse(i*canvas_w/(w-1),j*canvas_h/(h-1),pix_array[j+i*h]*5+5,pix_array[j+i*h]*5+5);
      }
    }
  }
   //<>//
  f_count = (f_count+1)%update_frame;
  if(frameCount<=60*10){
    saveFrame("Frames/frame_####.png");
  }else{
    noLoop();
  }
  
}
