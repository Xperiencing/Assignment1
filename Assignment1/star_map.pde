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
  
  noStroke();
  
  for(int i=0; i < stars_list.size(); i++)
  {
    float x = stars_list.get(i).screen_pos.x;  
    float y = stars_list.get(i).screen_pos.y;  
    

    fill(255, 255, 10, 100);
    ellipse(x, y, 
            (stars_list.get(i).star_size  * 2), 
            (stars_list.get(i).star_size * 2));
      
  }
  
  
  for(int i=0; i < stars_list.size(); i++)
  {
    float x = stars_list.get(i).screen_pos.x;  
    float y = stars_list.get(i).screen_pos.y;  
    

    fill(255, 255, 90);
    ellipse(x, y, 
            (stars_list.get(i).star_size  * 1.5), 
            (stars_list.get(i).star_size * 1.5)); 
  }
  
}