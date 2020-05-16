int canvas_w = 1920, canvas_h = 1080; 
int w = canvas_w/8, h = canvas_h/8;
//int w = 20-1, h = 20-1;
float[] pix_array = new float[w*h]; 
int f_count = 0;
int update_frame = 1;
float step = 0.5;
PImage img;
int dot_scale = 5;
String[] savename = {"Frames/","121","png"};

void setup(){
  size(1920,1080);
  //fullScreen(2);
  background(0);
  
  //Load the image
  img = loadImage("Mothers_day_1080.jpg");
  //image(img, 0, 0);
  //Sample the image and
  //fill the pix_array
  for(int j=0;j<h;j++){
    for(int i=0;i<w;i++){
      //pix_array[j+i*h] = int(random(10,40));
      //pix_array[j+i*h] = pix_array[j+i*h]+noise(i*h*step,j*step);
      //print((j*img.height)/h+i*img.height);
      pix_array[j+i*h] = brightness(img.pixels[i*(img.width/w)+j*(img.height/h)*img.width]);
      //println(pix_array[j+i*h]);
      //if (pix_array[j+i*h]>1){
      //  pix_array[j+i*h]-=1;
      //}
      //ellipse((i+1)*(canvas_w/w),(j+1)*(canvas_h/h),pix_array[j*i+j],pix_array[j*i+j]);
    }
  }
  for(int i=0;i<w;i++){
      for(int j=0;j<h;j++){
        fill(255);//*(-0.9*pix_array[j+i*h]+1));
        ellipse(i*canvas_w/w,j*canvas_h/h,pix_array[j+i*h]*dot_scale/255,pix_array[j+i*h]*dot_scale/255);
      }
    }
  saveFrame("Frames/1000.png");
  
}


void draw(){
  //clear the background
  if (frameCount<45){
    background(0);
    randomSeed(frameCount);
  for(int i=0;i<w;i++){
      for(int j=0;j<h;j++){
        //pix_array[j+i*h] = int(random(10,40));
        //pix_array[j+i*h] = pix_array[j+i*h]+random(-10,10);//noise(i*h*step,j*step);
        if (pix_array[j+i*h]>128){
          pix_array[j+i*h] = pix_array[j+i*h]-random(0,7);
          //pix_array[j+i*h]-=255;
        }else if((pix_array[j+i*h]<128)){
          pix_array[j+i*h] = pix_array[j+i*h]+random(0,7);
          //pix_array[j+i*h]+=255;
        }
        //ellipse((i+1)*(canvas_w/w),(j+1)*(canvas_h/h),pix_array[j*i+j],pix_array[j*i+j]);
      }
    }
    //plot the pix_array
    for(int i=1;i<w;i++){
      for(int j=1;j<h;j++){
        fill(255);//*(-0.9*pix_array[j+i*h]+1));
        ellipse(i*canvas_w/w,j*canvas_h/h,pix_array[j+i*h]*dot_scale/255,pix_array[j+i*h]*dot_scale/255);
      }
    }
    savename[1] = nf(240-frameCount,3);
    saveFrame(join(savename,"."));
  }else{
  
  if (f_count==0){
    //noiseSeed(frameCount);
    background(0);
    randomSeed(frameCount);
    
     //fill the pix_array
    for(int i=0;i<w;i++){
      for(int j=0;j<h;j++){
        //pix_array[j+i*h] = int(random(10,40));
        pix_array[j+i*h] = pix_array[j+i*h]+20*noise(i*h*step,j*step);//random(0,20);//
        if (pix_array[j+i*h]>255){
          pix_array[j+i*h]-=255;
        }else if((pix_array[j+i*h]<0)){
          pix_array[j+i*h]+=255;
        }
        //ellipse((i+1)*(canvas_w/w),(j+1)*(canvas_h/h),pix_array[j*i+j],pix_array[j*i+j]);
      }
    }
    //plot the pix_array
    for(int i=1;i<w;i++){
      for(int j=1;j<h;j++){
        fill(255);//*(-0.9*pix_array[j+i*h]+1));
        ellipse(i*canvas_w/w,j*canvas_h/h,pix_array[j+i*h]*dot_scale/255,pix_array[j+i*h]*dot_scale/255);
      }
    }
  }
  
  f_count = (f_count+1)%update_frame;
  if(frameCount<=60*4){
    savename[1] = nf(240-frameCount,3);
    saveFrame(join(savename,"."));
  }else{
    noLoop();
  }
  }
  
}
