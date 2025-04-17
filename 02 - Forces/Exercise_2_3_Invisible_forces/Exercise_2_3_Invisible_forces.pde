

Mover[] movers = new Mover[20];

PVector gravity;
PVector wind;

PVector leftForce;
PVector rightForce;
PVector upForce;
PVector downForce;

int gravityCounter;
int UP = 1;
int DOWN = 2;
int LEFT = 3;
int RIGHT = 4;

void setup()
{
  size(1280,720);
  for (int i = 0; i < movers.length; i++)
  {
    movers[i] = new Mover(random(0.1,5), width/2, height/2);
  }

  // gravityCounter = 0;

  // changeGravity(int(random(1,5)));
  gravity = new PVector(0.0, 0.1);
  //wind = new PVector(0.01, 0);
  // leftForce = new PVector(0.1, 0);
  // rightForce = new PVector(-0.1, 0);
  // upForce = new PVector(0, -0.1);
  // downForce = new PVector(0, 0.1);
}


void draw()
{
  // gravityCounter++;
  background(255);
  // if (gravityCounter % 200 == 0)
  // {
  //   changeGravity(int(random(1,5)));
  // }
  // Loop through all objects and apply both forces to each object.
  for (int i = 0; i < movers.length; i++)
  {
  //   if (movers[i].getLocationX() < 100)
  //   {
  //     movers[i].applyForce(leftForce);
  //   }
  //   if (movers[i].getLocationX() > (width - 100))
  //   {
  //     movers[i].applyForce(rightForce);
  //   }
  //   if (movers[i].getLocationY() < 100)
  //   {
  //     movers[i].applyForce(downForce);
  //   }
  //   if (movers[i].getLocationY() > (height - 100))
  //   {
  //     movers[i].applyForce(upForce);
  //   }
    
    // movers[i].applyForce(rightForce);
    // movers[i].applyForce(upForce);
    movers[i].applyForce(new PVector((1-movers[i].getLocationX()) * 0.00001, (1-movers[i].getLocationY()) * 0.00001));
    // movers[i].applyForce(downForce);
    //movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
  
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

// void changeGravity(int dir)
// {
//   if (dir == 1) // UP
//   {
//     gravity = new PVector(0, -0.01);
//   }
//   else if (dir == 2) // DOWN
//   {
//     gravity = new PVector(0, 0.01);
//   }
//   else if (dir == 3) // LEFT
//   {
//     gravity = new PVector(-0.01, 0);
//   }
//   else if (dir == 4) // RIGHT
//   {
//     gravity = new PVector(0.01, 0);
//   }
  

  //can't remember why the following line is here...?
  //gravity = new PVector(random(-0.01, 0.02), random(-0.01, 0.02));

