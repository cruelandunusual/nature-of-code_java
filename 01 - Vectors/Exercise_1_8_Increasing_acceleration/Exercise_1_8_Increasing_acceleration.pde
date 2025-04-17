//

Walker walker;

void setup()
{
  size(1920, 1080);
  walker = new Walker();
}

void draw() {
  background(255);

  // Call functions on Mover object.
  walker.update();
  walker.display();

}

