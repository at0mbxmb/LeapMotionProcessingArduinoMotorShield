/*
 * Leap Motion -> Processing -> Arduino -> Servo
 *
 * Michelle Leonhart 2014-02-04
 * @at0mbmxb www.tinwhiskers.net
 *
 */
 
#include <AFMotor.h>
#include <Servo.h> 

Servo servo1;

int servoVal = 10 ;

void setup() {
  Serial.begin(9600); 
  
  servo1.attach(9);
}

void loop() {
  if ( Serial.available()) {
    int input = Serial.read();
    servo1.write(input);
  }
}
