

/*
friction = -1 * friction coefficient * Normal force * velocity unit vector
 */

Mover[] movers = new Mover[50];
PVector wind;
PVector gravity;
PVector friction;
float c; //coefficient
float N; //Normal force
float frictionMagnitude;

void setup()
{
  size(960,360);
  for (int i = 0; i < movers.length; i++)
  {
    movers[i] = new Mover(random(0.1,5), 0, 0);
  }
  wind = new PVector(0.01, 0);
  c = 0.07;
  N = 1;
  frictionMagnitude = c*N;
  
}


void draw()
{
  background(255);

  for (int i = 0; i < movers.length; i++)
  {

    friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    
    float m = movers[i].mass;
    // Scaling gravity by mass to be more accurate
    gravity = new PVector(0,0.5*m);
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
  }
  
}  







