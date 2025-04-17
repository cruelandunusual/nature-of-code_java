

Mover mv1, mv2;

void setup()
{
  size(640, 360);
  mv1 = new Mover(16);
  mv2 = new Mover(20);
}

void draw() {
  background(255);

  // Call functions on Mover object.
  mv1.update();
  mv1.display();
  mv2.update();
  mv2.display();

}
