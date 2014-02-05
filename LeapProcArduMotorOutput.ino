/*
 * Leap Motion -> Processing -> Arduino -> Motor
 *
 * Michelle Leonhart 2014-02-04
 * @at0mbmxb www.tinwhiskers.net
 *
 */
 
#include <AFMotor.h>

AF_DCMotor motor1(1);
AF_DCMotor motor2(2);

void setup() {
  Serial.begin(9600);          
  
  motor1.setSpeed(0);
  motor1.run(RELEASE);
  
  motor2.setSpeed(0);
  motor2.run(RELEASE);
}

void loop() {
  if ( Serial.available()) {
    char input = Serial.read();
    Serial.print(input);  
    
    // Circle Gesture = motors on
    if (input == 'c') {       
      motor1.run(FORWARD);
      motor1.setSpeed(50);
      
      motor2.run(BACKWARD);
      motor2.setSpeed(50);
    }  
    
    // Swipe Gesture = motors off
    if (input == 's') {       
      motor1.setSpeed(0);
      motor2.setSpeed(0);
    }  
  }
}
