

Cannon cannon;

boolean fireMe;

void setup()
{
  size(1280,720);
  background(255);
  cannon = new Cannon(30,700, 100);
  fireMe = true;
}

void draw()
{
  background(255);
  cannon.display();
  
}

void mouseClicked()
{
  //if (! cannon.firing())
  if(fireMe)
  {
    cannon.fire();
    print("cannon fired");
  }
}
