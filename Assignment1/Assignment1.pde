//Patrick Malone C15398146
//Assignment 1
//The General premise is you are stationed on Earth commanding an unmanned 
//Spaceship through the Galaxy, and Monitoring the star Systems that it charts.

int start_time, counter = 1;
int function_check = 0, menu_check = 0;
int first_run = 0, j = 1, check = 0;
int fade_in = 0;

float temp_x_pos = 0, temp_y_pos = 0;
float temp_star_size = 0;
float temp_width = 0, temp_height = 0;

float angle;

float engine_temperature = 200;

PFont mono;

//The array list containing all information relevant for the star map.
ArrayList<Star> stars_list = new ArrayList<Star>(); 

//setting up the basic ship model before changes.
Ship spaceship = new Ship(3, 1, 1, 2, 2);

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
  switch (menu_check)
  {
    //This starts the intialising screen before the interface opens.
    case 5:
    {
      initialize();
      break;
    }
    
    //This is a small delay between the initialising screen and the star map.
    case 4:
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
      
      break;
    }
    
    //This is the drawing of the star map.
    case 3:
    {
      star_map();
      select_star();
      break;
    }
    
    //This is the screen transitionbetween the star map and the ship.
    case 2:
    { 
      change_scene();
      break;
    }
    
    //This is the drawing of the ship and its overveiw.
    case 0:
    {
      float distance;
      
      background(0);
      spaceship.draw_ship(); 
      distance = engine_temp();
      water_coolant(distance);
       
      break;
    }
  }
}