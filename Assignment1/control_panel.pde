void control_panel()
{
  int spacing = 5;
  float button_y_pos;
  float button_height = height/30, button_width = width/10;
  
  for(int i = 0; i < 4; i++)
  {
    button_y_pos = (height * (i/20.0)) + spacing;
    
    Button ship_button = new Button(button_names[i], spacing, button_y_pos, button_width, button_height);
    ship_button.draw_button();
    
    if(mousePressed == true && 
        (mouseY >= button_y_pos && mouseY <= (button_y_pos + button_height)) && 
        (mouseY >= spacing && mouseY <= (spacing + button_width)))
    {
      function_check = i;  
    }
  }
}