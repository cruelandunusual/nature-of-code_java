

class Walker
{
  float stepX;
  float stepY;
  color walkerColor;
  
  Walker(color c)
  {
    //initialise walker location to approx middle of screen
    stepX = width / 2 + int(random(40)) - 20; // values range from -20 - 20
    stepY = height / 2 + int(random(40)) - 20;
    this.walkerColor = c; //set color
  }
  
  void draw()
  {
    stroke(walkerColor);
    fill(walkerColor);
    //point(stepX, stepY);
    ellipse(stepX, stepY, 16, 16);
    
  }
  
  void step(float tx, float ty)
  {

    float xn = noise(tx);
    float yn = noise(ty);
    
    float x = map(xn,0,1,0,3); //Using map() to customize the range of Perlin noise
    float y = map(yn,0,1,0,3);
      
    int dirx = int(random(3))-1; //choose random direction from -1, 0, 1
    int diry = int(random(3))-1;
    x *= dirx; //multiply x by direction to set a direction size (can also be zero if direction is zero)
    y *= diry;

    stepX += x;
    stepY += y;
  }
}
