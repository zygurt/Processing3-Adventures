class Buffer {
  int len;
  float[] buff;
  Buffer (int buffer_len){
    len = buffer_len;
    buff = new float[buffer_len];
  }
  //Shifting Functions
  void shiftLeft(float q){
    //Insert q at position len-1
    for(int i = 0;i<len-1;i++){
      buff[i] = buff[i+1];
    }
    buff[len-1] = q;
  }
  void shiftRight(float q){
    //Insert q at position 0
    for(int i = len-1;i>0;i--){
      buff[i] = buff[i-1];
    }
    buff[0] = q;
  }
  //Rotate Functions
  void rotateLeft(int n){
    //Rotate n times
    for(int j = 0; j<n;j++){
      float temp=buff[0];
      for(int i = 0;i<len-1;i++){
        buff[i] = buff[i+1];
      }
      buff[len-1] = temp;
    }
  }
  void rotateRight(int n){
    //Rotate n times
    for(int j = 0; j<n;j++){
      float temp=buff[len-1];
      for(int i = len-1;i>0;i--){
        buff[i] = buff[i-1];
      }
      buff[0] = temp;
    }
  }
}
