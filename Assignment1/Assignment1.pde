//Patrick Malone C15398146
//Assignment 1
//The General premise is you are stationed on Earth commanding an unmanned 
//Spaceship through the Galaxy, and Monitoring the star Systems that it charts.

int start_time, counter = 1;
int function_check = 0, menu_check = 0;
int first_run = 0, j = 1, check = 0;
int fade_in = 0;
int cooldown = 0;

long space_time;

float temp_x_pos = 0, temp_y_pos = 0;
float temp_star_size = 0;
float temp_width = 0, temp_height = 0;

float angle;

//The starting temperature for the engine.
float engine_temperature = 200;

//These are the positions for the ammunation coming from the weapons.
float top_weapon_x, top_weapon_y;
float bottom_weapon_x, bottom_weapon_y;
float ammunition_width, ammunition_height;
float temp_weapon_top, temp_weapon_bottom;

//These variables are used in the ship overveiw.
int hide_UI = 0, move_ship = 0, weapon_status = 0;

//Initialising a new font variable.
PFont mono;

//The array list containing all information relevant for the star map.
ArrayList<Star> stars_list = new ArrayList<Star>(); 

//The array of strings containing all of the names of the buttons in the ship screen.
String [] button_names = {"Test Weapon",
                            "Crew Status",
                            "Upgrade Ship",
                            "Resource Monitor",
                            };

//The names of the members of the crew.
String [] crew_members = {"John Doe",
                           "Hazel Soap",
                           "Daniel Scrub",
                           "Melissa yarn",
                           "Sarah jeans"
                         };

//This is the current status of all crew members, 1 being in a perfect state.
float [] mental_status = {.72, .59, .24, 1, .9};

//This is a list of the ships parts.
String [] ship_parts = {"Hull",
                         "Cockpit",
                         "Stabilisers",
                         "Weapon",
                         "Engine"
                       };

//This array controls the upgrades and weapon switches on the ship.
int [] ship_upgrades = {1, 1, 1, 0, 1};

//This array of strings contains the names of all the resources available on the ship.
String [] resources = {"Food",
                        "Water",
                        "Oxygen",
                        "Metal",
                        "Fuel",
                        "Energy"
                      };
                      
//This is the current stock of all the resources available on the ship.
int [] resource_stock = {200, 150, 100, 250, 100, 100};

//The shapeds for the ammunation that are fired from the weapons
PShape ammunition_top, ammunition_bottom;

//setting up the basic ship model before changes.
Ship spaceship = new Ship(ship_upgrades[0], ship_upgrades[1], ship_upgrades[2], ship_upgrades[3], ship_upgrades[4]);

//The array needs to be first initalised with 5 numbers, as height and width cannot be used before they are 
//declared in setup.
float [] button_menu_size = {1, 1, 1, 1, 0}; 

void setup()
{
  //Setting up the screen size.
  fullScreen();
  //size(1000, 1000);
  background(0);
  stroke(0);
  smooth(8);
  
  mono = createFont("american-typewriter.ttf", 32);
  
  load_data();
  
  //This sets the first four elements in the array to the appropriate size for the menu, for the respective button.
  button_menu_size[0] = (height/5);
  button_menu_size[1] = (height/2);
  button_menu_size[2] = (height/2);
  button_menu_size[3] = (height/2);

}

void draw()
{
  switch (menu_check)
  {
    //This starts the intialising screen before the interface opens.
    case 0:
    {
      initialize();
      break;
    }
    
    //This is a small delay between the initialising screen and the star map.
    case 1:
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
    case 2:
    {
      star_map();
      select_star();
      break;
    }
    
    //This is the screen transitionbetween the star map and the ship.
    case 3:
    { 
      change_scene();
      space_time = millis();
      break;
    }
    
    //This is the drawing of the ship and its overveiw.
    case 4:
    {
      background(0);
      
      if(hide_UI == 0)
      {         
        engine_temp();
        control_panel();
      }
      
      if(move_ship == 1)
      {
        spaceship.fire_weapon();
      }
      
      Ship spaceship = new Ship(ship_upgrades[0], ship_upgrades[1], ship_upgrades[2], ship_upgrades[3], ship_upgrades[4]);
      spaceship.draw_ship();
      
      if(keyPressed)
      {
        if(key == 32)
        {
          hide_UI = 0;
          move_ship = 0;
        }
      }
       
      break;
    }
  }
}