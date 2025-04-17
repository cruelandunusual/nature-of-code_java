

Mover[] movers = new Mover[20];

void setup() {
  size(640,360);
  background(255);
  for (int i = 0; i < movers.length; i++) {
    // Initialize each object in the array.
    movers[i] = new Mover();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    //[full] Calling functions on all the objects in the array
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
    //[end]
  }
}

