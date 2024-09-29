int deg;
float turn;
float x, y;
float h, s, b;
float subX, subY, waypointDeg;

void setup() {
  size(960, 640);
  background(0);
  noStroke();
  x = width / 2;
  y = height / 2;
  deg = int(random(1, 360));
  deg = deg - deg%5;
  colorMode(HSB, 360, 100, 100, 100);
  s = 70;
  b = 95;
}

void draw() {
  turn = random(-1, 1);
  setDegree();

  h = random(deg - 5, deg + 5);
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);

  fill(h, s, b);

  if (mousePressed == true) {
    subX = x - mouseX;
    subY = y - mouseY;
    waypointDeg = degrees(atan2(subY, subX)) - 180;
    deg = int(waypointDeg);

    if (mouseX <= 0) {
      mouseX = 0;
    }
    if (mouseX >= width) {
      mouseX = width;
    }
    if (mouseY <= 0) {
      mouseY = 0;
    }
    if (mouseY >= height) {
      mouseY = height;
    }
  }
    moveCirc();
  circle(x, y, 10);
  

}

void setDegree() {
  if (turn <= 0) {
    deg -= 5;
  } else if (turn >= 0) {
    deg += 5;
  }

  if (deg < 0) {
    deg += 360;
  }
  if (deg > 360) {
    deg -= 360;
  }
}

void moveCirc() {
  float addX = cos(radians(deg)) * 4;
  float addY = sin(radians(deg)) * 4;

  x = x + addX;
  y = y + addY;

  if (x < 0) {
    deg = 360 - deg + 180;
    x = 0;
  }
  if (x > width) {
    deg = 360 - deg + 180;
    x = width;
  }
  if (y < 0) {
    deg = 360 - deg;
    y = 0;
  }
  if (y > height) {
    deg = 360 - deg;
    y = height;
  }
}
