//Patrick Malone C15398146
//Assignment 1
//The General premise is you are stationed on Earth commanding an unmanned 
//Spaceship through the Galaxy, and Monitoring the star Systems that it charts.

int start_time, counter = 1;
int function_check = 0, menu_check = 0;
int first_run = 0, j = 1, check = 0;
float new_x_pos = 0, new_y_pos = 0;
int fade_in = 0, shooting_star_fade = 0;

float shooting_star_x;
float shooting_star_y;

PFont mono;

ArrayList<Star> stars_list = new ArrayList<Star>(); 

void setup()
{
  //Setting up the screen size.
  //fullScreen();
  size(1000, 1000);
  background(0);
  stroke(0);
  smooth(8);
  
  mono = createFont("american-typewriter.ttf", 32);
  
  load_data();
}

void draw()
{
  if(menu_check == 3)
  {
    initialize();
  }
  
  if(menu_check == 3)
  {
    if(j > 0)
    {
      delay(1000);
      menu_check = 2;
    }
    
    if(j == 0)
    {
      background(0);
      j++;
    }
    
  }
  if(menu_check == 0)
  {
    star_map();
    select_star();
  }
}