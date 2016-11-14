void initialize()
{
  //Setting up the text parameters.
  textAlign(CENTER);
  textSize(32);
  textFont(mono);
  
  //Setting up variables needed for the starting screen
  int i, num_blinks = 4, finish = 0;
  String main_text = "Initialising...";
  float x_pos, y_pos; 
  float[] size_of_text = new float[main_text.length()];
  
  //for loop to get the length of each character in the string 
  for(i = 0; i < main_text.length(); i++)
  {
    char letter = main_text.charAt(i);
    size_of_text[i] = textWidth(letter);
  }
  
  //Getting the width of the entire string
  float text_width = textWidth(main_text);
  
  //Getting the positions of each of the underscores.
  x_pos = ((width/2) - (text_width/2));
  y_pos = (height/2 + 5);

  
  //The blinking of the underscore when the program first runs.
  if(function_check == 0)
  {
    blink(x_pos, y_pos, num_blinks, finish);
  }
  
  if (function_check == 1)
  {
    //Resetting the background to black so the underscore does not
    // keep reprinting on screen.
    background(0);
    
    for(i = 0; i < counter; i++)
    {
      if(millis() > (start_time + 4000)) 
      {
        fill(255);
        
        //This prints the underscore at the last character after each iteration.
        if(i == (counter - 1))
        {
          text('_', x_pos, y_pos);
        }
        
        //Printing each letter
        text(main_text.charAt(i), x_pos, y_pos - 1);
        
        //Getting the correct spacing between letters.
        if(i != counter - 1)
        {
          x_pos += (size_of_text[i] * .5) + (size_of_text[i + 1] * .5);
        }
        
        //This is a check which will trigger when the animation has finished.
        if(counter == (main_text.length()))
        {
          function_check = 2;
          first_run = 0;
        }
      }
      
      new_x_pos = x_pos;
      new_y_pos = y_pos;
    }
    
    //Incrementing counter so the for loop can take in another letter on the 
    //next iteration.
    counter++;
    delay(75);
  }
  
  //This allows the cursor to blink a few more times before the boot up screen finishes.
  if (function_check == 2)
  {
    finish = 1;
    blink(new_x_pos, new_y_pos, num_blinks, finish);  
  }
}