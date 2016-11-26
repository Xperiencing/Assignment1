class Button
{
  String button_name;
  float button_x_pos;
  float button_y_pos;
  float button_width;
  float button_height;
  
  Button(String name, float x_pos, float y_pos, float but_width, float but_height)
  {
      button_name = name;
      button_x_pos = x_pos;
      button_y_pos = y_pos;
      button_width = but_width;
      button_height = but_height;
  }
  
  void draw_button()
  {
    stroke(100);
    fill(20);
    strokeWeight(1);
    
    rect(button_x_pos, button_y_pos, button_width, button_height, 5);
    
    fill(100);
    textAlign(CENTER);
    textSize(18);
    text(button_name, button_x_pos + (button_width/2), button_y_pos + (button_height/2));
  }
  
  
}