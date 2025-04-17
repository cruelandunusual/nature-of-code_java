
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
  float distMult;
  
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

    /*
      implement variable magnitude of acceleration,
      greater when it is closer to the object
      (or the opposite, perhaps)
     */
    
    mouse = new PVector(mouseX,mouseY);
    dir = PVector.sub(mouse, location);
    // Shouldn't hardcode 10.0 but for a simple exercise it's fine.
    // Dividing 10.0 by dir.mag() results in a tiny number if mag is huge,
    // and a smaller number if mag is small.
    distMult = abs(10.0 / dir.mag());

    dir.normalize();
    dir.mult(0.5);

    // Multiplying dir by distMult makes dir small if distMult is small,
    // which means object is far from the mouse. This makes the motion slower.
    acceleration = dir.mult(distMult); 

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
