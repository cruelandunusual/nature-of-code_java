

class Mover
{

  PVector location;
  PVector velocity;
  PVector acceleration;
  // The object now has mass!
  float mass;
  float massMultiplier;
  float diameter, radius;
  float x, y;
  float G;

  PVector _debug;
  
  Mover(float _m, float _x, float _y)
  {
    // And for now, we’ll just set the mass equal to 1 for simplicity.
    mass = _m;
    x = _x;
    y = _y;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    _debug = new PVector(0,0);
    G = 0.01;
    massMultiplier = 16;
    diameter = mass * massMultiplier;
    radius = diameter / 2;
  }

  // Newton’s second law.
  void applyForce(PVector force)
  {
    // Receive a force, divide by mass, and add to acceleration.
    _debug = force.copy();
    PVector f = PVector.div(force,mass);
    acceleration.add(f);

  }

  void update()
  {
    // Motion 101 from Chapter 1
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display(float alpha)
  {
    noStroke();
    //fill(0,100, 225, alpha); // not using alpha while debugging
    fill(0,100, 225);
    // Scaling the size according to mass.
    ellipse(location.x,location.y,diameter, diameter);
    fill(0);
    textAlign(LEFT);
    text(_debug.mag(), 5, 12);
    //println(_debug.mag());
    text(velocity.mag(), 5, 24);
    //text(_debug.mag(), location.x, location.y + textAscent()/2);
    checkEdges();
  }

  PVector attract(Attractor a)
  {

    PVector force = PVector.sub(location, a.location); //get the vector difference between two points
    float distance = force.mag(); //get the scalar distance between the two points (the magnitude of the vector)

    distance = constrain(distance,5.0,25.0); //constrain the distance, partly to avoid division by zero
    //but also because extreme values look odd in a processing sketch
    
    force.normalize(); //normalize the vector difference between the two points;
    //now it's just a direction unit vector

    float strength = (G * mass * a.mass) / (distance * distance); //compute strength of the attraction as a scalar
    force.mult(strength * 1); //multiply the unit vector by the calculated scalar to give the force as a vector
    return force;
  }


  PVector attract(Mover m)
  {

    PVector force = PVector.sub(location, m.location); //get the vector difference between two points
    float distance = force.mag(); //get the scalar distance between the two points (the magnitude of the vector)

    distance = constrain(distance,5.0,25.0); //constrain the distance, partly to avoid division by zero
    //but also because extreme values look odd in a processing sketch
    
    force.normalize(); //normalize the vector difference between the two points;
    //now it's just a direction unit vector

    float strength = (G * mass * m.mass) / (distance * distance); //compute strength of the attraction as a scalar
    force.mult(strength * 0.1); //multiply the unit vector by the calculated scalar to give the force as a vector
    return force;
  }

  Mover deepCopy()
  {
    Mover m = new Mover(mass, location.x, location.y);
    m.mass = mass;
    m.massMultiplier = massMultiplier;
    m.diameter = diameter;
    m.radius = radius;
    //float x, y;
    m.G = G;
    // m.location = new PVector(location.x, location.y);
    // m.velocity = new PVector(velocity.x, velocity.y);
    // m.acceleration = new PVector(acceleration.x, acceleration.y);
    m.location = location.copy();
    m.velocity = velocity.copy();
    m.acceleration = acceleration.copy();

    return m;
  }


  float getLocationX()
  {
    return location.x;
  }

  float getLocationY()
  {
    return location.y;
  }

  float getMass()
  {
    return mass;
  }


  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
  void checkEdges()
  {
    if (location.x > width - radius)
    {
      location.x = width - radius;
      velocity.x *= -1;
    }
    else if (location.x < 0 + radius)
    {
      location.x = 0 + radius;
      velocity.x *= -1;
    }

    if (location.y > height - radius)
    {
      location.y = height - radius;
      velocity.y *= -1;
    }
    else if (location.y < 0 + radius)
    {
      location.y = 0 + radius;
      velocity.y *= -1;
    }
  }
}
