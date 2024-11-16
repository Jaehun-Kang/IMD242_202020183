ArrayList<Fish> fish;
ArrayList<Food> foods;

float[] gravity;
float[] moveSpeed;
float foodRad;
float fishRad;

void setup() {
  fullScreen();
  //size(600, 450);
  //size(800, 600);
  //size(1200, 1080);
  colorMode(HSB, 360, 100, 100);

  gravity = new float[] {0, height * .001}; //중력 설정(화면 비례)
  moveSpeed = new float[] {.05, .05}; // 이동 속도
  foodRad = height * 0.0035; // 음식 반지름(화면 비례)
  fishRad = height * 0.01; // 최초 물고기 머리 반지름(화면 비례)

  fish = new ArrayList<Fish>();
  foods = new ArrayList<Food>();

  fish.add(new Fish(random(1 + fishRad, width - 1 - fishRad), 1 - fishRad, fishRad)); //시작 물고기 1마리
}

//클릭할 때 먹이 추가
void mousePressed() {
  foods.add(new Food(mouseX, mouseY)); // 마우스 좌표에 추가
}

// 물고기 추가/삭제 조작
void keyPressed() {
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

        // ChatGPT 사용함(이하 2줄) : 물고기가 2마리 이상일 때 먹이가 생기는 즉시 물고기가 먹는 상황이 반복되면 인덱스가 0일 때 실행되어 에러가 발생함
        idx--; // 체크하는 인덱스를 줄이고
        break; // 반복문을 종료하여 새로 체크하도록 하여 에러 방지
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
    aFish.fishBody(); // 몸통 구현
    aFish.display();
  }

  // 텍스트
  float textSize = 18;
  textSize(textSize);
  fill(0, 0, 100);
  text("Fish Count: " + fish.size(), 25, 25 + textSize * .5); // 물고기 수
  text("Food Count: " + foods.size(), 25, 25 + textSize * .5 + textSize * 1.3); // 먹이 수
  text("Add/Remove fish with '↑, ↓'", 25, 25 + textSize * .5 + textSize * 2.6); // 설명 텍스트
  text("Add food with 'mouse click'", 25, 25 + textSize * .5 + textSize * 3.9); // 설명 텍스트
  fill(0, 80, 100);
  text("Too many fish might cause lag.", 25, 25 + textSize * .5 + textSize * 5.2); // 설명 텍스트
}
