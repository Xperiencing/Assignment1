//Patrick Malone C15398146
//Assignment 1
//The General premise is you are stationed on Earth commanding an unmanned 
//Spaceship through the Galaxy, and Monitoring the star Systems that it charts.

int start_time, check = 0, counter = 1;

void setup()
{
  //Setting up the screen size.
  fullScreen();
  background(0);
  stroke(255);
  
  start_time = millis();
}

void draw()
{
  initialize();  
}