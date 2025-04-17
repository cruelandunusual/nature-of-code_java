

Cannon cannon;
Projectile proj;
PVector gravity;

float pLen;
float pWid;
float pMass;

void setup()
{
  size(1280,720,P3D);
  background(255);
  cannon = new Cannon(30,700, 100);
  pLen = 20.0;
  pWid = 20.0;
  pMass = 2.0;
  proj = new Projectile(cannon.getPosition().x, cannon.getPosition().y, pLen, pWid, pMass);

  float m = proj.mass;
  // Scaling gravity by mass to be more accurate
  gravity = new PVector(0, 0.06*m);
  
}


void draw()
{

  background(255);
  cannon.display();

  if (proj.isShooting() && proj.isInsideWorld())
  {
    proj.applyForce(gravity);
  }
  if (proj.isShooting() && ! proj.isInsideWorld())
  {
    proj.reset(cannon.getPosition().x, cannon.getPosition().y, 20.0, 20.0, 2.0);
  }
  proj.update();
  proj.display();
  
}


void mouseClicked()
{

  if (! proj.isShooting())
  {
    proj.fire();    
  }

}
