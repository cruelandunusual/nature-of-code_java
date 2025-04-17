

class Balloon
{

  PVector location;
  PVector velocity;
  PVector acceleration;

  //float mass;
  float radius;

  Balloon()
  {
    //mass = 2;
    location = new PVector((width / 2), height);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    radius = 16;
  }


  void applyForce(PVector force)
  {
    // Receive a force, divide by mass, and add to acceleration.
    //PVector f = PVector.div(force,mass);
    //acceleration.add(f);

    acceleration.add(force);

  }

  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);

    // clear the acceleration each time
    // otherwise it's accumulating every frame
    acceleration.mult(0);
    checkEdges();
  }

  
  void display() {
    stroke(0);
    fill(175);

    //ellipse(location.x,location.y,mass*16,mass*16);     // Scaling the size according to mass.
    ellipse(location.x,location.y,radius*2,radius*2);
  }

  
  void checkEdges() {
    if ((location.x + radius) > width)
    {
      //location.x = width;
      velocity.x *= -1;
    }
    else if ((location.x - radius) < 0)
    {
      velocity.x *= -1;
      //location.x = 0;
    }

    if ((location.y - radius) < 0)
    {
      // Even though we said we shouldn't touch location and velocity directly, there are some exceptions.
      // Here we are doing so as a quick and easy way to reverse the direction
      // of our object when it reaches the edge.
      velocity.y *= -0.9;
      //location.y = height;
    }
  }
}
