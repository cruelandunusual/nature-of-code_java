

Walker w;

float t = 0;

void setup()
{

  size(640, 360);
  background(255);
  w = new Walker(100);
  
}


void draw()
{
  background(255);
  //fill(200);

  w.step(t, t+1000);
  w.draw();
  t += 0.06;
}

