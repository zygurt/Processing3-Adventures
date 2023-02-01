int num_vectors = 8000; //<>//
PVector[] vectors = new PVector[num_vectors];
PVector[] positions = new PVector[num_vectors];
PVector[] param = new PVector[num_vectors]; //Speed, NA, NA
PVector[] mouse_vec = new PVector[num_vectors];

int size_x = 1920;
int size_y = 1080;

void setup(){
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
  
  //noLoop();
  fill(0);
  fullScreen(P2D);
}

void draw(){
  background(255);
  for (int i = 0; i<num_vectors; i++){
    line(positions[i].x, positions[i].y, positions[i].x+vectors[i].x, positions[i].y+vectors[i].y);
  }
  
  for (int i = 0; i<num_vectors; i++){
    vectors[i].rotate(param[i].x);
  }
  
  
  //Things to try
  //Distance to mouse sets rotation speed
  
  //for (int i = 0; i<num_vectors; i++){
  //  mouse_vec[i].x = mouseX;
  //  mouse_vec[i].y = mouseY;
  //  param[i].x = 5/positions[i].dist(mouse_vec[i]);
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

  for (int i = 0; i<num_vectors; i++){
    //mouse_vec[i].x = mouseX;
    //mouse_vec[i].y = mouseY;
    float x_Diff = mouseX-positions[i].x;
    float y_Diff = mouseY-positions[i].y;
    
    float Phase = atan2(y_Diff,x_Diff);

    //Randomise slightly
    //Phase = Phase + random(0.1)-0.05; //This just wiggles them.
    
    PVector Phase_vec =PVector.fromAngle(Phase);
    Phase_vec.setMag(vectors[i].mag());
    vectors[i] = Phase_vec;
  }
  
  //Perlin noise for vector length/direction

  
}
