void start_blinks(float x_pos, float y_pos)
{
  if(millis() > start_time && millis() < (start_time + 1000)) 
  {
    fill(255);
    text('_', x_pos, y_pos);
    text('_', x_pos, y_pos);
  }
  
  if(millis() > (start_time + 1000) && millis() < (start_time + 1200))
  {
    background(0);
  }
  
  if(millis() > (start_time + 1200) && millis() < (start_time + 2000)) 
  {
    fill(255);
    text('_', x_pos, y_pos);
    text('_', x_pos, y_pos);
  }
  
  if(millis() > (start_time + 2000) && millis() < (start_time + 2200))
  {
    background(0);
  }
  
  if(millis() > (start_time + 2200) && millis() < (start_time + 3000)) 
  {
    fill(255);
    text('_', x_pos, y_pos);
    text('_', x_pos, y_pos);
  }
  
  if(millis() > (start_time + 3000) && millis() < (start_time + 3200))
  {
    background(0);
  }
  
  if(millis() > (start_time + 3200) && millis() < (start_time + 4000)) 
  {
    fill(255);
    text('_', x_pos, y_pos);
    text('_', x_pos, y_pos);
  }
  
  if(millis() > (start_time + 4000)) 
  {
    check = 1;
  }
  
}