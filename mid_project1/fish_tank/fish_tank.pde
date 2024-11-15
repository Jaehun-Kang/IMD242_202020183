ArrayList<Fish> fish;
ArrayList<Food> foods;

float[] gravity = {0, 1}; //중력 설정
float[] dashSpeed = {.05, .05}; // 대쉬 속도
float foodRad = height * 0.05; // 음식 반지름
float fishRad = height * 0.1; // 최초 물고기 머리 반지름

void setup() {
  fullScreen();
  colorMode(HSB, 360, 100, 100);

  fish = new ArrayList<Fish>();
  foods = new ArrayList<Food>();

  fish.add(new Fish(random(1 + fishRad, width - 1 - fishRad), 1 - fishRad, fishRad)); //시작 물고기 1마리
}

void mousePressed() {
  foods.add(new Food(mouseX, mouseY)); //클릭할 때 먹이 추가
}

void keyPressed() { //Processing.org/Reference/keyCode.html 참고
  if (key == CODED) {
    if (keyCode == UP) {
      fish.add(new Fish(random(1 + fishRad, width - 1 - fishRad), 1 - fishRad, fishRad)); //물고기 추가
    }
    if (keyCode == DOWN && fish.size() > 1) { //물고기 없을 때 실행 안됨
      fish.remove(fish.size() - 1); //물고기 삭제
    }
  }
}

void draw() {
  background(225, 70, 20);
  fill(225, 10, 70); // 모래 색상
  rect(0, height * .9, width, height); // 모래 바닥 범위

  for (int idx = 0; idx < foods.size(); idx++) { //먹이 관련 함수
    Food aFood = foods.get(idx); // 먹이 개체 불러오기
    aFood.update(gravity); // 중력 적용
    for (int fishIdx = 0; fishIdx < fish.size(); fishIdx++) { // 물고기와 닿았을 때 사라지는 효과
      if (aFood.eaten(fish.get(fishIdx).fishPos)) { // 참일 때
        foods.remove(idx); // 해당 먹이 사라짐
        fish.get(fishIdx).eat(); // 물고기가 먹이를 먹었을 때 작동
        // ChatGPT 사용함(이하 1줄) : 물고기가 진동하는 문제 발생하여 이를 해결하고자 사용함
        break; //한번 삭제 후 반복문 종료
      }
    }
    aFood.display();
  }

  float rotate = random(-1, 1); // 회전 방향 변수
  float turn = random(-1, 1); // 방향 전환 변수
  for (int idx = 0; idx < fish.size(); idx++) { //물고기 관련 함수
    Fish aFish = fish.get(idx);
    if (foods.size() > 0) { // 먹이가 있을 때
      aFish.target(foods); // 먹이좌표 방향 설정
    } else {
      aFish.targetRandom(rotate); // 먹이가 없을 때 랜덤 방향으로 회전
    }
    aFish.fishRandomDash(turn); // 방향 전환
    aFish.display();
  }

  textSize(height * .018);
  text("Fish Count: " + fish.size(), width * .02, height * .05); // 물고기 수
  text("Food Count: " + foods.size(), width * .02, height * .08); // 먹이 수
  text("Add/Remove fish with '↑, ↓'", width * .02, height * .11); // 설명 텍스트
  text("Add food with 'mouse click'", width * .02, height * .14); // 설명 텍스트
}
