

class Liquid
{

  float x,y,w,h;
  float dragCoefficient;

  Liquid(float x_, float y_, float w_, float h_, float dc_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    dragCoefficient = dc_;
  }

  void display() {
    noStroke();
    fill(175);
    rect(x,y,w,h);
  }

}
