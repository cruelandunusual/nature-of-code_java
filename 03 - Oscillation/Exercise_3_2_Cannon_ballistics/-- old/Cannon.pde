

class Cannon
{

  float x, y;
  float barrelLength;
  float barrelHeight;

  PVector position;
  Projectile proj;


  Cannon(float _x, float _y, float _barrelLength)
  {
    x = _x;
    y = _y;
    barrelLength = _barrelLength;
    barrelHeight = 40;
    position = new PVector(x, y);
    proj = new Projectile(x, y, 20, 20);

  }

  void display()
  {
    stroke(0);
    pushMatrix();
    translate(x, y);
    float a = atan2(mouseY - getPosition().y, mouseX - getPosition().x);
    rotate(a);
    drawCannonBarrel(0, -barrelHeight/2, barrelLength, barrelHeight);
    popMatrix();
    noStroke();
    proj.display(getPosition().x, getPosition().y);
    proj.update();

  }

  float barrelLength()
  {
    return barrelLength;
  }

  PVector getPosition()
  {
    return position;
  }

  void drawCannonBarrel(float x, float y, float w, float h)
  {
    rect(x, y, w, h);
  }

  boolean firing()
  {
    return proj.firing();
  }

  void fire()
  {
    proj.fire();
  }
  
}
