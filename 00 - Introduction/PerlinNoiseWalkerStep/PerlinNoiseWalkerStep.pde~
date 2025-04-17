

float t = 0;

void setup()
{

  size(640, 360);
  background(255);

}


void draw()
{
  background(255);
  fill(200);

  float xn = noise(t+100000);
  float yn = noise(t);
  
  float x = map(xn,0,1,0,width); //Using map() to customize the range of Perlin noise
  float y = map(yn,0,1,0,height);
  ellipse(x,y,32,32);

  t += 0.006;
}

