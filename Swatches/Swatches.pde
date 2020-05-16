int blocks =  12;
int canvas_w = 1280, canvas_h = 720;
int block_w = 50, block_h = 60;
int frame_count = 1;
int change_mode = 100;
int fill_colour = 255;
int stroke_colour = 0;
int num_swatches = 6;
int[] swatches = new int[num_swatches];
color pix;
//int x = 0, y = 200, w = 150, h = 100;

PImage img;  // Declare variable "a" of type PImage

void setup(){
  size(1280,720); //<>//
  frameRate(25);
  img = loadImage("im.jpg");  // Load the image into the program  
  image(img, 0, 0);
  int[] hist = new int[260];
  int[] peak_loc = new int[0];
  int[] peak_val = new int[0];
  int peak_size = 0;

  // Calculate the histogram
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      pix = img.get(i,j);
      println(hex(pix)); //<>//
      //int hue_val = int(hue(get(i, j)));
      
      //hist[hue_val+2]++; 
    }
  }
  //Find peaks in histogram
  for (int i = 2;i < 258; i++){
    if (hist[i]>hist[i-2] && hist[i]>hist[i-1] && hist[i]>hist[i+1] && hist[i]>hist[i+2]){
      peak_loc = append(peak_loc,i);
      peak_val = append(peak_val,hist[i]);
      peak_size++;
    }
  }
  int[] peak_sort = new int[peak_size];
  //Sort and reverse to place largest
  peak_sort = reverse(sort(peak_val));
  
  for(int i=0 ; i<num_swatches; i++){
    for(int j=0 ; j<peak_size ; j++){
      //Find the location of the peak
      //println(peak_sort[i]);
      //println(peak_val[j]);
      //println(peak_sort[i]==peak_val[j]);
      if(peak_sort[i]==peak_val[j]){
        swatches[i] = peak_loc[j]-2;
      }
    }
  }
    background(0);
 colorMode(HSB, 255, 255, 255);
//  // Find the largest value in the histogram
//int histMax = max(hist);
//stroke(0);
//// Draw half of the histogram (skip every second value)
//for (int i = 0; i < img.width; i += 1) {
//  // Map i (from 0..img.width) to a location in the histogram (0..255)
//  int which = int(map(i, 0, img.width, 0, 255));
//  // Convert the histogram value to a location between 
//  // the bottom and the top of the picture
//  int y = int(map(hist[which], 0, histMax, img.height, 0));
//  line(i, img.height, i, y);
//}
}

void draw(){
  for (int b=0;b<blocks;b++){
    fill_colour = swatches[int(random(num_swatches))];
      fill(fill_colour);
      stroke(fill_colour);
      rect(random(canvas_w), random(canvas_h), random(block_w), random(block_h));
    }
  //frame_count++;
  //if (frame_count>change_mode){
  //    frame_count = 1;
  //    if (fill_colour==255){
  //      fill_colour = 0;
  //      stroke_colour = 255;
  //    }else{
  //      fill_colour = 255;
  //      stroke_colour = 0;
  //    }
  //}
}
