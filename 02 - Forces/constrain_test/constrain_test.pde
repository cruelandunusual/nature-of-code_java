

void setup()
{
    size(640, 360);
}


void draw()
{
  background(204);
  float mx = constrain(mouseX, 30, 70);
  rect(mx-10, mouseY, 20, 20);
}
