

Mover[] movers = new Mover[20];
PVector wind;
PVector gravity;

void setup()
{
  size(1280,720);
  for (int i = 0; i < movers.length; i++)
  {
    movers[i] = new Mover(random(0.1,5), 0, 0);
  }
  wind = new PVector(0.001, 0);
}


void draw()
{
  background(255);

  for (int i = 0; i < movers.length; i++)
  {
    float m = movers[i].mass;
    // Scaling gravity by mass to be more accurate
    gravity = new PVector(0,0.1*m);

    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
  }
  
}  



  // Make up two forces
  // PVector wind = new PVector(0.01,0);
  // PVector gravity = new PVector(0,0.01);

  // // Loop through all objects and apply both forces to each object.
  // for (int i = 0; i < movers.length; i++)
  // {
  //   movers[i].applyForce(wind);
  //   movers[i].applyForce(gravity);
  
  //   movers[i].update();
  //   movers[i].display();

  // }






