class Ship
{
  int hull_type;
  int weapon_type;
  int engine_type;
  
  Ship(int hull, int weapon, int engine)
  {
    hull_type = hull;
    weapon_type = weapon;
    engine_type = engine;
  }
  
  void draw_ship()
  {
    draw_hull();
    draw_weapon();
    draw_engine();
  }
  
  void draw_hull()
  {
    switch (hull_type)
    {
      case 1:
      {
        float start_point_x, start_point_y;
        float hull_width, hull_height;
        
        hull_width = 200;
        hull_height = 200;
        
        start_point_x = (width/2 - hull_width/2);
        start_point_y = (height/2 - hull_height/2);
        
        rect(start_point_x, start_point_y, hull_width, hull_height);
        
        //This is the trimming on the top half of the ship's hull.
        line(start_point_x, start_point_y + (hull_height * (1/4)), 
            start_point_x + (hull_width * (1/8)), start_point_y + (hull_height * (1/8)));
            
        line(start_point_x + (hull_width * (1/8)), start_point_y + (hull_height * (1/8)), 
            start_point_x + (hull_width * (7/8)), start_point_y + (hull_height * (1/8)));
            
        line(start_point_x + (hull_width * (7/8)), start_point_y + (hull_height * (1/8)), 
            start_point_x + hull_width, start_point_y + (hull_height * (1/4)));
        
        //This is the trimming on the bottom half of the ship's hull.    
        line(start_point_x, start_point_y + (hull_height * (3/4)), 
            start_point_x + (hull_width * (1/8)), start_point_y + (hull_height * (7/8)));
            
        line(start_point_x + (hull_width * (1/8)), start_point_y + (hull_height * (7/8)), 
            start_point_x + (hull_width * (7/8)), start_point_y + (hull_height * (7/8)));
            
        line(start_point_x + (hull_width * (7/8)), start_point_y + (hull_height * (7/8)), 
            start_point_x + hull_width, start_point_y + (hull_height * (3/4)));
        
      }
      
      case 2:
      {
        
      }
      case 3:
      {
        
      }
    }
  }
  
  void draw_weapon()
  {
    switch (weapon_type)
    {
      case 1:
      {
        
      }
      
      case 2:
      {
        
      }
      case 3:
      {
        
      }
    }
  }
  
  void draw_engine()
  {
    switch (engine_type)
    {
      case 1:
      {
        
      }
      
      case 2:
      {
        
      }
      case 3:
      {
        
      }
    }
  }
}  
    