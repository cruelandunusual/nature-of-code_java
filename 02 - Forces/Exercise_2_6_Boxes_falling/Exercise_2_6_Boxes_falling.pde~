

/*
friction = -1 * friction coefficient * Normal force * velocity unit vector
 */

Mover[] movers = new Mover[10];
PVector wind;
PVector gravity;
PVector friction;

float frictionCoefficient;
float normalForce;
float frictionMagnitude;

Liquid liquid;

void setup()
{

  size(480, 960);
  // Note the liquid coefficient is low (0.1),
  // otherwise the object would come to a halt fairly quickly.
  liquid = new Liquid(0, (height/3 * 2), width, height/3, 0.1);
  init();  
  
}

void init()
{

  int spacer = 16;
  for (int i = 0; i < movers.length; i++)
  {
    // movers[i] = new Mover(random(0.9,8), i+spacer, 0);
    movers[i] = new Mover(0.9, i+spacer, i+spacer);
    spacer += (width-16) / movers.length;
  }

  frictionCoefficient = 0.07;
  normalForce = 1;
  frictionMagnitude = frictionCoefficient * normalForce;
  
}

void begin()
{

  for (int i = 0; i < movers.length; i++)
  {
    // fluid resistance
    if (movers[i].isInside(liquid))
    {
      movers[i].drag(liquid);
    }

    // friction
    friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    movers[i].applyForce(friction);

    //gravity
    float m = 0.1;
    gravity = new PVector(0, m * movers[i].mass); // Scaling gravity by mass to be more accurate
    movers[i].applyForce(gravity);
   
    movers[i].update();
    movers[i].display();
  }
  
}

void draw()
{

  background(255);
  liquid.display();
  begin();  
}  


void mouseClicked()
{
  init();
  begin();
}




