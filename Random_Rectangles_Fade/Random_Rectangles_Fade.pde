int blocks =  50;
int canvas_w = 1280, canvas_h = 720;
int block_w = 50, block_h = 60;
int frame_count = 1;
int saved_frames = 1;
int total_frames = 400;
int change_mode = 50;
int fill_colour = 255;
int stroke_colour = 0;
//int x = 0, y = 200, w = 150, h = 100;

void setup(){
  //size(1280,720);
    //size(1920,1200);
  //colorMode(HSB, 100);
  fullScreen(2);
  frameRate(25);
  background(0);
}

void draw(){
  for (int b=0;b<int(abs(canvas_w-mouseX)/200);b++){
      fill(fill_colour);
      //noFill();
      stroke(stroke_colour);
      //stroke(random(100),100,100);
      //strokeWeight(mouseY/8);
      strokeWeight(1);
      rect(random(canvas_w), random(canvas_h), random(block_w), random(block_h));
      //rect(random(canvas_w), random(canvas_h), mouseX/8, mouseY/8);
      //ellipse(random(canvas_w), random(canvas_h), mouseX/8, mouseX/8);
    }
  frame_count++;
  if (frame_count>change_mode){
      frame_count = 1;
      if (fill_colour==255){
        fill_colour = 0;
        stroke_colour = 255;
      }else{
        fill_colour = 255;
        stroke_colour = 0;
      }
  }
  //if(saved_frames<total_frames+1){
  //  saveFrame("Movie/Rect-###.png");
  //  saved_frames++;
  //}else{
  // noLoop(); 
  //}
}
