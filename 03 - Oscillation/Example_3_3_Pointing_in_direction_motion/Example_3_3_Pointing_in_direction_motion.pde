

void setup()
{
  size(1280, 720);
}

void display() {
    // Using atan2() to account for all possible directions
    float angle = atan2(velocity.y,velocity.x);

    stroke(0);
    fill(175);
    pushMatrix();
    rectMode(CENTER);
    translate(location.x,location.y);
    // Rotate according to that angle.
    rotate(angle);
    rect(0,0,30,10);
    popMatrix();
  }
