void setup() {
  size(800, 800);
  background(0);
  frameRate(60);
  circle(width * .5, height * .5, width * .8);

  for (int stepMin = 0; stepMin < 60; stepMin++) {
    pushMatrix();
    translate(width * .5, height * .5);
    rotate(TWO_PI / 60 * stepMin);

    if (stepMin == 0 || stepMin % 5 == 0) {
      strokeWeight(3);
      line(width * .4 * .9, 0, width * .4, 0);
    } else {
      strokeWeight(1);
      line(width * .4 * .97, 0, width * .4, 0);
    }
    popMatrix();
  }
}

void draw() {
  int h = hour();
  int m = minute();
  int s = second();

  println(frameCount);
  float hDeg = (h % 12) * 360 / 12 + m * .5 + s * .5 / 60;
  float mDeg = m * 6 + s * .1;
  float sDeg = s * 6;

  noStroke();
  circle(width * .5, height * .5, width * .8 * .9);

  println(h, m, s);
  pushMatrix();
  stroke(0);
  translate(width * .5, height * .5);

  pushMatrix(); //hour
  strokeWeight(8);
  rotate(-HALF_PI + radians(hDeg));
  line(0, 0, width * .4 * .55, 0);
  popMatrix();

  pushMatrix(); //min
  strokeWeight(7);
  rotate(-HALF_PI + radians(mDeg));
  line(0, 0, width * .4 * .75, 0);
  popMatrix();

  pushMatrix(); //sec
  stroke(255, 0, 0);
  strokeWeight(3);
  rotate(-HALF_PI + radians(sDeg));
  line(-25, 0, width * .4 * .8, 0);
  popMatrix();

  strokeWeight(4);
  circle(0, 0, 15);
  popMatrix();
}
