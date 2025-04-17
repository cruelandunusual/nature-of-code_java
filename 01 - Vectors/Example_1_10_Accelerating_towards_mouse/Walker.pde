
class Walker
{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  int diameter;
  int radius;
  float topspeed;
  PVector dir;
  PVector mouse;
  
  Walker()
  {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-0.01,0.01),random(-0.1,0.1));

    radius = 16;
    diameter = radius * 2;
    topspeed = 10.0;

  }

  
  void update()
  {

    mouse = new PVector(mouseX,mouseY);
    dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.5);

    acceleration = dir; // or else could say velocity.add(dir), but this makes the code more physics-y.

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    checkEdges();
    
  }


  void display()
  {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, diameter, diameter);
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
