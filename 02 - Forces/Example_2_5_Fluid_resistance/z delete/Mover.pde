

class Mover
{

  PVector location;
  PVector velocity;
  PVector acceleration;
  // The object now has mass!
  float mass;
  float diameter;
  float radius;
  

  Mover(float m, float x, float y)
  {

    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    diameter = mass * 16.0;
    radius = diameter / 2.0;

  }

  // Newton’s second law.
  void applyForce(PVector force)
  {
    // Receive a force, divide by mass, and add to acceleration.
    // The proper equation is A = F / M
    PVector f = PVector.div(force,mass);
    acceleration.add(f);

  }

  
  void update()
  {
    // Motion 101 from Chapter 1
    velocity.add(acceleration);
    location.add(velocity);

    // clear the acceleration each time
    acceleration.mult(0);

  }

  void display()
  {
    stroke(0);
    fill(175);
    // Scaling the size according to mass.
    ellipse(location.x,location.y, diameter, diameter);
    checkEdges();
  }

  float getLocationX()
  {
    return location.x;
  }

  float getLocationY()
  {
    return location.y;
  }

  float getDiameter()
  {
    return diameter;
  }

  float getRadius()
  {
    return radius;
  }

  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
  void checkEdges()
  {

    if (location.x + radius > width)
    {
      location.x = width - radius;
      velocity.x *= -1;
    }
    else if (location.x - radius < 0)
    {
      location.x = 0 + radius;
      velocity.x *= -1;
    }

    if (location.y + radius > height)
    {
      location.y = height - radius;
      velocity.y *= -1;
    }
    else if (location.y - radius < 0)
    {
      velocity.y *= -1;
      location.y = 0 + radius;
    }
  }


  boolean isInside(Force f)
  {
    return ((location.x > f.x) && (location.x < f.x + f.w) && (location.y > f.y) && (location.y < f.y + f.h));
  }

  void applyFriction(PVector force, float magnitude)
  {
    PVector f = force.get();
    f.mult(-1);
    f.normalize();
    f.mult(frictionMagnitude);
  }

  void applyFriction(Force force, float magnitude)
  {
    PVector f = force.get(); // this doesn't work - there's no PVector member variable
    // of any of the classes in the hierarchy
    f.mult(-1);
    f.normalize();
    f.mult(frictionMagnitude);
  }
  
  void applyDragForce(Force f)
  {
    float speed = velocity.mag();
    // The force’s magnitude: Cd * v~2~
    float dragMagnitude = f.c * speed * speed;
  
    PVector drag = velocity.get();
    drag.mult(-1);
    // The force's direction: -1 * velocity
    drag.normalize();
  
    // Finalize the force: magnitude and direction together.
    drag.mult(dragMagnitude);
  
    // Apply the force.
    applyForce(drag);
  }
}
