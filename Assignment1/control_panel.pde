void control_panel()
{
  int spacing = 5;
  float button_y_pos;
  float button_height = height/30, button_width = width/10;
  
  //Decreasing the cooldown each second.    
  if(start_time + (1000 * (20 - cooldown)) < millis())
  {
    cooldown--;
  }
  
  //Decreasing supplies every five seconds, and changing happiness of state of each crew 
  //member based on the stock of resources on the ship.
  if(space_time + (10000 * check) < millis())
  {
    for(int i = 0; i < 6; i++)
    {
      //If the resources are greater that 5, 5 stock is used up.
      if(resource_stock[i] > 5)
      {
        resource_stock[i] -= 10;
      }
      
      //Taking away from the crews mental state if the stock is less than 50.
      if(resource_stock[i] < 150)
      {
        for(j = 0; j < 5; j++)
        {
          mental_status[j] -= .01;    
        }
      }
      
      //If the stock adds up to more than 150, the crews status increases.
      if(resource_stock[i] > 200)
      {
        for(j = 0; j < 5; j++)
        {
            if(mental_status[j] < 1 && mental_status[j] > 0)
            {
              mental_status[j] += .01;
            }
        }
      }
      
    }
    
    //Incrementing check so that the if statement is only entered once every ten seconds.
    check++;
  }
  
  for(int i = 0; i < 4; i++)
  {
    button_y_pos = (height * (i/20.0)) + spacing;
    
    //This creates a new object for each button and then calls the draw function for that object.
    Button ship_button = new Button(button_names[i], spacing, button_y_pos, button_width, button_height, i);
    ship_button.draw_button();
    
    //This is an if statement to check if one of the buttons have been pressed.
    //If the button has not been moved because of a menu the if statement is entered, 
    //otherwise the else statement is entered.
    if(function_check > i)
    {
      if(mousePressed == true && 
          (mouseY >= button_y_pos && mouseY <= (button_y_pos + button_height)) && 
          (mouseX >= spacing && mouseX <= (spacing + button_width)))
      {
        function_check = i;  
      }
    }
    
    else
    {
      if(mousePressed == true && 
          (mouseY >= button_y_pos + button_menu_size[function_check]) &&
          (mouseY <= (button_y_pos + button_height) + button_menu_size[function_check]) && 
          (mouseX >= spacing && mouseX <= (spacing + button_width)))
      {
        function_check = i;  
      }
    }
  }
}