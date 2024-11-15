class Food {
  float[] foodPos; // 먹이 좌표
  float bottomY; // 먹이가 가라앉는 지점
  
  Food(float foodX, float foodY) {
    foodPos = new float[2];
    bottomY = random(.9, .95); // 먹이가 가라앉는 지점 설정
    init(foodX, foodY);
  }

  void init(float foodX, float foodY) { // 초기화
    foodPos[0] = foodX;
    foodPos[1] = foodY;
  }

  void update(float[] gravity) {
    if (foodPos[1] <= height * bottomY) { // 화면 높이 10% 지점에서 멈춤
      for (int idx = 0; idx < 2; idx++) {
        foodPos[idx] += gravity[idx] * random(1, 3); // 각각 다른 속도로 떨어지도록
      }
    }
  }

  boolean eaten(float[] fishPos) { // 먹힌 먹이 확인
    float eatDist = dist(foodPos[0], foodPos[1], fishPos[0], fishPos[1]); // 거리 확인값
    return eatDist < foodRad + fishRad; // 닿았을 때 리턴
  }

  void display() {
    push();
    translate(foodPos[0], foodPos[1]);
    noStroke();
    fill(45, 100, 50);
    circle(0, 0, 2 * foodRad);
    pop();
  }
}
