void initialize()
{
  //Setting up the text parameters.
  textAlign(CENTER);
  textSize(32);
  
  //Setting up variables needed for the starting screen
  int i;
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
  
  println(main_text.length());
  
  if(check == 0)
  {
    start_blinks(x_pos, y_pos);
  }
  
  if (check == 1)
  {
    for(i = 0; i < counter; i++)
    {
      if(millis() > (start_time + 4000)) 
      {
        fill(255);
        text('_', x_pos, y_pos);
        text(main_text.charAt(i), x_pos, y_pos - 1);
        
        x_pos += size_of_text[1];
        
        if(counter == (main_text.length()))
        {
          check = 2;  
        }
      }
    }
    
    counter++;
  }
}