

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  // The object now has mass!
  float mass;

  Mover() {
    // And for now, we’ll just set the mass equal to 1 for simplicity.
    mass = 2;
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }

  // Newton’s second law.
  void applyForce(PVector force) {
    //[full] Receive a force, divide by mass, and add to acceleration.
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
    //[end]
  }

  void update() {
    //[full] Motion 101 from Chapter 1
    velocity.add(acceleration);
    location.add(velocity);
    //[end]
    // Now add clearing the acceleration each time!
    acceleration.mult(0);
    checkEdges();
  }

  void display() {
    stroke(0);
    fill(175);
    //[offset-down] Scaling the size according to mass.
    ellipse(location.x,location.y,mass*16,mass*16);
  }

  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      // Even though we said we shouldn't touch location and velocity directly, there are some exceptions.
      // Here we are doing so as a quick and easy way to reverse the direction of our object when it reaches the edge.
      velocity.y *= -1;
      location.y = height;
    }
  }
}
