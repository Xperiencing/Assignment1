void engine_temp()
{
  float centre_point_x = width - 20;
  float centre_point_y = height - 20;
  
  float inner_x_point, inner_y_point;
  float outer_x_point, outer_y_point;
  
  float inner_radius = 200, outer_radius = 250;
  
  strokeWeight(3);
  stroke(255);
  
  for(angle = radians(180); angle <= radians(270); angle += radians(10))
  {
    outer_x_point = centre_point_x + cos(angle) * outer_radius;
    outer_y_point = centre_point_y + sin(angle) * outer_radius;
    
    inner_x_point = centre_point_x + cos(angle) * inner_radius;
    inner_y_point = centre_point_y + sin(angle) * inner_radius;
  
    line(inner_x_point, inner_y_point, outer_x_point, outer_y_point);
  }
}