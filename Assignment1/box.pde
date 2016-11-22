class Box
{
  float box_width;
  float box_height;
  float box_pos_x;
  float box_pos_y;
  
  Box (float req_width, float req_height, float x_pos, float y_pos)
  {
    box_width = req_width;
    box_height = req_height;
    box_pos_x = x_pos;
    box_pos_y = y_pos;
  }
  
  void draw_box()
  {
      rect(box_pos_x, box_pos_y, box_width, box_height, 5);
  }
}