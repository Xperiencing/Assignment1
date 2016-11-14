//Patrick Malone C15398146
//Assignment 1
//The General premise is you are stationed on Earth commanding an unmanned 
//Spaceship through the Galaxy, and Monitoring the star Systems that it charts.

int start_time, counter = 1;
int function_check = 0, menu_check = 0;
int first_run = 0, j = 1, check = 0;
float new_x_pos = 0, new_y_pos = 0;

void setup()
{
  //Setting up the screen size.
  fullScreen();
  background(0);
  stroke(0);
  
  load_data();
}

void draw()
{
  if(menu_check == 0)
  {
    initialize();
  }
  
  if(menu_check == 1)
  {
    star_map();  
  }
}