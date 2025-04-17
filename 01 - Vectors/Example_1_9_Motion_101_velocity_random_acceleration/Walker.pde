
class Walker
{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  int diameter;
  int radius;
  float topspeed;

  Walker()
  {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-0.01,0.01),random(-0.1,0.1));

    radius = 16;
    diameter = radius * 2;
    topspeed = 5.0;
  }

  void update()
  {
    // Motion 101: Location changes by velocity.
    checkEdges();
    acceleration = PVector.random2D();
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

    //handleInput();
  }


  /*
    I've added this noisey function just as a placeholder to store the sort of code I might need;
    saves me shuttling back and forth between different files.
    I think the code will change substantially though for it to be useful for this class.
  */
  void noisey()
  {

    float xn = noise(t+100000);
    float yn = noise(t);
  
    float x = map(xn,0,1,0,width); //Using map() to customize the range of Perlin noise
    float y = map(yn,0,1,0,height);
    ellipse(x,y,32,32);

    t += 0.006;

  }

  void display()
  {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, diameter, diameter);
  }

  void handleInput()
  {

    if (key == CODED)
    {
      if (keyCode == UP)
      {
        acceleration.add(new PVector(0, -0.01));
      }
      else if (keyCode == DOWN)
      {
        acceleration.add(new PVector(0, 0.01));
      }
      else if (keyCode == RIGHT)
      {
        acceleration.add(new PVector(0.01, 0));
      }
      else if (keyCode == LEFT)
      {
        acceleration.add(new PVector(-0.01, 0));
      }
    }
  }


  void checkEdges()
  {
    if ((location.x - radius) > width)
    {
      location.x = 0 - radius;
    }
    else if ((location.x + radius) < 0)
    {
      location.x = width + radius;
    }

    if ((location.y - radius) > height)
    {
      location.y = 0 - radius;
    }
    else if ((location.y + radius) < 0)
    {
      location.y = height + radius;
    }
  }
}
