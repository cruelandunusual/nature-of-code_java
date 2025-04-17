

void setup()
{

  size(640,360);
  PVector A = new PVector(width/2, height/2);
  println("A magnitude: " + A.mag());

  PVector B = new PVector(5, 4);
  //A.add(B);
  println("B magnitude: " + B.mag());
  //println(A.mag());
  PVector C = B.sub(A);
  println("C magnitude: " + C.mag());

}
 
void draw()
{

  background(255);

  PVector mouse  = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);

  mouse.sub(center);
  //mouse.mult(0.5);
  mouse.div(2);

  fill(0);
  rect(0,0, mouse.mag(), 10);

  mouse.normalize();
  mouse.mult(10);
  translate(width/2,height/2);
  line(0,0,mouse.x,mouse.y);

}

