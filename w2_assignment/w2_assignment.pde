void setup() {
  size(640, 640);
  colorMode(HSB, 360, 100, 100);
  background(10, 40, 60);
  fill(10, 40, 50);
  noStroke();
  ellipse(320, 440, 210, 50);
}

void draw() {
  colorMode(HSB, 360, 100, 100);

  //face
  stroke(0);
  fill(5, 20, 90);
  strokeWeight(12);
  circle(320, 300, 270);
  
  noStroke();
  fill(5, 15, 95);
  ellipse(320, 305, 260, 250);

  //tears
  noStroke();
  fill(190, 20, 90);
  arc(320, 350, 200, 172, 0 - QUARTER_PI * 0.5, PI + QUARTER_PI * 0.5);
  
  stroke(5, 15, 95);
  fill(5, 15, 95);
  ellipse(320, 360, 140, 151);
  
  stroke(0);
  noFill();
  strokeWeight(12);
  circle(320, 300, 270);

  //eyes
  fill(0);
  stroke(5, 20, 90);
  strokeWeight(4);
  circle(320 - 70 + mouseX / 64 - 5, 305 + mouseY / 64 - 5, 70);
  circle(320 + 70 + mouseX / 64 - 5, 305 + mouseY / 64 - 5, 70);

  //eyelight
  fill(360);
  strokeWeight(0);
  circle(320 - 70 + mouseX / 60 - 13, 305 + mouseY / 60 - 13, 28);
  circle(320 + 70 + mouseX / 60 - 13, 305 + mouseY / 60 - 13, 28);

  //mouth
  fill(0);
  arc(320, 350, 68, 75, PI, TWO_PI, CHORD);
  fill(360);
  arc(320, 350, 53, 60, PI + (QUARTER_PI * 0.4), TWO_PI - (QUARTER_PI * 0.4), CHORD);
  fill(0);
  arc(320, 350, 54, 61, PI + QUARTER_PI, TWO_PI - QUARTER_PI, CHORD);
}


void mousePressed() {
  noLoop();

  //erase eyes
  fill(5, 20, 90);
  stroke(5, 20, 90);
  strokeWeight(4);
  circle(320 - 70 + mouseX / 64 - 5, 305 + mouseY / 64 - 5, 71);
  circle(320 + 70 + mouseX / 64 - 5, 305 + mouseY / 64 - 5, 71);

  //draw eyes
  noFill();
  stroke(0);
  strokeCap(SQUARE);
  strokeWeight(12);
  arc(320 - 70 + mouseX / 64 - 5, 305 + mouseY / 64 - 5, 55, 55, 0, PI, LINE);
  arc(320 + 70 + mouseX / 64 - 5, 305 + mouseY / 64 - 5, 55, 55, 0, PI, LINE);
  
  fill(5, 15, 95);
  stroke(5, 15, 95);
  strokeWeight(4);
  circle(320 - 70 + mouseX / 64 - 5, 305 + mouseY / 64 - 5 - 20, 80);
  circle(320 + 70 + mouseX / 64 - 5, 305 + mouseY / 64 - 5 - 20, 80);
}

void mouseReleased() {
  loop();
}
