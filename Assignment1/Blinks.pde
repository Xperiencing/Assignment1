void blink(float x_pos, float y_pos, int num_blinks, int finish)
{
  //These are the variables that control the length of the blink.
  int on_time = 1300, off_time = 300;
  
  //A first time set up when running the blink function
  if(first_run == 0)
  {
    start_time = millis();
    first_run++;
    j = 1;
  }
  
  //This will print the underscore underneath either the first or last character.
  if(millis() > (start_time + (off_time + (on_time * (j - 1)))) && millis() < (start_time + (on_time * j))) 
  {
    fill(255);
    text('_', x_pos, y_pos);
    
    if(check == 0)
    {
      check = 1;  
    }
  }
  
  else
  {
    //The colour is set to black so the underscore seems to dissappear, which allows the main 
    //string to stay printed in the same location.
    fill(0);
    text('_', x_pos, y_pos);
    text('_', x_pos, y_pos);
    
    //This if statement allows for j to be incremented which sets the window of time for the 
    //first if statement forward.
    if(check == 1 && j <= num_blinks)
    {
      j++; 
      check = 0;  
    }
    
  }
  
  if(millis() > start_time + (on_time * num_blinks)) 
  {
    if(finish == 0)
    {
      function_check = 1;
    }
    else
    {
      menu_check = 1;
      function_check = 0;
      delay(2000);
    }
    
  }
}