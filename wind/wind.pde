FloatDict points;

void setup(){
  size (400,400);
  points = new FloatDict();
  points.set("x",200);
  points.set("y",200);
  points.set("mag", 50);
  points.set("phase",0); //Radians
  
  //noLoop();
  fill(0);
}

void draw(){
  background(0);
  int x = (int)points.get("x");
  int y = (int)points.get("y");
  int x2 = (int)(points.get("x")+points.get("mag")*cos(points.get("phase")));
  int y2 = (int)(points.get("y")+points.get("mag")*sin(points.get("phase")));
  line(x,y,x2,y2);
  
  points.set("phase",points.get("phase")+0.1);
  if (points.get("phase")>2*PI){
    points.set("phase",0);
  }
  
}
