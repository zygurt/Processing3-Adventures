import de.voidplus.leapmotion.*;

int blocks =  50;
//int canvas_w = 1920, canvas_h = 1200;
int canvas_w = 1280, canvas_h = 720;
int block_w = 50, block_h = 60, block_d = 0;
boolean blank_flag = false;
boolean draw_flag = false;
int frame_count = 1;
int saved_frames = 1;
int total_frames = 400;
int change_mode = 50;
int fill_colour = 255;
int stroke_colour = 0;
//int x = 0, y = 200, w = 150, h = 100;

LeapMotion leap;

void setup(){
  //size(1280,720);
    //size(1920,1200);
  colorMode(HSB, 100);
  fullScreen(1);
  frameRate(25);
  background(0,0,0);
  
  leap = new LeapMotion(this);
}

// ======================================================
// 1. Callbacks

void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}


void draw() {
  //background(255);
  // ...

  int fps = leap.getFrameRate();
  for (Hand hand : leap.getHands ()) {


    // ==================================================
    // 2. Hand

    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition(); //[LR,DU,OI] [-200:1900, 1000:500, 0:80]
    PVector handStabilized     = hand.getStabilizedPosition(); //[LR,DU,OI] [-200:1900, 1000:400, 0:80]
    PVector handDirection      = hand.getDirection();
    PVector handDynamics       = hand.getDynamics();
    float   handRoll           = hand.getRoll(); //-180 to 180
    float   handPitch          = hand.getPitch(); //-180 to 180
    float   handYaw            = hand.getYaw(); //-180 to 180
    boolean handIsLeft         = hand.isLeft(); //true/false
    boolean handIsRight        = hand.isRight(); //true/false
    float   handGrab           = hand.getGrabStrength(); //0 to 1
    float   handPinch          = hand.getPinchStrength(); //0 to 1
    float   handTime           = hand.getTimeVisible();
    PVector spherePosition     = hand.getSpherePosition(); //[LR,DU,OI]can put sphere on top of hand
    float   sphereRadius       = hand.getSphereRadius(); //60 to 300

    // --------------------------------------------------
    // Drawing
    //hand.draw(); //<>//
    //println(handDirection);
    if (handGrab<0.5){
    block_w = int(handStabilized.x/5);
    block_h = int(handStabilized.y/5);
    block_d = int(handStabilized.z);
    draw_flag = true;
    }else{
      draw_flag = false;
    }
    //Clear the screen if hand is rolled
    if (abs(handRoll)>80){
      blank_flag = true;
    }else{
      blank_flag = false;
    }

    // ==================================================
    // 3. Arm

    if (hand.hasArm()) {
      Arm     arm              = hand.getArm();
      float   armWidth         = arm.getWidth();
      PVector armWristPos      = arm.getWristPosition();
      PVector armElbowPos      = arm.getElbowPosition();
    }


    // ==================================================
    // 4. Finger

    Finger  fingerThumb        = hand.getThumb();
    // or                        hand.getFinger("thumb");
    // or                        hand.getFinger(0);

    Finger  fingerIndex        = hand.getIndexFinger();
    // or                        hand.getFinger("index");
    // or                        hand.getFinger(1);

    Finger  fingerMiddle       = hand.getMiddleFinger();
    // or                        hand.getFinger("middle");
    // or                        hand.getFinger(2);

    Finger  fingerRing         = hand.getRingFinger();
    // or                        hand.getFinger("ring");
    // or                        hand.getFinger(3);

    Finger  fingerPink         = hand.getPinkyFinger();
    // or                        hand.getFinger("pinky");
    // or                        hand.getFinger(4);


    for (Finger finger : hand.getFingers()) {
      // or              hand.getOutstretchedFingers();
      // or              hand.getOutstretchedFingersByAngle();

      int     fingerId         = finger.getId();
      PVector fingerPosition   = finger.getPosition();
      PVector fingerStabilized = finger.getStabilizedPosition();
      PVector fingerVelocity   = finger.getVelocity();
      PVector fingerDirection  = finger.getDirection();
      float   fingerTime       = finger.getTimeVisible();

      // ------------------------------------------------
      // Drawing

      // Drawing:
      // finger.draw();  // Executes drawBones() and drawJoints()
      // finger.drawBones();
      // finger.drawJoints();

      // ------------------------------------------------
      // Selection

      switch(finger.getType()) {
      case 0:
        // System.out.println("thumb");
        break;
      case 1:
        // System.out.println("index");
        break;
      case 2:
        // System.out.println("middle");
        break;
      case 3:
        // System.out.println("ring");
        break;
      case 4:
        // System.out.println("pinky");
        break;
      }


      // ================================================
      // 5. Bones
      // --------
      // https://developer.leapmotion.com/documentation/java/devguide/Leap_Overview.html#Layer_1

      Bone    boneDistal       = finger.getDistalBone();
      // or                      finger.get("distal");
      // or                      finger.getBone(0);

      Bone    boneIntermediate = finger.getIntermediateBone();
      // or                      finger.get("intermediate");
      // or                      finger.getBone(1);

      Bone    boneProximal     = finger.getProximalBone();
      // or                      finger.get("proximal");
      // or                      finger.getBone(2);

      Bone    boneMetacarpal   = finger.getMetacarpalBone();
      // or                      finger.get("metacarpal");
      // or                      finger.getBone(3);

      // ------------------------------------------------
      // Touch emulation

      int     touchZone        = finger.getTouchZone();
      float   touchDistance    = finger.getTouchDistance();

      switch(touchZone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#" + fingerId + "): " + touchDistance);
        break;
      case 1: // Touching
        // println("Touching (#" + fingerId + ")");
        break;
      }
    }


    // ==================================================
    // 6. Tools

    for (Tool tool : hand.getTools()) {
      int     toolId           = tool.getId();
      PVector toolPosition     = tool.getPosition();
      PVector toolStabilized   = tool.getStabilizedPosition();
      PVector toolVelocity     = tool.getVelocity();
      PVector toolDirection    = tool.getDirection();
      float   toolTime         = tool.getTimeVisible();

      // ------------------------------------------------
      // Drawing:
      // tool.draw();

      // ------------------------------------------------
      // Touch emulation

      int     touchZone        = tool.getTouchZone();
      float   touchDistance    = tool.getTouchDistance();

      switch(touchZone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#" + toolId + "): " + touchDistance);
        break;
      case 1: // Touching
        // println("Touching (#" + toolId + ")");
        break;
      }
    }
  }


  // ====================================================
  // 7. Devices

  for (Device device : leap.getDevices()) {
    float deviceHorizontalViewAngle = device.getHorizontalViewAngle();
    float deviceVericalViewAngle = device.getVerticalViewAngle();
    float deviceRange = device.getRange();
  }
  if (draw_flag){
  if (blank_flag == false){
    for (int b=0;b<int(block_d/20);b++){ //int(abs(canvas_w-block_w)/300)
        fill(0);
        //noFill();
        //stroke(stroke_colour);
        stroke(random(100),100,100);
        strokeWeight(abs(block_h/8));
        //rect(random(canvas_w), random(canvas_h), random(block_w), random(block_h));
        //rect(random(canvas_w), random(canvas_h), mouseX/8, mouseY/8);
        ellipse(random(canvas_w), random(canvas_h), block_w, block_w);
      }
  }else{
    background(0,0,0);
  }
  }
}



//void draw(){
//  for (int b=0;b<int(abs(canvas_w-mouseX)/200);b++){
//      fill(0);
//      //noFill();
//      //stroke(stroke_colour);
//      stroke(random(100),100,100);
//      strokeWeight(mouseY/8);
//      //rect(random(canvas_w), random(canvas_h), random(block_w), random(block_h));
//      //rect(random(canvas_w), random(canvas_h), mouseX/8, mouseY/8);
//      ellipse(random(canvas_w), random(canvas_h), mouseX/8, mouseX/8);
//    }
//  frame_count++;
//  //if (frame_count>change_mode){
//  //    frame_count = 1;
//  //    if (fill_colour==255){
//  //      fill_colour = 0;
//  //      stroke_colour = 255;
//  //    }else{
//  //      fill_colour = 255;
//  //      stroke_colour = 0;
//  //    }
//  //}
//  //if(saved_frames<total_frames+1){
//  //  saveFrame("Movie/Rect-###.png");
//  //  saved_frames++;
//  //}else{
//  // noLoop(); 
//  //}
//}
