

Mover m1, m2;
PVector wind, gravity;

void setup()
{
  
  size(640,360);
  background(255);
  m1 = new Mover();
  m2 = new Mover();

  wind = new PVector(0.01,0);
  gravity = new PVector(0,0.1);

    
}

void draw()
{

  background(255);
  m1.update();
  m2.update();
  m1.display();
  m2.display();
  m1.applyForce(gravity);
  m2.applyForce(gravity);
  
  if (mousePressed)
  {
    m1.applyForce(wind);
    m2.applyForce(wind);
   }

  

}



// m1.applyForce(wind);
//   m1.applyForce(gravity);
// m2.applyForce(wind);
//   m2.applyForce(gravity);





