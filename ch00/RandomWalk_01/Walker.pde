class Walker {
  float posX;
  float posY;
  
  Walker() {
    posX = width/2;
    posY = height/2;
  }

  void display() {
    stroke(0);
    point(posX,posY);
  }
  
  void step() {
    //int stepX = int(random(3))-1; //yields -1, 0 or 1
    //int stepY = int(random(3))-1;
    float stepX = random(-3, 3); //yields and floating point number between -1.0 and 1.0
    float stepY = random(-3, 3);
    if((posX <= width) || (posX >= 0)) {
      /* only update the step if the walker is inside screen bounds.
         However, the walker can still take a step outside screen bounds if
         it is e.g. 2 pixels from the left edge and the next step is -3 pixels.
         Once it is outside it will never come back.
      */
      posX += stepX;  
    }
    if((posY <= height) || (posY >= 0)) {
      posY += stepY;  
    }
  }
}
