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
  change_temperature = int(random(0, 10));
  
  if(change_temperature == 1)
  {
    engine_temperature++;
  }
  
  if(change_temperature == 3)
  {
    engine_temperature--;
  }
  
  //j is the variable that controls how much the colour changes based on the temperature.
  j = 6;
  strokeWeight(3);
  stroke(100);
  
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
      stroke(100);  
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
  textAlign(RIGHT);
  fill(255, temperature_colour, 0);
  text(int(engine_temperature), width, height);
  
  return outer_radius;
}

void water_coolant(float horizontal_spacing)
{
  //Setting the coulour of the water guage.
  stroke(0, 0, 150);
  fill(0, 0, 150);
  strokeWeight(1);
  
  float vertical_spacing = height/20;
  
  //This rect allows for the centre of the water coolant guage to be blue.
  rect(width - (horizontal_spacing * 2.5), height - (vertical_spacing * 2),
        horizontal_spacing, vertical_spacing);
  
  stroke(100);
  
  //This is the outline of the water guage.
  line(width - (horizontal_spacing * 1.5), height - vertical_spacing,
       width - (horizontal_spacing * 2.5), height - vertical_spacing);
        
  line(width - (horizontal_spacing * 1.5), height - vertical_spacing * 2,
       width - (horizontal_spacing * 2.5), height - vertical_spacing * 2);
  
  //This is the right hand side of the water guage.
  arc(width - (horizontal_spacing * 1.5), height - vertical_spacing * 1.5,
      horizontal_spacing * 1/8, vertical_spacing, radians(-90), HALF_PI);
      
  //This is the left hand side of the water guage.   
  arc(width - (horizontal_spacing * 2.5), height - vertical_spacing * 1.5,
      horizontal_spacing * 1/8, vertical_spacing, HALF_PI, PI + HALF_PI);
}