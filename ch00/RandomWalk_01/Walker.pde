class Walker {
  int posX;
  int posY;
  
  Walker() {
    posX = width/2;
    posY = height/2;
  }

  void display() {
    stroke(0);
    point(posX,posY);
  }
  
  void step() {
    int stepX = int(random(3));
    stepX -= 1;
    posX += stepX;
    int stepY = int(random(3));
    stepY -= 1;
    posY += stepY;
  }
}
