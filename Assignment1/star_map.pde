void load_data()
{
  Table table = loadTable("map_of_stars.csv", "header");
  for(TableRow data : table.rows())
  {
    Star star = new Star(data);    
    stars.add(star);
  }
}

void star_map()
{
  
}