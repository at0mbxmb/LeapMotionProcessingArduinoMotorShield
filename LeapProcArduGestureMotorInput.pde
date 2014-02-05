/*
 * Leap Motion -> Processing -> Arduino -> Motor
 *
 * Michelle Leonhart 2014-02-04
 * @at0mbmxb www.tinwhiskers.net
 *
 */
 
import de.voidplus.leapmotion.*;
import processing.serial.*; 

Serial port;
LeapMotion leap;

void setup() {
  size(800, 600, P3D);
  background(255);

  leap = new LeapMotion(this).withGestures();

  port = new Serial(this, "/dev/tty.usbmodem1411", 9600);
  /* If you want to change from port /dev/tty.usbmodem1411,
   * Use this to list out all available serial ports:
   * println(Serial.list());
   *
   * And pick the number of the one you want.
   * Like this: 
   * port = new Serial(this, Serial.list()[0], 9600);   <-- This would pick the first port from the list
   */  
}

void draw() {
  background(255);
  
  for (Hand hand : leap.getHands()) {
    hand.draw();
  }
}


// SWIPE GESTURE
void leapOnSwipeGesture(SwipeGesture g, int state){
  int       id               = g.getId();
  Finger    finger           = g.getFinger();
  PVector   position         = g.getPosition();
  PVector   position_start   = g.getStartPosition();
  PVector   direction        = g.getDirection();
  float     speed            = g.getSpeed();
  long      duration         = g.getDuration();
  float     duration_seconds = g.getDurationInSeconds();

  switch(state){
    case 1: // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      println("SwipeGesture");
      port.write("s");
      break;
  }
}

// CIRCLE GESTURE
void leapOnCircleGesture(CircleGesture g, int state){
  int       id               = g.getId();
  Finger    finger           = g.getFinger();
  PVector   position_center  = g.getCenter();
  float     radius           = g.getRadius();
  float     progress         = g.getProgress();
  long      duration         = g.getDuration();
  float     duration_seconds = g.getDurationInSeconds();

  switch(state){
    case 1: // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      println("CircleGesture");
      port.write("c");
      break;
  }
}

// SCREEN TAP GESTURE
void leapOnScreenTapGesture(ScreenTapGesture g){
  int       id               = g.getId();
  Finger    finger           = g.getFinger();
  PVector   position         = g.getPosition();
  PVector   direction        = g.getDirection();
  long      duration         = g.getDuration();
  float     duration_seconds = g.getDurationInSeconds();

  println("ScreenTapGesture");
  port.write("t");

}

// KEY TAP GESTURE
void leapOnKeyTapGesture(KeyTapGesture g){
  int       id               = g.getId();
  Finger    finger           = g.getFinger();
  PVector   position         = g.getPosition();
  PVector   direction        = g.getDirection();
  long      duration         = g.getDuration();
  float     duration_seconds = g.getDurationInSeconds();
  
  println("KeyTapGesture");
  port.write("k");
}

