


class Projectile
{


  PVector position;
  PVector velocity;
  PVector acceleration;  
  float x, y;
  float projLength;
  float projHeight;
  

  Projectile(float _x, float _y, float _l, float _h)
  {
    //position = new PVector(_x, _y);
    position = new PVector(0, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    projLength = _l;
    projHeight = _h;
  }


  void display(float x, float y)
  {
    stroke(0);
    position.add(x, y);
    pushMatrix();
    translate(x,y);//getPosition().x, getPosition().y);
    float a = atan2(mouseY - getPosition().y, mouseX - getPosition().x);
    rotate(a);
    rect(0, 0, projLength, projHeight);
    popMatrix();
    noStroke();
    
  }

  PVector getPosition()
  {
    return position;
  }

  PVector getDimensions()
  {
    return new PVector(projLength, projHeight);
  }

  void fire()
  {
    applyForce(new PVector(100, 0));
  }
     

  void applyForce(PVector force)
  {
  // Newton’s second law, but with force accumulation.
  // We now add each force to acceleration, one at a time.
    acceleration.add(force);
  }

  
  void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
 }
  

  boolean firing()
  {
    boolean where = 
    ((position.x > 0 && position.x < width)
            || (position.y > 0 && position.y < height));
    print(where);
    return where;
  }
  
}
