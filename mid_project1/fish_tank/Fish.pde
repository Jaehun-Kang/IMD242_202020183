class Fish {
  float[] fishPos;
  float[] vel;
  float deg;
  float range = 100;
  float headSize;

  Fish(float fishX, float fishY, float deg, float headSize) {
    fishPos = new float[2];
    vel = new float[2];
    deg = int (random(1, 360));
    init(fishX, fishY, deg, headSize);
  }

  void init(float fishX, float fishY, float deg, float fishRad) {
    fishPos[0] = fishX;
    fishPos[1] = fishY;
    this.deg = deg;
    headSize = fishRad * 2;
  }

  void foodFound(float[] foodPos) {
    float foodRadar = range + foodRad;
    float distX = this.fishPos[0] - foodPos[0];
    float distY = this.fishPos[1] - foodPos[1];
    float foodDist = atan2(distX, distY); // 피타고라스 정의
    float[] foodCoord = {foodPos[0], foodPos[1]};

    for (int idx = 0; idx < foods.size(); idx++) {
      if (foodDist < foodRadar) { // 사정거리 안쪽인 것만
        float foodNear = foodDist;
        if (foodNear > foodDist) {
          foodNear = idx;// 가장 가까운 먹이 추적
        }
      }
    }
  }

  void fishRandomDash() {
    for (int idx = 0; idx < 2; idx++) {
      vel[idx] = dashSpeed[idx];
      fishPos[0] = fishPos[0] + cos(radians(this.deg)) * vel[idx];
      fishPos[1] = fishPos[1] + sin(radians(this.deg)) * vel[idx];
      vel[idx] *= 0.1; // 이것 고치기
    }
  }

  void setTarget(float foodX, float foodY) {
    for (int idx = 0; idx < 2; idx++) {
      //pos[idx] =
    }
  }

  void display() {
    push();
    translate(fishPos[0], fishPos[1]);
    noStroke();
    fill(50, 255, 50);
    circle(0, 0, headSize);
    pop();
  }
}
