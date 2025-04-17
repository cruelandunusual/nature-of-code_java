float[] distribution = new float[360];

void setup() {
  size(640, 640);
  for (int i = 0; i < distribution.length; i++) {
    distribution[i] = int(randomGaussian() * 400); // 15 is the standard deviation
  }

}

void draw() {
  background(204);
  
  translate(width/2, height/2);

  for (int i = 0; i < distribution.length; i++) {
    rotate(TWO_PI/distribution.length);
    stroke(0);
    float dist = abs(distribution[i]);
    ellipse(width/2, dist, 16, 16);
    line(0, 0, dist, 0);
  }
}
