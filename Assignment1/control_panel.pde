void control_panel()
{
  int spacing = 5;
  
  for(int i = 0; i < 4; i++)
  {
    Button ship_button = new Button(button_names[i], spacing, (height * (i/20)) + spacing, width/20, height/20);
  }
}