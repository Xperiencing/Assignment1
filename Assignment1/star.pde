class Star
{
  boolean hab;
  String name;
  float distance;
  float star_size;
  PVector position;
  PVector screen_pos;
  int planets;
  int current_location;
  
  // constructors 
  Star(TableRow data)
  {
    name = data.getString("Display Name");
    distance = data.getFloat("Distance");
    star_size = data.getFloat("AbsMag");
    hab = (data.getInt("Hab?") == 1);
    planets = data.getInt("Planets");
    current_location = data.getInt("CurLocation");
    
    
    position = new PVector(data.getFloat("Xg") 
                      ,data.getFloat("Yg") 
                      ,data.getFloat("Zg"));
                      
    screen_pos = new PVector( map(position.x, -5, 5, 0, width)
                           , map(position.y, -5, 5, 0, height));
  
  }

}