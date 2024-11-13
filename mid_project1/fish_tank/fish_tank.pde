ArrayList<Fish> fish;
ArrayList<Food> foods;

float[] gravity = {0, 1}; //중력 설정
int[] mouse = {0, 0};

void setup() {
  fullScreen();

  fish = new ArrayList<Fish>();
  foods = new ArrayList<Food>();
  
  fish.add(new Fish(width * .5, height * .5, 0)); //시작 물고기 1마리
}

void mousePressed() {
  foods.add(new Food(mouseX, mouseY, height * 0.003)); //클릭할 때 먹이 추가
}

void keyPressed() { //Processing.org/Reference/keyCode.html 참고
  if (key == CODED) {
    if (keyCode == UP) {
      fish.add(new Fish(width * random(.2, .8), height * random(.2, .8), 0)); //물고기 추가
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
    aFood.display();
  }

  for (int idx = 0; idx < fish.size(); idx++) {
    Fish aFish = fish.get(idx);
    //aFish.update(targetX, targetY);
    aFish.display();
  }

  textSize(height * .018);
  text("Fish Count: " + fish.size(), width * .15, height * .15);
  text("Food Count: " + foods.size(), width * .15, height * .18);
}
