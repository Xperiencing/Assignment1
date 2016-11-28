class Ship
{
  int hull_type;
  int cockpit_type;
  int stabilisers_type;
  int weapon_type;
  int engine_type;
  
  Ship(int hull, int cockpit, int stabilisers, int weapon, int engine)
  {
    hull_type = hull;
    cockpit_type = cockpit;
    stabilisers_type = stabilisers;
    weapon_type = weapon;
    engine_type = engine;
  }
  
  void draw_ship()
  {
    stroke(100);
    noFill();
    strokeWeight(1);
    
    float start_point_x, start_point_y;
    float hull_width, hull_height;
    
    //Specifying the constants for the ship, that will reflect the size of everything.
    hull_width = 400;
    hull_height = 200;
    
    start_point_x = (width/2 - hull_width/2);
    start_point_y = (height/2 - hull_height/2);
    
    //Calling each seperate function to draw each part of the ship.
    draw_hull(start_point_x, start_point_y, hull_width, hull_height);
    draw_cockpit(start_point_x, start_point_y, hull_width, hull_height);
    draw_stabilisers(start_point_x, start_point_y, hull_width, hull_height);
    draw_weapon(start_point_x, start_point_y, hull_width, hull_height);
    draw_engine(start_point_x, start_point_y, hull_width, hull_height);
  }
  
  void draw_hull(float start_point_x, float start_point_y, float hull_width, float hull_height)
  {
    float circle_width = hull_width * 1/8;
    
    //The basic hull without any upgrade.
    if(hull_type == 1 || hull_type == 2 || hull_type == 3)
    {
      //This is the main hull that the rest of the ship is based on
      rect(start_point_x, start_point_y, hull_width, hull_height);
      
      //This is the trimming on the top half of the ship's hull.
      line(start_point_x, start_point_y + (hull_height * (1/4f)), 
          start_point_x + (hull_width * (1/8f)), start_point_y + (hull_height * (1/8f)));
          
      line(start_point_x + (hull_width * (1/8f)), start_point_y + (hull_height * (1/8f)), 
          start_point_x + (hull_width * (7/8f)), start_point_y + (hull_height * (1/8f)));
          
      line(start_point_x + (hull_width * (7/8f)), start_point_y + (hull_height * (1/8f)), 
          start_point_x + hull_width, start_point_y + (hull_height * (1/4f)));
      
      //This is the trimming on the bottom half of the ship's hull.    
      line(start_point_x, start_point_y + (hull_height * (3/4f)), 
          start_point_x + (hull_width * (1/8f)), start_point_y + (hull_height * (7/8f)));
          
      line(start_point_x + (hull_width * (1/8f)), start_point_y + (hull_height * (7/8f)), 
          start_point_x + (hull_width * (7/8f)), start_point_y + (hull_height * (7/8f)));
          
      line(start_point_x + (hull_width * (7/8f)), start_point_y + (hull_height * (7/8f)), 
          start_point_x + hull_width, start_point_y + (hull_height * (3/4f)));
      
    }
    
    //The first hull upgrade.
    if(hull_type == 2 || hull_type == 3)
    {        
      //This will put a 2 x 3 area of shield generators on the ship
      for(int i = 1; i < 3; i++)
      {
        for(int r = 1; r < 4; r++)
        {
          ellipse(start_point_x + (hull_width * r/4), start_point_y + (hull_height * i/3),
              circle_width, circle_width);
        }
      }
    }
    
    //The second hull upgade.
    if(hull_type == 3)
    {
      float circle_x_point, circle_y_point;
      
      //This upgrade reinforces the shield generators from the first upgrade.
      for(int i = 1; i < 3; i++)
      {
        for(int r = 1; r < 4; r++)
        {
        circle_x_point = start_point_x + (hull_width * r/4);
        circle_y_point = start_point_y + (hull_height * i/3);
      
        line(circle_x_point - (circle_width/2), circle_y_point, circle_x_point + (circle_width/2), circle_y_point);
        line(circle_x_point, circle_y_point - (circle_width/2), circle_x_point, circle_y_point + (circle_width/2));
        }
      }
    }
    
  }
  
  void draw_cockpit(float start_point_x, float start_point_y, float hull_width, float hull_height)
  {

      if(cockpit_type == 1)
      {
        //This is the default hull type
        arc((start_point_x + hull_width), (start_point_y + (hull_height/2.0)), 
            (hull_width * 1/4), (hull_height/2.0), -radians(90), (HALF_PI));
        
        arc((start_point_x + hull_width), (start_point_y + (hull_height/2.0)), 
            (hull_width * 3/4), hull_height, -radians(90), (HALF_PI)); 
      }
      
      if(cockpit_type == 2 || cockpit_type == 3)
      {
        //This is the first upgrade to the ship from the default.
        line((start_point_x + hull_width), (start_point_y + (hull_height * 1/4)),
              (start_point_x + (hull_width * 6/5)), (start_point_y + (hull_height * 2/5)));
        
        line((start_point_x + (hull_width * 6/5)), (start_point_y + (hull_height * 2/5)),
              (start_point_x + (hull_width * 6/5)), (start_point_y + (hull_height * 3/5)));
              
        line((start_point_x + (hull_width * 6/5)), (start_point_y + (hull_height * 3/5)),
              (start_point_x + hull_width), (start_point_y + (hull_height * 3/4)));
        
        arc((start_point_x + hull_width), (start_point_y + (hull_height/2.0)), 
            (hull_width * 3/4), hull_height, -radians(90), (HALF_PI)); 
      }
      
      if(cockpit_type == 3)
      {
        //This is the second upgrade to the cockpit, adding more reinforcement and a shield generator
        //Similar to second hull upgrade.
        ellipse((start_point_x + (hull_width * 9/8)), (start_point_y + hull_height/2),
                  hull_height/5, hull_height/5);
                 
        line(start_point_x + hull_width, start_point_y + hull_height/2,
              (start_point_x + (hull_width + (hull_height * 3/4))), start_point_y + hull_height/2);
      }
    
  }
  
  void draw_stabilisers(float start_point_x, float start_point_y, float hull_width, float hull_height)
  {
    switch (stabilisers_type)
    {
      case 1:
      {
        //This is the code for the top wing/stabiliser.
        line(start_point_x + (hull_width * 1/8), start_point_y,
              start_point_x, start_point_y - (hull_height * .5));
              
        line(start_point_x, start_point_y - (hull_height * .5),
              start_point_x + (hull_width * 3/4), start_point_y);
        
        //This is the code for the bottom.
        line(start_point_x + (hull_width * 1/8), start_point_y + hull_height,
              start_point_x, start_point_y + (hull_height * 1.5));
              
        line(start_point_x, (start_point_y + (hull_height * 1.5)),
              start_point_x + (hull_width * 3/4), start_point_y + hull_height);
        
      }
      
      case 2:
      {
        
      }
      
      case 3:
      {
        
      }
    }
  }
  
  void draw_weapon(float start_point_x, float start_point_y, float hull_width, float hull_height)
  {
    switch (weapon_type)
    {
      case 0:
      {
        //This is just a case to disable weapons on the ship.
        break;
      }
      case 1:
      {
        //This Weapon is a machine gun type weapon
        float weapon_start_x = (start_point_x + (hull_width * 4/5));
        float weapon_start_y = start_point_y + hull_height;
        
        float weapon_width = (hull_width * 1/10);
        float weapon_height = (hull_height * 1/10);
        
        //This is the base for the top and bottom weapons
        rect(weapon_start_x, start_point_y - weapon_height,
              weapon_width, weapon_height);
              
        rect(weapon_start_x, weapon_start_y,
              weapon_width, weapon_height);
        
        //This is the barrel of both weapons
        rect(weapon_start_x + (weapon_width * 1/4), start_point_y - (weapon_height * 1.5),
              weapon_width * 3, weapon_height * .5);
              
        rect(weapon_start_x + (weapon_width * 1/4), weapon_start_y + weapon_height,
              weapon_width * 3, weapon_height * .5);
              
        break;
      
      }
      
      case 2:
      {
        //This Weapon is a machine gun type weapon
        float weapon_start_x = (start_point_x + (hull_width * 4/5));
        float weapon_start_y = start_point_y + hull_height;
        
        float weapon_width = (hull_width * 1/15);
        float weapon_height = (hull_height * 1/8);
        
        //This is the base for the top and bottom weapons
        rect(weapon_start_x, start_point_y - weapon_height,
              weapon_width * .5, weapon_height);
              
        rect(weapon_start_x, weapon_start_y,
              weapon_width * .5, weapon_height);
        
        //This is the barrel part of the weapon.
        rect(weapon_start_x - (weapon_width * .5), start_point_y - (weapon_height * 2),
              weapon_width * 3, weapon_height); 
              
        rect(weapon_start_x - (weapon_width * .5), weapon_start_y + weapon_height,
              weapon_width * 3, weapon_height);
              
        //This is muzzle of the cannon.
        arc(weapon_start_x + (weapon_width * 2.5), start_point_y - (weapon_height * 1.5),
            weapon_height, weapon_height, radians(-90), HALF_PI);
            
        arc(weapon_start_x + (weapon_width * 2.5), weapon_start_y + (weapon_height * 1.5),
            weapon_height, weapon_height, radians(-90), HALF_PI);
           
      }
      
      case 3:
      {
        
      }
    }
  }
  
  void draw_engine(float start_point_x, float start_point_y, float hull_width, float hull_height)
  {
    //This is the starting engine.
    if(engine_type == 1)
    {
      rect(start_point_x - (hull_width * 1/8), start_point_y + (hull_height * 1/5),
            hull_width * 1/8, hull_height * 3/5);
      
    }
    
    //This is the second upgrade for the engine.
    if(engine_type == 2 || engine_type == 3)
    {
      line(start_point_x, start_point_y,
            start_point_x - (hull_width * 1/8), start_point_y + (hull_height * 1/5));
      
      line(start_point_x - (hull_width * 1/8), start_point_y + (hull_height * 1/5),
            start_point_x - (hull_width * 1/8), start_point_y +  (hull_height * 4/5));
            
      line(start_point_x - (hull_width * 1/8), start_point_y +  (hull_height * 4/5),
            start_point_x, start_point_y + hull_height);
            
      for(int i = 1; i < 5; i++)
      {
        line(start_point_x - (hull_width * 1/8), start_point_y + (hull_height * i/5),
          start_point_x, start_point_y + (hull_height * i/5));
      }

    }
    
    //This is the third upgrade for the engine
    if(engine_type == 3)
    {
       line(start_point_x - (hull_width * 1/8), start_point_y + (hull_height * 1/5),
            start_point_x - (hull_width * 1/5), start_point_y);
            
       line(start_point_x - (hull_width * 1/5), start_point_y,
             start_point_x - (hull_width * 1/5), start_point_y + hull_height);
       
       line(start_point_x - (hull_width * 1/5), start_point_y + hull_height,
             start_point_x - (hull_width * 1/8), start_point_y + (hull_height * 4/5));
       
    }

  }
}  
    