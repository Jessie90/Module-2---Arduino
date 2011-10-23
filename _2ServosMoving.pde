// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.

#include <Servo.h> 
#include <Firmata.h>
 
Servo myservo;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 
 
int pos1 = 0;    // variable to store the servo position 
int pos2 = 90;    // variable to store the servo position

//PhotoResistor Pin
int lightPin = 0; //the analog pin the photoresistor is 
                  //connected to
                  //the photoresistor is not calibrated to any units so
                  //this is simply a raw sensor value (relative light)

 
void setup() 
{ 
  Firmata.setFirmwareVersion(0, 1);
  Firmata.begin(57600);
  
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object
 Serial.begin(9600); 
} 
 
 
void loop() 
  {
    Serial.println(analogRead(lightPin));
    delay(500);
 int lightLevel = analogRead(lightPin); //Read the
                                        // lightlevel
         //adjust the value 0 to 900 to
         //span 0 to 255
  
  int sensorValue = analogRead(0);   
  Firmata.sendAnalog(0, sensorValue);  

  if (lightLevel > 200)
  { 
 // for(pos1 = 0; pos1 < 180; pos1 += 1)  // goes from 0 degrees to 180 degrees 
                                    // in steps of 1 degree 
    myservo.write(pos2);              // tell servo to go to position in variable 'pos' 
    delay(600000);       // waits 15ms for the servo to reach the position 

  }
  else {
    myservo.write(pos1);              // tell servo to go to position in variable 'pos' 
    delay(15);                       // waits 10min for the servo to reach the position 
    }
}
     
//for(pos1 = 180; pos1>=1; pos1-=1)     // goes from 180 degrees to 0 degrees 
                                 
//  for(pos2 = 0; pos2 < 180; pos2 += 1)  // goes from 0 degrees to 180 degrees 
//                                    // in steps of 1 degree 
//    myservo2.write(pos2);              // tell servo to go to position in variable 'pos' 
//    delay(15);                       // waits 15ms for the servo to reach the position 
//   
//  for(pos2 = 180; pos2>=1; pos2-=1)     // goes from 180 degrees to 0 degrees 
//                                  
//    myservo2.write(pos2);              // tell servo to go to position in variable 'pos' 
//    delay(15);                       // waits 15ms for the servo to reach the position 


