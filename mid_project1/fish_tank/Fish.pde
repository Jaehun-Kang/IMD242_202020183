class Fish {
  float[] pos;
  float[] vel;
  float deg;
  float range = 100;

  Fish(float fishX, float fishY, float deg) {
    pos = new float[2];
    vel = new float[2];
    deg = int (random(1, 360));
    init(fishX, fishY, deg);
  }

  void init(float fishX, float fishY, float deg) {
    pos[0] = fishX;
    pos[1] = fishY;
    this.deg = deg;
  }

  void foodFound() {
    float foodRadar = range + foods.rad;
    float distX = this.pos[0] - food.pos[0];
    float distY = this.pos[1] - food.pos[1];
    float foodDist = sqrt(distX^2 + distY^2); // 피타고라스 정의

    for (int idx = 0; idx < foods.size(); idx++) {
      if (foodDist < foodRadar)
    }
  }

  void fishRandomMove() {
    for (int idx = 0; idx < 2; idx++) {
      vel[idx] =
    }
  }

  void setTarget(float foodX, float foodY) {
    for (int idx = 0; idx < 2; idx++) {
      pos[idx] =
    }
  }

  void display() {
    push();
    translate(pos[0], pos[1]);
    noStroke();
    fill(50, 255, 50);
    circle(0, 0, 20);
    pop();
  }
}
