class Box
{
  float box_width;
  float box_height;
  float box_pos_x;
  float box_pos_y;
  int index;
  
  //Constructors
  Box (float req_width, float req_height, float x_pos, float y_pos, int i)
  {
    box_width = req_width;
    box_height = req_height;
    box_pos_x = x_pos;
    box_pos_y = y_pos;
    index = i;
  }
  
  //This function simply draws the box on-screen.
  void draw_box()
  {
      rect(box_pos_x, box_pos_y, box_width, box_height, 5);
  }
  
  //This function is for storing the info that will be printed in each of the info boxes.
  String toString()
  {
    if(stars_list.get(index).current_location == 0)
    {
    return "This star's name is " + stars_list.get(index).name + ".\n" + 
            "It is " + stars_list.get(index).star_size + " parsecs in diameter\n" +
            "and it has " + stars_list.get(index).planets + " planets orbiting it.\n";
    }
    else 
    {
      return "This star's name is " + stars_list.get(index).name + " \n" + 
            "It is " + stars_list.get(index).star_size + " parsecs in diameter.\n" +
            "and it has " + stars_list.get(index).planets + " orbiting it.\n\n" +
            "Click on the star to display ship.";     
    }
    
  }
}