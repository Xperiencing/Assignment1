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
  
  for(int i = 0; i < stars_list.size(); i++)
  {
    float x = stars_list.get(i).screen_pos.x;  
    float y = stars_list.get(i).screen_pos.y;  
    
    j = 0;
    
    for(int r = 200;  r > 100; r -= 5)
    {
      stroke(255, 255, j + 60, fade_in  + 1);
      fill(255, 255, j + 100, fade_in + 1);
      ellipse(x, y, 
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