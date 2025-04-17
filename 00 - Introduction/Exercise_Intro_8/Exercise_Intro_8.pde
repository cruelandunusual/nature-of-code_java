

float xoff, yoff;
float zoff;
float xloc = 0.0;
float yloc = 0.0;
float dx = 0.0;
float dy = 1000.0;
float sinIncr;

void setup()
{
  
  size(640, 360);
  background(255);
  zoff = 500.0;
  sinIncr = 0.0;  
}

void draw()
{

  loadPixels();
  xoff = 0.0 + xloc; // xoffset initialised outside loops
  for (int x = 0; x < width; x++) {
    yoff = 1000.0 + yloc; // yoffset initialised inside outer loop
    for (int y = 0; y < height; y++) {
      //noiseDetail(3, 0.75);
      // calculate noise with three parameters, map result to 0-255 for grayscale pixel brightness 
      float bright = map(noise(xoff,yoff,zoff), 0, 1, 0, 255);
      pixels[x+y*width] = color(bright); // set current brightness to current pixel
      yoff += 0.01; // smaller increments mean foggier-looking noise - a softer effect
    }
    xoff += 0.01; // ditto for smaller xoff increments
  }
  zoff += 0.1; // increment zoffset outside of both loops to animate noise
  updatePixels();
  //noiseDetail(4, 0.021);
  xloc = map(noise(dx), 0, 1, 0, width/2);
  yloc = map(noise(dy), 0, 1, 0, height/2);
  dx += 0.0001; // smaller increments mean noise moves along x-y plane slower
  dy += 0.0001;

}
