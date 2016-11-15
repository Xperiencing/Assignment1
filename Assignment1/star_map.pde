void load_data()
{
  Table table = loadTable("map_of_stars.csv", "header");
  for(TableRow data : table.rows())
  {
    Star star = new Star(data);
    stars_list.add(star);
  }
}

void star_map()
{
  background(0);
 
  if(counter == 0)
  {
    shooting_star_x = random(0, width - 100);
    shooting_star_y = random(0, height - 100);
    counter++;
  }
  
  fill(255, 255, 255, shooting_star_fade + 0);
  stroke(255, 255, 255, shooting_star_fade + 0);
  strokeWeight(10);
  
  ellipse(shooting_star_x, shooting_star_y, 8, 8);
  line(shooting_star_x, shooting_star_y, shooting_star_x - 20, shooting_star_y - 20);
  line(shooting_star_x, shooting_star_y, shooting_star_x - 20, shooting_star_y - 15);
  line(shooting_star_x, shooting_star_y, shooting_star_x - 15, shooting_star_y - 20);
  
  shooting_star_x += 3;
  shooting_star_y += 3;
  
  if(function_check == 0)
  { 
    shooting_star_fade += 2;
  }
  if(function_check == 1)
  {
    shooting_star_fade -= 2; 
  }
  
  
  if(shooting_star_fade >= 200)
  {
    function_check = 1;  
  }
  if(shooting_star_fade <= 0)
  {
    function_check = 1;
    counter = 0;
  }
   
  
  counter++;
    
    
  for(int i = 0; i < stars_list.size(); i++)
  {
    float star_x = stars_list.get(i).screen_pos.x;  
    float star_y = stars_list.get(i).screen_pos.y;  
    
    j = 0;
    
    for(int r = 200;  r > 100; r -= 5)
    {
      stroke(255, 255, j + 60, fade_in  + 0);
      fill(255, 255, j + 100, fade_in + 0);
      ellipse(star_x, star_y, 
              (stars_list.get(i).star_size  * (.01 * r)), 
              (stars_list.get(i).star_size * (.01 * r)));
              
      j++;
    }
    
  }
  
  if(fade_in < 200)
  {
    fade_in++;
  }
  
  
}