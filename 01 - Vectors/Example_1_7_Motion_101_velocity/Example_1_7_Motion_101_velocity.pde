

// Declare Mover object.
Mover mover;

void setup() {
  size(640,360);
  // Create Mover object.
  mover = new Mover(16);
}

void draw() {
  background(255);

  //[full] Call functions on Mover object.
  mover.update();
  //mover.checkEdges();
  mover.display();
  //[end]
}

class Mover {

  //[full] Our object has two PVectors: location and velocity.
  PVector location;
  PVector velocity;
  PVector acceleration;
  int diameter;
  int radius;
  //[end]

  Mover(int radius) {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
    acceleration = new PVector(1, 1);
    this.radius = radius;
    diameter = radius * 2;
    
  }

  void update() {
    // Motion 101: Location changes by velocity.
    location.add(velocity);
    checkEdges();
    velocity.add(acceleration);
    velocity.limit(10);
    println(velocity);
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, diameter, diameter);
  }

  void checkEdges() {
    if ((location.x - radius) > width) {
      location.x = 0 - radius;
    } else if ((location.x + radius) < 0) {
      location.x = width + radius;
    }

    if ((location.y - radius) > height) {
      location.y = 0 - radius;
    } else if ((location.y + radius) < 0) {
      location.y = height + radius;
    }
  }
}
