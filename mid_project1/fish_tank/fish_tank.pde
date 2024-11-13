ArrayList<Fish> fish;
ArrayList<Food> foods;

float[] gravity = {0, 1}; //중력 설정
//int[] mouse = {0, 0};
float[] dashSpeed = {4, 4};
float foodRad = height * 0.05;
float fishRad = height * 0.2;

void setup() {
  fullScreen();

  fish = new ArrayList<Fish>();
  foods = new ArrayList<Food>();

  fish.add(new Fish(width * .5, height * .5, 0, fishRad)); //시작 물고기 1마리
}

void mousePressed() {
  foods.add(new Food(mouseX, mouseY)); //클릭할 때 먹이 추가
}

void keyPressed() { //Processing.org/Reference/keyCode.html 참고
  if (key == CODED) {
    if (keyCode == UP) {
      fish.add(new Fish(width * random(.2, .8), height * random(.2, .8), 0, fishRad)); //물고기 추가
    }
    if (keyCode == DOWN && fish.size() > 0) { //물고기 없을 때 실행 안됨
      fish.remove(fish.size() - 1); //물고기 삭제
    }
  }
}

void draw() {
  background(0, 25, 50);
  for (int idx = 0; idx < foods.size(); idx++) {
    Food aFood = foods.get(idx);
    aFood.update(gravity);
    for (int fishIdx = 0; fishIdx < fish.size(); fishIdx++) {
      if (aFood.eaten(fish.get(fishIdx).fishPos)) {
        foods.remove(idx);
      }
    }
    aFood.display();
  }

  for (int idx = 0; idx < fish.size(); idx++) {
    Fish aFish = fish.get(idx);
    aFish.fishRandomDash();
    //aFish.update(targetX, targetY);
    for (int foodIdx = 0; foodIdx < foods.size(); foodIdx++) {
      aFish.foodFound(foods.get(foodIdx).foodPos);
    }
    aFish.display();
  }

  println(fish.get(0).fishPos);

  textSize(height * .018);
  text("Fish Count: " + fish.size(), width * .15, height * .15); // 물고기 수
  text("Food Count: " + foods.size(), width * .15, height * .18); // 먹이 수
}
