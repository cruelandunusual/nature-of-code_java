

/*
friction = -1 * friction coefficient * Normal force * velocity unit vector
 */

Mover[] movers = new Mover[20];
PVector current;
PVector gravity;
PVector friction;
float c; //coefficient
float N; //Normal force
float frictionMagnitude;
Force liquid;
Force wind;
Force liquidCurrent;

void setup()
{
  
  size(960,480);
  // coefficient is low (0.1), otherwise the object would come to a halt fairly quickly
  liquid = new Force(0.0, (float)height/2, (float)width, (float) height/2, 0.1, 200.0);
  wind = new Force(0.0, 0.0, (float)width, (float)height/2, 0.1, 0.0);
  liquidCurrent = new Force(0.0, (float)height/2, (float)width, (float)height/2, 0.1, 0.0);
  int spacer = 16;
  for (int i = 0; i < movers.length; i++)
  {
    movers[i] = new Mover(random(0.9,8), i+spacer, 0);
    spacer += (width-16) / movers.length;
  }

  c = 0.07;
  N = 1;
  frictionMagnitude = c*N;
  
}


void draw()
{
  background(255);
  liquid.display();
  for (int i = 0; i < movers.length; i++)
  {

    // friction = movers[i].velocity.get();
    // friction.mult(-1);
    // friction.normalize();
    // friction.mult(frictionMagnitude);

    if (movers[i].isInside(liquid))
    {
      movers[i].applyDragForce(liquid);
    }
    if (movers[i].isInside(wind))
    {
      movers[i].applyFriction(wind, frictionMagnitude);
    }
    if (movers[i].isInside(liquidCurrent))
    {
      movers[i].applyFriction(liquidCurrent, frictionMagnitude);
    }
    
    // if (movers[i].isInside(gravity))
    // {
    //   movers[i].applyForce(gravity);
    // }
    // if (movers[i].isInside(friction))
    // {
    //   movers[i].applyForce(friction);
    // }
    
    float m = 0.1 * movers[i].mass;
    // Scaling gravity by mass to be more accurate
    gravity = new PVector(0, m);
    movers[i].applyForce(friction);

    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
  }
  
}  
