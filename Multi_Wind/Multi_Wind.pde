int num_vectors = 6000; //<>//
PVector[] vectors = new PVector[num_vectors];
PVector[] positions = new PVector[num_vectors];
PVector[] param = new PVector[num_vectors]; //Speed, NA, NA
PVector[] colours = new PVector[num_vectors]; //Hue, Saturation, Brightness
PVector[] mouse_vec = new PVector[num_vectors];

int size_x = 1920;
int size_y = 1080;

float[][] noise_pixels = new float[size_x][size_y];
float noiseScale = 0.02;

void setup(){
  //size(600,600);
  fullScreen(P2D);
  loadPixels();
  noiseSeed(0);
  noiseDetail(3,0.25);
  for (int i=0; i<size_x; i++){
    for (int j=0; j<size_y; j++){
      noise_pixels[i][j] = noise(i*noiseScale,j*noiseScale); //<>//
    }
  }
  //size (size_x,size_y, P2D);
  //strokeWeight(4);
  //Setup Vectors
  for (int i = 0; i<num_vectors; i++){
    vectors[i] = new PVector();
  }
  for (PVector v : vectors) {
    v.set(random(50),random(50));
  }
  //Setup Positions
  for (int i = 0; i<num_vectors; i++){
    positions[i] = new PVector();
  }
  for (PVector p : positions) {
    p.set(random(size_x),random(size_y));
  }
  //Setup Parameters
  for (int i = 0; i<num_vectors; i++){
    param[i] = new PVector();
  }
  for (PVector pa : param) {
    pa.set(random(0.3),0,0);
  }
  
  //Setup Mouse
  for (int i = 0; i<num_vectors; i++){
    mouse_vec[i] = new PVector();
  }
  for (PVector m : mouse_vec) {
    m.set(0,0,0);
  }
  
  //Setup Colours
  for (int i = 0; i<num_vectors; i++){
    colours[i] = new PVector();
  }
  for (PVector c : colours) {
    c.set(random(90,136),random(70,100),random(45,86));
  }
  
  //noLoop();
  fill(0);
  colorMode(HSB, 360, 100, 100);
  stroke(97, 100, 79);
  
  
}

void draw(){
  background(16,92,0);
  //Draw the noise
  //for (int i=0; i<size_x; i++){
  //  for (int j=0; j<size_y; j++){
  //    stroke(29,71,noise_pixels[i][j]*23);
  //    point(i,j);
  //  }
  //}
  
  //loadPixels();
  //for (int x=0; x<size_x; x++){
  //  for (int y=0; y<size_y; y++){
  //    int loc = x+y*size_x;
  //    pixels[loc] = color(29, 71, (int)(noise_pixels[x][y]*23));
  //  }
  //}
  //updatePixels();
  
  //Draw the current Vectors
  for (int i = 0; i<num_vectors; i++){
    stroke(colours[i].x,colours[i].y,colours[i].z);
    line(positions[i].x, positions[i].y, positions[i].x+vectors[i].x, positions[i].y+vectors[i].y);
  }
  
  for (int i = 0; i<num_vectors; i++){
    vectors[i].rotate(param[i].x);
  }
  
  //Update 'mouse' position for spirograph
  
  //float mx = 0;
  //float my = 0;
  //float Rx = 600;
  //float Ry = 200;
  //float fx = 1;
  //float fy = 1;
  //int T = 360;
  //mx = Rx*cos(fx*PI*frameCount/T)+width/2;
  //my = Ry*sin(fy*PI*frameCount/T)+height/2;
  
  
  //Things to try
  //Distance to mouse sets rotation speed
  
  //for (int i = 0; i<num_vectors; i++){
  //  mouse_vec[i].x = mouseX;
  //  mouse_vec[i].y = mouseY;
  //  param[i].x = 6/positions[i].dist(mouse_vec[i]);
  //}
  
  //Lines point at mouse

  //for (int i = 0; i<num_vectors; i++){
  //  mouse_vec[i].x = mouseX;
  //  mouse_vec[i].y = mouseY;
  //  PVector Phase =PVector.fromAngle(PVector.angleBetween(mouse_vec[i],positions[i]));
  //  Phase.setMag(vectors[i].mag());
  //  vectors[i] = Phase;
  //}
  
  //Lines point at mouse version 2

  //for (int i = 0; i<num_vectors; i++){
  //  //mouse_vec[i].x = mouseX;
  //  //mouse_vec[i].y = mouseY;
  //  float x_Diff = mouseX-positions[i].x;
  //  float y_Diff = mouseY-positions[i].y;
    
  //  float Phase = atan2(y_Diff,x_Diff);

  //  //Randomise slightly
  //  //Phase = Phase + random(0.1)-0.05; //This just wiggles them.
    
  //  PVector Phase_vec =PVector.fromAngle(Phase);
  //  Phase_vec.setMag(vectors[i].mag());
  //  vectors[i] = Phase_vec;
  //}
  
  //Circle point
  
  //  for (int i = 0; i<num_vectors; i++){
  //  //mouse_vec[i].x = mouseX;
  //  //mouse_vec[i].y = mouseY;
  //  float x_Diff = mx-positions[i].x;
  //  float y_Diff = my-positions[i].y;
    
  //  float Phase = atan2(y_Diff,x_Diff);

  //  //Randomise slightly
  //  //Phase = Phase + random(0.1)-0.05; //This just wiggles them.
    
  //  PVector Phase_vec =PVector.fromAngle(Phase);
  //  Phase_vec.setMag(vectors[i].mag());
  //  vectors[i] = Phase_vec;
  //}
  
  //for (int i = 0; i<num_vectors; i++){
  //  mouse_vec[i].x = mx;
  //  mouse_vec[i].y = my;
  //  param[i].x = 5/positions[i].dist(mouse_vec[i]);
  //}
  
  //Perlin noise for vector length/direction

  //Update noise
  for (int i=0; i<size_x; i++){
    for (int j=0; j<size_y; j++){
      noise_pixels[i][j] = noise((i+frameCount*3)*noiseScale,j*noiseScale);
    }
  }
  //Changing the speed of rotation isn't very interesting
  //for (int i = 0; i<num_vectors; i++){
  //  float noise_val = 0.02*noise_pixels[(int)positions[i].x][(int)positions[i].y];
  //  param[i].x = noise_val;
  //}
  
  //Setting direction based on noise
  for (int i = 0; i<num_vectors; i++){
    //Distance from mouse
    mouse_vec[i].x = mouseX;
    mouse_vec[i].y = mouseY;
    //float intensity = map(positions[i].dist(mouse_vec[i]),0,sqrt(width^2+height^2),1.1,0.9);
    float intensity = 1.0;
    PVector Phase_vec =PVector.fromAngle(intensity*noise_pixels[(int)positions[i].x][(int)positions[i].y]-0.5);
    Phase_vec.setMag(vectors[i].mag());
    vectors[i] = Phase_vec;
  }
  
  //Increase wiggle around mouse
    for (int i = 0; i<num_vectors; i++){
      mouse_vec[i].x = mouseX;
      mouse_vec[i].y = mouseY;
      param[i].x = 6/positions[i].dist(mouse_vec[i]);
  }
  
}
