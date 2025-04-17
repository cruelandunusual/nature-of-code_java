

/*
 * F = (G*m1*m2)/r*r * r[hat]
 *
 * PVector force = PVector.sub(obj1, obj2); //get the vector difference between two points
 * float distance = force.mag(); //get the scalar distance between the two points (the magnitude of the vector)
 * force.normalize(); //normalize the vector difference between the two points; now it's just a direction unit vector
 * float strength = (G * mass1 * mass2) / (distance * distance); //compute the strength of the attraction as a scalar
 * force.mult(strength); //multiply the unit vector by the calculated scalar to give the force as a vector
 *
 */


int planets = 5;
int trails = 50;
Mover[][] movers = new Mover[planets][trails];
Attractor sun;
PFont font;
int last;

void setup()
{

  //size(1280, 720);
  size(1280, 720, P3D);
  background(255);
  font = loadFont("Lato-Regular-12.vlw");
  textFont(font, 12);
  init();

}

void init()
{
  float _x = random(0, 1)*width;
  float _y = random(0, 1)*height;
  for (int i = 0; i < planets; i++)
  {
    for (int j = 0; j < trails; j++)
    {
      movers[i][j] = new Mover(i+6 * 1.3, _x, _y); // hardcoded to be large for now - was "i+1 * 1.3"
    }
    _x = random(0, i+2)*width;
    _y = random(0, i+2)*height;
  }
  
  sun = new Attractor();

}

void draw()
{

  background(255);
  drawLoop();

}

/*
 * The sun attracts everything.
 * Planets attract each other.
 * 
 */
// void drawLoop()
// {
//   sun.display();

//   //copy planets to create trails
//   for (int i = 0; i < planets; i++)
//   {
//     for (int j = 0; j < trails-1; j++)
//     {
//       movers[i][j] = movers[i][j+1].deepCopy();
//     }
//   }

//   //calculate planets' attraction to the sun
//   for (int i = 0; i < planets; i++)
//   {
//     PVector attractorForce = sun.attract(movers[i][trails-1]);
//     movers[i][trails-1].applyForce(attractorForce);
//     movers[i][trails-1].update();
//     attractorForce = movers[i][trails-1].attract(sun);
//     sun.applyForce(attractorForce);
//     sun.update();
//   }


//   //calculate planets' attraction to each other
//   for (int i = 0; i < planets; i++)
//   {
//     for (int j = 0; j < planets; j++)
//     {
//       if (movers[i][trails-1] != movers[j][trails-1])
//       {
//         PVector attractorForce = movers[i][trails-1].attract(movers[j][trails-1]);
//         movers[j][trails-1].applyForce(attractorForce);
//         movers[j][trails-1].update();  
//       }
//     }
//   }

//   //display the planets  
//   for (int i = 0; i < planets; i++)
//   {
//     for (int j = 0; j < trails; j++)
//     {
//       movers[i][j].display(j * 5.1);
//     }
//   }

// }



void mouseClicked()
{
  init();
  drawLoop();
}


/*
 * Only the sun is an attractor.
 */
void drawLoop()
{

  sun.display();

  for (int i = 0; i < planets; i++)
  {
    for (int j = 0; j < trails-1; j++)
    {
      movers[i][j] = movers[i][j+1].deepCopy();
    }
  }

  for (int i = 0; i < planets; i++)
  {
    PVector attractorForce = sun.attract(movers[i][trails-1]);
    movers[i][trails-1].applyForce(attractorForce);
    movers[i][trails-1].update();
    attractorForce = movers[i][trails-1].attract(sun);
    sun.applyForce(attractorForce);
    sun.update();
  }

  // for (int i = 0; i < planets; i++)
  // {
  //   for (int j = 0; j < trails; j++)
  //   {
  //     movers[i][j].display(j * 5.1);
  //   }
  // }
  for (int i = 0; i < planets; i++)
  {
    for (int j = trails-1; j >= 0; j--)
    {
      movers[i][j].display(j * 5.1);
    }
  }

  
}

