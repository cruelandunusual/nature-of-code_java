class Walker
{
  float stepX;
  float stepY;
  color walkerColor;
  float sd;
  
  Walker(color c)
  {
    //initialise walker location to middle of screen
    stepX = width / 2 + int(random(40)) - 20; // values range from -20 - 20
    stepY = height / 2 + int(random(40)) - 20;
    this.walkerColor = c; //set color
    sd = 2.0;
  }
  
  void draw()
  {
    stroke(walkerColor);
    ellipse(stepX, stepY, 16, 16);
    
  }
  
  void step()
  {
    
    int directionX = int(random(3))-1; // poss values: -1, 0, 1
    float gauX = randomGaussian();
    stepX += (gauX * sd) * directionX; // compute step size and direction by multiplying these values

    int directionY = int(random(3))-1;
    float gauY = randomGaussian();
    stepY += (gauY * sd) * directionY;
  }
}


