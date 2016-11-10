void initialise()
{
  //Setting up the background and text parameters.
  background(0);
  
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
  
  while(frameCount % 300 != 0)
  {
    textAlign(LEFT);
    noStroke();
    fill(230);
    text('_', x_pos, y_pos);
      
    stroke(0);
    fill(255);
    text('_', x_pos, y_pos);   
      
  
  
  for(i = 0; i < main_text.length(); i++)
  {
     
  }
  
}