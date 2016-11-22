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
  if(fade_in >= 30)
  {
    background(0);
  }
    
  for(int i = 0; i < stars_list.size(); i++)
  {
    float star_x = stars_list.get(i).screen_pos.x;  
    float star_y = stars_list.get(i).screen_pos.y;  
    
    j = 0;
    
    for(int r = 200;  r > 100; r -= 5)
    {
      stroke(255, 255, j + 100, fade_in  + 0);
      fill(255, 255, j + 100, fade_in + 0);
      ellipse(star_x, star_y, 
              (stars_list.get(i).star_size  * (.01 * r)), 
              (stars_list.get(i).star_size * (.01 * r)));
              
      j++;
    }
    
  }
  
  if(fade_in <= 30)
  {
    fade_in++;
  }
  
}

void select_star()
{
  int margin = 30;
  float temp_x = 0, temp_y = 0;
  
  for(int i = 0; i < stars_list.size(); i++)
  {
    if(mouseX >  (stars_list.get(i).screen_pos.x - margin) 
        && mouseX <  (stars_list.get(i).screen_pos.x + margin)
        && mouseY >  (stars_list.get(i).screen_pos.y - margin)
        && mouseY <  (stars_list.get(i).screen_pos.y + margin))
    {
      temp_x = stars_list.get(i).screen_pos.x;
      temp_y = stars_list.get(i).screen_pos.y;
      
      println("hi");
      println("goodbye");
      noFill();
      stroke(100);
      
      arc(stars_list.get(i).screen_pos.x, stars_list.get(i).screen_pos.y, 
          margin, margin, radians(0), radians(counter));
      counter += 5;
    }
    
    if(temp_x != 0 && temp_y != 0 && mouseX <  (temp_x - margin) || mouseX > (temp_x + margin)
        || mouseY <  (temp_y - margin) || mouseY > (temp_y + margin))
    {
      println("test");
      counter = 1;  
    }  
    
  }
}