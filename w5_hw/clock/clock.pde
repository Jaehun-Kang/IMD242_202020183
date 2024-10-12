void setup() {
  size(800, 800);
}

void draw() {

  background(0);

  circle(width * 0.5, height * 0.5, width * 0.8);

  pushMatrix();
  
  for (int stepMin = 0; stepMin < 60; stepMin++) {
    line();
  }
  popMatrix();
}
