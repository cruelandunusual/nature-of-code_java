

class Baton
{

  float diameter;
  float radius;
  float handleLength;
  float x, y;

  Baton(float _diameter, float _handleLength)
  {

    diameter = _diameter;
    radius = diameter / 2;
    handleLength = _handleLength;

  }

  void display()
  {
    noStroke();    
    pushMatrix();
    translate(-radius-handleLength/2, 0);
    fill(100, 20, 0, 100);
    ellipse(0, 0, diameter, diameter);

    translate(radius, 0);
    stroke(0);
    line(0, 0, handleLength, 0);    
    noStroke();

    translate(handleLength+radius,0);
    fill(0, 0, 100, 100);
    ellipse(0, 0, diameter, diameter);
    popMatrix();
  }


  float getBatonLength()
  {
    return (diameter*2)+handleLength;
  }

  float getRadius()
  {
    return radius;
  }

  float getDiameter()
  {
    return diameter;
  }

  float getHandleLength()
  {
    return handleLength;
  }

}
