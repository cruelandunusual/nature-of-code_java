

float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;


void setup() {
  size(640,360);
  background(255);
}


void draw() {
  background(255);

  // Move the ball according to its speed.
  x = x + xspeed;
  y = y + yspeed;
  

  // Check for bouncing.
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1; // multiply by -1 to reverse direction
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  

  stroke(0);
  fill(175);
  // Display the ball at the location (x,y).
  ellipse(x,y,16,16);
}
