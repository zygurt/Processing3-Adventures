float[][] noise_pixels = new float[1920][1080];
float noiseScale = 0.02;
void setup() {
  noiseSeed(0);
  strokeCap(PROJECT);
  //Fill the noise array with noise
  noiseDetail(3,0.5);
  for (int i=0; i<1920; i++){
    for (int j=0; j<1080; j++){
      noise_pixels[i][j] = noise(i*noiseScale,j*noiseScale);
    }
  }
  fullScreen(P2D);
  
}

void draw() {
  //Update the noise
  for (int i=0; i<1920; i++){
    for (int j=0; j<1080; j++){
      noise_pixels[i][j] = noise((i+frameCount*4)*noiseScale,j*noiseScale);
    }
  }
  
  
  //Draw the noise
  //for (int i=0; i<1920; i++){
  //  for (int j=0; j<1080; j++){
  //    stroke(noise_pixels[i][j]*255);
  //    point(i,j);
  //  }
  //}
  loadPixels();
  for (int x=0; x<1920; x++){
    for (int y=0; y<1080; y++){
      int loc = x+y*1920;
      pixels[loc] = (int)(noise_pixels[x][y]*255); //<>//
    }
  }
  updatePixels();
}
