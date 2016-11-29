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
    
    //Showing the current location of the ship
    if(stars_list.get(i).current_location == 1)
    {
      stroke(255, 0, (fade_in * 10));
      line(stars_list.get(i).screen_pos.x - 3, stars_list.get(i).screen_pos.y - 3, 
            stars_list.get(i).screen_pos.x + 3, stars_list.get(i).screen_pos.y + 3);
      line(stars_list.get(i).screen_pos.x + 3, stars_list.get(i).screen_pos.y - 3, 
            stars_list.get(i).screen_pos.x - 3, stars_list.get(i).screen_pos.y + 3);
    }
    
  }
  
  if(fade_in <= 30)
  {
    fade_in++;
  }
  
}

void select_star()
{
  //The margin is the width of the arc that will animate around the star.
  int margin = 50;
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
      
      //Checking if the user has clicked on the star to go to the current location of the ship.
      if(mousePressed && stars_list.get(i).current_location == 1)
      {
        menu_check = 3;
      }
      
      if(counter > 360)
      {
          temp_width = 400;
          temp_height = 150;
          
          fill(50);
          textSize(20);
          textAlign(LEFT);
          
          //Each if statement containes parameters for where the text and info boxes should be positioned.
          if(temp_x_pos < width/2 && temp_y_pos < height/2)
          {
             //This creates two lines coming from the animated circle which will lead into a box.
             line(temp_x_pos + margin/2, temp_y_pos, temp_x_pos + margin, temp_y_pos);
             line(temp_x_pos + margin, temp_y_pos, temp_x_pos + (margin * 2), temp_y_pos + (margin * 2));
                    
             //A new object of the box class is created with parameters meant to match up with the previous lines drawn.
             Box info_box = new Box(temp_width, temp_height, temp_x_pos + (margin * 2), temp_y_pos + (margin * 2), i);
             info_box.draw_box();         
             
             //This writes the text neatly into the box that is drawn.
             fill(255);
             text(info_box.toString(), (temp_x_pos + (margin * 2) + 5), (temp_y_pos + (margin * 2)) + 20, i);
          }
          else if(temp_x_pos > width/2 && temp_y_pos < height/2)
          {
            line(temp_x_pos - margin/2, temp_y_pos, temp_x_pos - margin, temp_y_pos);
            line(temp_x_pos - margin, temp_y_pos, temp_x_pos - (margin * 2), temp_y_pos + (margin * 2));
            
            Box info_box = new Box(temp_width, temp_height, temp_x_pos - (margin * 10), temp_y_pos + (margin * 2), i);
            info_box.draw_box();
            
            fill(255);
            text(info_box.toString(), (temp_x_pos - (margin * 10)) + 5, (temp_y_pos + (margin * 2)) + 20, i);
          }
          else if(temp_x_pos < width/2 && temp_y_pos > height/2)
          {
            line(temp_x_pos + margin/2, temp_y_pos, temp_x_pos + margin, temp_y_pos);
            line(temp_x_pos + margin, temp_y_pos, temp_x_pos + (margin * 2), temp_y_pos - (margin * 2));
            
            Box info_box = new Box(temp_width, temp_height, temp_x_pos + (margin * 2), temp_y_pos - (margin * 5), i);
            info_box.draw_box();
            
            fill(255);
            text(info_box.toString(), (temp_x_pos + (margin * 2)) + 5, (temp_y_pos - (margin * 5)) + 20, i);
          }
          else
          {
            line(temp_x_pos - margin/2, temp_y_pos, temp_x_pos - margin, temp_y_pos);
            line(temp_x_pos - margin, temp_y_pos, temp_x_pos - (margin * 2), temp_y_pos - (margin * 2));
            
            Box info_box = new Box(temp_width, temp_height, temp_x_pos - (margin * 10), temp_y_pos - (margin * 5), i);
            info_box.draw_box();
            
            fill(255);
            text(info_box.toString(), (temp_x_pos - (margin * 10)) + 5, (temp_y_pos - (margin * 5)) + 20, i);
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

void change_scene()
{  
  if(function_check == 0)
    {
      if(first_run == 0)
      {
        fade_in = 0;
        first_run++;
      }
      
      stroke(255, 255, 255, fade_in);
      fill(255, 255, 255, fade_in);
      strokeWeight(1);
      
      rect(0, 0, width, height); 
      
      fade_in++;
      
      if(fade_in > 100)
      {
        function_check = 1;
        first_run = 1;
        spaceship.draw_ship();
      }
    }
    
    if(function_check == 1)
    {
      if(first_run == 1)
      {
        fade_in = 255;
        first_run++;
      }
      
      background(0);
      
      stroke(255, 255, 255, fade_in);
      fill(255, 255, 255, fade_in);
      strokeWeight(1);
      rect(0, 0, width, height); 
      
      fade_in -= 5;
      
      if(fade_in < 0)
      {
        menu_check = 4;
        first_run = 0;
        j = 0;
        start_time = millis();
        background(0);
      }
    }
}