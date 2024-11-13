class Food {
  float[] foodPos;

  Food(float foodX, float foodY) {
    foodPos = new float[2];
    init(foodX, foodY);
  }

  void init(float foodX, float foodY) {
    foodPos[0] = foodX;
    foodPos[1] = foodY;
  }

  void update(float[] gravity) {
    if (foodPos[1] <= height * .9) { // 화면 높이 10% 지점에서 멈춤
      for (int idx = 0; idx < 2; idx++) {
        foodPos[idx] += gravity[idx] * random(1, 3);
      }
    }
  }

  boolean eaten(float[] fishPos) {
    float eatDist = dist(foodPos[0], foodPos[1], fishPos[0], fishPos[1]);
    return eatDist < foodRad + fishRad;
  }
  
  void display() {
    push();
    translate(foodPos[0], foodPos[1]);
    noStroke();
    fill(150, 100, 55);
    circle(0, 0, 2 * foodRad);
    pop();
  }
}
