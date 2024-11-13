class Food {
  float[] pos;
  float rad; //반지름

  Food(float foodX, float foodY, float rad) {
    pos = new float[2];
    init(foodX, foodY, rad);
  }

  void init(float foodX, float foodY, float rad) {
    pos[0] = foodX;
    pos[1] = foodY;
    this.rad = rad;
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
    circle(0, 0, 2 * rad);
    pop();
  }
}
