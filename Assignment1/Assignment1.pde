//Patrick Malone C15398146
//Assignment 1
//The General premise is you are stationed on Earth commanding an unmanned 
//Spaceship through the Galaxy, and Monitoring the star Systems that it charts.

int start_time, counter = 1;
int function_check = 0, menu_check = 0;
int first_run = 0, j = 1, check = 0;
int fade_in = 0, shooting_star_fade = 0;

float temp_x_pos = 0, temp_y_pos = 0;
float temp_star_size = 0;
float temp_width = 0, temp_height = 0;

PFont mono;

//The array list containing all information relevant for the star map.
ArrayList<Star> stars_list = new ArrayList<Star>(); 

//setting up the basic ship model before changes.
Ship spaceship = new Ship(1, 1, 1);

void setup()
{
  //Setting up the screen size.
  fullScreen();
  background(0);
  stroke(0);
  smooth(8);
  
  mono = createFont("american-typewriter.ttf", 32);
  
  load_data();
}

void draw()
{
  //This starts the intialising screen before the interface opens.
  if(menu_check == 0)
  {
    initialize();
  }
  
  //This is a small delay between the initialising screen and the star map.
  if(menu_check == 1)
  {
    if(j > 0)
    {
      delay(500);
      menu_check = 2;
    }
    
    if(j == 0)
    {
      background(0);
      j++;
    }
    
  }
  
  //This is the drawing of the star map.
  if(menu_check == 2)
  {
    star_map();
    select_star();
  }
  
  //This is the screen transitionbetween the star map and the ship.
  if(menu_check == 3)
  { 
    if(function_check == 0)
    {
      if(first_run == 0)
      {
        fade_in = 0;
        first_run++;
      }
      
      stroke(255, 255, 255, fade_in);
      fill(255, 255, 255, fade_in);
      strokeWeight(1);
      
      change_scene();
      
      fade_in++;
      
      if(fade_in > 100)
      {
        function_check = 1;
        first_run = 1;
        spaceship.draw_ship();
      }
    }
    
    if(function_check == 1)
    {
      if(first_run == 1)
      {
        fade_in = 255;
        first_run++;
      }
      
      background(0);
      
      stroke(255, 255, 255, fade_in);
      fill(255, 255, 255, fade_in);
      strokeWeight(1);
      change_scene();
      
      fade_in--;
      
      if(fade_in < 0)
      {
        menu_check = 4;
        first_run = 0;
        background(0);
      }
    }
  }
  
  //This is the drawing of the ship and its overveiw.
  if(menu_check == 4)
  {
     stroke(50, 50, 50);
     noFill();
     spaceship.draw_ship(); 
  }
}