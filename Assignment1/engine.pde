float engine_temp()
{
  float centre_point_x = width;
  float centre_point_y = height;
  
  float inner_x_point, inner_y_point;
  float outer_x_point, outer_y_point;
  
  float inner_radius = 200, outer_radius = 250;
  
  int change_temperature, temperature_colour = 255;
  
  //The change temperature varialbe will be used to randomly change the engine temperature.
  //This will be reflected in the guage in the bottom left corner of the screen.
  if(frameCount % 10 == 0)
  {
    change_temperature = int(random(0, 10));
    
    if(change_temperature == 1)
    {
      engine_temperature++;
    }
    
    if(change_temperature == 3)
    {
      engine_temperature--;
    }
  }
  
  //j is the variable that controls how much the colour changes based on the temperature.
  j = 6;
  strokeWeight(3);
  stroke(150);
  
  for(angle = radians(180); angle <= radians(270); angle += radians(2))
  {
    //These if statements control the colour of the lines in the guage.
    if(temperature_colour > 255 - engine_temperature)
    {
      stroke(255, temperature_colour, 0);
      temperature_colour -= j;  
    }
    else
    {
      stroke(150);  
    }
    
    //This will find the points in an arc at the bottom left corner of the screen
    //and then connect them in order to form the guage
    outer_x_point = centre_point_x + cos(angle) * outer_radius;
    outer_y_point = centre_point_y + sin(angle) * outer_radius;
    
    inner_x_point = centre_point_x + cos(angle) * inner_radius;
    inner_y_point = centre_point_y + sin(angle) * inner_radius;
  
    line(inner_x_point, inner_y_point, outer_x_point, outer_y_point);
    
  }
  
  //This prints out the exact engine temperature in the bottom left hand corner of the screen.
  textSize(50);
  textAlign(CENTER);
  fill(255, temperature_colour, 0);
  text(int(engine_temperature), width - 80, height - 80);
  
  textSize(18);
  fill(150);
  text("Engine Temp °C", width - 80, height - 60);
  
  return outer_radius;
}