void setup()
{

  size(640, 360);
  background(255);

}

void draw()
{

  float gauX = randomGaussian();
  float sdX = 60; //standard deviation
  float meanX = width/2; // half of window width
  float x = sdX * gauX + meanX;

  float gauY = randomGaussian();
  float sdY = 60; //standard deviation
  float meanY = height/2; // half of window height  
  float y = sdY * gauY + meanY;

  float gauScale = randomGaussian();
  //float sdScale = 32;
  float scaleReciprocal = 5;
  
  
  float ellipseScale = (scaleReciprocal - abs(gauScale)) * 32;
  //System.out.println(1 / gauScale);
  
  noStroke();
  fill(0, 20);
  //ellipse(x, y, 32, 32);
  ellipse(x, y, ellipseScale, ellipseScale);
  
}
