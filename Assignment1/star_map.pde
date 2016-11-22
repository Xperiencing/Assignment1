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
  //The margin is 
  int margin = 50;
  float angle = 0;
  strokeWeight(1.5);
  
  for(int i = 0; i < stars_list.size(); i++)
  {
    
    //This if statement allows a star to be hovered over and essentially be selected to find out more
    //information
    if(mouseX >  (stars_list.get(i).screen_pos.x - stars_list.get(i).star_size) 
        && mouseX <  (stars_list.get(i).screen_pos.x + stars_list.get(i).star_size)
        && mouseY >  (stars_list.get(i).screen_pos.y - stars_list.get(i).star_size)
        && mouseY <  (stars_list.get(i).screen_pos.y + stars_list.get(i).star_size))
    {
      temp_x_pos = stars_list.get(i).screen_pos.x;
      temp_y_pos = stars_list.get(i).screen_pos.y;
      
      temp_star_size = stars_list.get(i).star_size;
      
      noFill();
      stroke(150);
      
      //Slowly drawing the circle as if it is being animated.
      arc(stars_list.get(i).screen_pos.x, stars_list.get(i).screen_pos.y, 
          margin, margin, radians(0), radians(counter));
          
      //This increases the angle of the arc as long as the mouse stays hovered over a star.
      counter += 5;
      
      if(counter > 360)
      {
          if(temp_x_pos < width/2 && temp_y_pos < height/2)
          {
             line(temp_x_pos + margin/2, temp_y_pos, temp_x_pos + margin, temp_y_pos);
          }
          else if(temp_x_pos > width/2 && temp_y_pos < height/2)
          {
            line(temp_x_pos - margin/2, temp_y_pos, temp_x_pos - margin, temp_y_pos);
          }
          else if(temp_x_pos < width/2 && temp_y_pos > height/2)
          {
            line(temp_x_pos + margin/2, temp_y_pos, temp_x_pos + margin, temp_y_pos);   
          }
          else
          {
            line(temp_x_pos - margin/2, temp_y_pos, temp_x_pos - margin, temp_y_pos);
          }
      }
    }
    
    //This if statement resets the counter to allow the circle to be drawn again when hovering
    //over another star
    if(mouseX <  (temp_x_pos - temp_star_size) || mouseX > (temp_x_pos + temp_star_size)
        || mouseY <  (temp_y_pos - temp_star_size) || mouseY > (temp_y_pos + temp_star_size))
    {
      counter = 1;  
    }  
    
  }
  
  //Resetting the value of strokeWeight to default for other functions
  strokeWeight(1);
}