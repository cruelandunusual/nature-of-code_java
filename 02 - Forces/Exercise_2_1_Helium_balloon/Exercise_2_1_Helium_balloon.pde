

Balloon balloon;
PVector crosswind, downwind;
PVector helium;

float tx, ty;


void setup()
{
  size(640,360);
  background(255);
  balloon = new Balloon();
  helium = new PVector(0, -0.1);
  tx = 0;
  ty = 10000;
}

void draw()
{
  
  background(255);
  balloon.update();
  balloon.display();
  balloon.applyForce(helium);

  crosswind = new PVector(map(noise(tx), 0, 1, -0.04, 0.04), 0);
  downwind = new PVector(0, map(noise(ty), 0, 1, 0, 0.08));

  balloon.applyForce(crosswind);
  balloon.applyForce(downwind);

  //move forward through 'time'
  tx += 0.01;
  ty += 0.05;
  
}

