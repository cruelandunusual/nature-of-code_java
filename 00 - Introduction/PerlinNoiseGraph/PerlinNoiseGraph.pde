

float time = 0.0;

void setup()
{

  size(640, 360);
  background(255);

}


void draw()
{
  background(255);
  float xoff = time;
  noFill();
  stroke(0);
  strokeWeight(2);
  beginShape();
  for (int i = 0; i < width; i++)
  {
    float y = noise(xoff) * height;
    xoff += 0.007;
    vertex(i, y);
  }
  endShape();
  time += 0.9;

}
