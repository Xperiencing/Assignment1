class Button
{
  String button_name;
  float button_x_pos;
  float button_y_pos;
  float button_width;
  float button_height;
  int index;
  
  Button(String name, float x_pos, float y_pos, float but_width, float but_height, int i)
  {
      button_name = name;
      button_x_pos = x_pos;
      button_y_pos = y_pos;
      button_width = but_width;
      button_height = but_height;
      index = i;
  }
  
  void draw_button()
  {
    //Setting the parameters for the outline of the button.
    stroke(100);
    fill(20);
    strokeWeight(1);
    
    //This prints the button in its default position.
    if(function_check < index)
    {
      rect(button_x_pos, button_y_pos + button_menu_size[function_check], button_width, button_height, 5);
    }
    else
    {
      rect(button_x_pos, button_y_pos, button_width, button_height, 5);
    }
    
    //Setting the text parameters for the button.
    fill(100);
    textAlign(CENTER);
    textSize(18);
    
    //This prints the button in a new position based on any menu displayed above it.
    if(function_check < index)
    {
      text(button_name, button_x_pos + (button_width/2), (button_y_pos + (button_height/2)) + button_menu_size[function_check]);
    }
    else
    {
      text(button_name, button_x_pos + (button_width/2), button_y_pos + (button_height/2));
    }
  }
  
  
}