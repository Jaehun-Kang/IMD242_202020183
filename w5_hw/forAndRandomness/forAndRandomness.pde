int tileNum;
int randomSeed = 0;
float noiseMult;
int maxTile = 16;

void setup() {
  size(800, 800);
  rectMode(CENTER);
}

void draw() {
  noiseSeed(randomSeed);
  randomSeed(randomSeed);
  background(0);

  tileNum = int(map(mouseX, 0, width, 3, maxTile + 1));
  noiseMult = pow(10, map(mouseY, 0, height, -2.5, -4));

  float tileSize = width / float(tileNum);

  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;
      float lineMove = frameCount * noiseMult * noiseMult * 3000;
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult, lineMove);
      
      fill(0);
      stroke(255);
      strokeWeight(1);
      fill(0);
      circle(centerX, centerY, tileSize);

      pushMatrix();
      translate(centerX, centerY);
      rotate(radians(360 * noiseVal));
      stroke(255, 0, 0);
      strokeWeight(2);
      line(0, 0, -tileSize * 0.85 * 0.5, 0);
      fill(255, 0, 0);
      rect(-tileSize * 0.85 * 0.5, 0, tileSize * 0.15 * 0.5 * 1.21, tileSize * 0.15 * 2.35);
      arc(0, 0, tileSize, tileSize, PI + radians(-18), PI + radians(18), CHORD);
      popMatrix();
    }
  }
}
