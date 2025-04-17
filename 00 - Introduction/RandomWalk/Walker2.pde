class Walker2
{
  float stepX;
  float stepY;
  color walkerColor;
  
  Walker2(color c)
  {
    //initialise walker location to middle of screen
    stepX = width / 2 + random(40) - 20; // values range from -20 - 20
    stepY = height / 2 + random(40) - 20;
    this.walkerColor = c; //set color
  }
  
  void draw()
  {
    stroke(walkerColor);
    ellipse(stepX, stepY, 16, 16);
  }

  void step()
  {
    float r = random(1);
    if(r < 0.5) stepX--;
    else if(r < 0.625) stepX++;
    else if(r < 0.75) stepY++;
    else stepY--;
  }
  
}
