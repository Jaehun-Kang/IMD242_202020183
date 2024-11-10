class Food {
  float[] pos;
  float r; //반지름

  Food(float foodX, float foodY, float r) {
    pos = new float[2];
    init(foodX, foodY, r);
  }

  void init(float foodX, float foodY, float r) {
    pos[0] = foodX;
    pos[1] = foodY;
    this.r = r;
  }

  void update(float[] gravity) {
    if (pos[1] <= height * .9) { // 화면 높이 10% 지점에서 멈춤
      for (int idx = 0; idx < 2; idx++) {
        pos[idx] += gravity[idx] * random(1, 3);
      }
    }
  }

  void display() {
    push();
    translate(pos[0], pos[1]);
    noStroke();
    fill(150, 100, 55);
    circle(0, 0, 2 * r);
    pop();
  }
}
