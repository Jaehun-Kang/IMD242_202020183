int randomSeed = int(random(1234567));
int houseCnt;
int houseAmt = int(random(5, 20));

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
}

void draw() {
  randomSeed(randomSeed);
  background(215, 25, 90);
  fill(100, 30, 70);
  noStroke();
  circle(width * .5, height * 2.5, height * 4);

  for (houseCnt = 0; houseCnt < houseAmt; houseCnt++) {
    house();
  }
}

void mousePressed() {
  randomSeed = int(random(1234567));
}

void house() {
  float houseYAdd = 350 / houseAmt;
  float houseW = random(70, 120);
  float houseH = random(120, 120 + houseYAdd);
  float houseA = random(-15, 15);

  pushMatrix();
  translate(width * .5, height * 2.5);
  rotate(radians(-90 + houseA));

  pushMatrix();
  translate(height * 1.95, 0);

  float houseCH = random(360);
  float houseCS = random(30, 40);
  float houseCB = random(80, 90);
  float houseCenterY = -houseYAdd * houseCnt;
  fill(houseCH, houseCS, houseCB);
  rect(houseCenterY, 0, houseH, houseW); //hosue

  fill(200, 0, 100); // white
  rect(houseCenterY - houseH * .5 + 15, 0, 30, 18);
  fill(200, 35, 80); //door
  rect(houseCenterY - houseH * .5 + 14, 0, 29, 16);
  fill(25, 65, 70); //doorhandle
  circle(houseCenterY - houseH * .5 + 14, -5.5, 3);

  for (int n = 0; n < 2; n++) {
    if (n == 0) {
      fill(0, 0, 100);
      rect(houseCenterY - houseH * .25, -houseW * .25 - 4.5, 17, 17);
      rect(houseCenterY + 12, houseW * .25, 26, 17);
      stroke(0, 0, 100);
      line(houseCenterY - 1, 0, houseCenterY - 1, houseW * .5);
      noStroke();
    } else {
      fill(200, 35, 40);
      rect(houseCenterY - houseH * .25, -houseW * .25, 15, 6); // window
      rect(houseCenterY - houseH * .25, -houseW * .25 - 9, 15, 6);
      rect(houseCenterY + 12, houseW * .25, 24, 15); // terrace door
      fill(25, 65, 80);
    }
    beginShape(); // roof
    vertex(houseCenterY + houseH * .5 + n, -(houseW * .5 + 1));
    vertex(houseCenterY + houseH * .5 + n, houseW * .5 + 1);
    vertex(houseCenterY + houseH * .5 - 24 + n, houseW * .56);
    vertex(houseCenterY + houseH * .5 - 24 + n, -(houseW * .56));
    endShape(CLOSE);
    beginShape(); // semiroof
    vertex(houseCenterY - 1 + n, -(houseW * .5 + 1));
    vertex(houseCenterY - 1 + n, 0);
    vertex(houseCenterY - 14 + n, 0);
    vertex(houseCenterY - 14 + n, -(houseW * .54));
    endShape(CLOSE);
  }
  popMatrix();
  popMatrix();
}
