

class Mover
{

  PVector location;
  PVector velocity;
  PVector acceleration;
  // The object now has mass!
  float mass;
  float counter;

  Mover(float m, float x, float y)
  {
    // And for now, we’ll just set the mass equal to 1 for simplicity.
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    counter = random(5);
  }

  // Newton’s second law.
  void applyForce(PVector force)
  {
    // Receive a force, divide by mass, and add to acceleration.
    PVector f = PVector.div(force,mass);
    acceleration.add(f);

  }

  void update()
  {
    // Motion 101 from Chapter 1
    velocity.add(acceleration);
    location.add(velocity);

    // Now add clearing the acceleration each time!
    acceleration.mult(0);
    counter += 0.007;
  }

  void display()
  {
    stroke(0);
    fill(175);
    // Scaling the size according to mass.
    ellipse(location.x,location.y, sin(counter) * (mass*16), sin(counter) * (mass*16));
    checkEdges();
  }

  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
  void checkEdges()
  {
    if (location.x > width)
    {
      location.x = width;
      velocity.x *= -1;
    }
    else if (location.x < 0)
    {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height)
    {
      // Even though we said we shouldn't touch location and velocity directly,
      // there are some exceptions.
      // Here we are doing so as a quick and easy way to reverse the direction
      // of our object when it reaches the edge.
      velocity.y *= -1;
      location.y = height;
    }
  }
}
