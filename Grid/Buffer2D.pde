class Buffer2D {
  int rows, cols;
  float[][] buff;
  Buffer2D (int rows_in, int cols_in){
    rows = rows_in;
    cols = cols_in;
    buff = new float[rows][cols];
  }
  ////Shifting Functions
  void shiftLeft(float q){
    for(int i=0;i<rows;i++){
      for(int j=0;j<cols-1;j++){
        buff[i][j] = buff[i][j+1];
      }
      buff[i][cols-1] = q;
    }
  }
  void shiftRight(float q){
    //Insert q at position 0
    for(int i=0;i<rows;i++){
      for(int j=cols-1;j>0;j--){
        buff[i][j] = buff[i][j-1];
      }
      buff[i][0] = q;
    }
  }
  void shiftUp(float q){
    for(int j=0;j<cols;j++){
      for(int i=0;i<rows-1;i++){
        buff[i][j] = buff[i+1][j];
      }
      buff[rows-1][j] = q;
    }
  }
  void shiftDown(float q){
    for(int j=0;j<cols;j++){
      for(int i=rows-1;i>0;i--){
        buff[i][j] = buff[i-1][j];
      }
      buff[0][j] = q;
    }
  }
  ////Rotate Functions
  void rotateLeft(){
    //Rotate n times
    for(int i=0;i<rows;i++){
      float temp = buff[i][0];
      for(int j=0;j<cols-1;j++){
        buff[i][j] = buff[i][j+1];
      }
      buff[i][cols-1] = temp;
    }
  }
  void rotateRight(){
    //Rotate n times
    for(int i=0;i<rows;i++){
      float temp = buff[i][cols-1];
      for(int j=cols-1;j>0;j--){
        buff[i][j] = buff[i][j-1];
      }
      buff[i][0] = temp;
    }
  }
  void rotateUp(){
    for(int j=0;j<cols;j++){
      float temp = buff[0][j];
      for(int i=0;i<rows-1;i++){
        buff[i][j] = buff[i+1][j];
      }
      buff[rows-1][j] = temp;
    }
  }
  void rotateDown(){
    for(int j=0;j<cols;j++){
      float temp = buff[rows-1][j];
      for(int i=rows-1;i>0;i--){
        buff[i][j] = buff[i-1][j];
      }
      buff[0][j] = temp;
    }
  }
}
