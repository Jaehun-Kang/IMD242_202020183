
class Fish {
  float[] fishPos;
  float[] vel;
  float deg = random(50, 120); // 처음에 아래 방향으로 나오도록 설정
  float range = height * .3; // 물고기 먹이 탐지 사정거리
  float headSize; // 머리 크기
  int trailSize; // 몸통 길이

  Fish(float fishX, float fishY, float headSize) {
    fishPos = new float[2];
    vel = new float[2];
    trails = new ArrayList<float[]>();
    init(fishX, fishY, headSize);
  }

  void init(float fishX, float fishY, float fishRad) {
    fishPos[0] = fishX;
    fishPos[1] = fishY;
    headSize = fishRad * 2;
    trailSize = int(headSize * moveSpeed[0] * 30); // 머리 크기에 따른 몸통 길이
    for (int idx = 0; idx < trailSize; idx++) { // 몸통 길이만큼 생성
      trails.add(new float[] {fishX, fishY});
    }
  }

  //목표 좌표 설정
  void target(ArrayList<Food> foods) {

    //ChatGPT 사용함(이하 2줄) : 가까운 먹이 찾는 것 구현하기 위해 물어봄
    float closestDist = Float.MAX_VALUE; // float 타입 최댓값으로 설정하여 첫 번째 비교를 참으로 만듦
    int closestIdx = -1; // 범위 안의 먹이가 없을 때 -1 상태로 두어 에러 방지

    for (int idx = 0; idx < foods.size(); idx++) { // 먹이 전체 확인
      float foodDist = dist(this.fishPos[0], this.fishPos[1],
        foods.get(idx).foodPos[0], foods.get(idx).foodPos[1]); // 먹이와의 거리 불러오기
      if (foodDist < closestDist && foodDist < range) { // 최소 거리로 최신화
        closestDist = foodDist;
        closestIdx = idx;
      }
    }
    if (closestIdx != -1) { // 범위 내에 먹이가 있을 때
      float[] foodCoord = {foods.get(closestIdx).foodPos[0], foods.get(closestIdx).foodPos[1]}; // 가장 가까운 먹이 좌표값 불러오기
      float subX = foodCoord[0] - this.fishPos[0]; // x 좌표 차이
      float subY = foodCoord[1] - this.fishPos[1]; // y 좌표 차이
      deg = degrees(atan2(subY, subX)); // 두 점간 절대각도 계산
    }
  }

  // 랜덤 방향으로 방향 각도 변경
  void targetRandom(float rotate) {
    if (rotate < 0) { // 좌회전
      deg -= 1;
    } else if (rotate >= 0) { // 우회전
      deg += 1;
    }
    if (deg <= 0) { // 최대 최소 이어지도록
      deg += 360;
    }
    if (deg > 360) {
      deg -= 360;
    }
  }

  // 물고기가 먹이를 먹었을 때
  void eat() {
    if ( headSize < fishRad * 2 * 1.8) { // 최대 크기는 기존 크기의 n배로 설정
      headSize *= 1.02; // 조금씩 커지게
      trailSize ++;
    }
  }

  // 랜덤한 방향으로 대쉬
  int velMultTop = 100; // 최대 속도 배수
  float velMult = velMultTop; // 초기 속도 배수 설정
  int startFrame = 0; // 시작프레임 설정
  float dashLoop = random(2, 4); // 반복 시간 설정
  void fishRandomDash(float turn) {
    if (frameCount - startFrame > frameRate * dashLoop) { // 2 ~ 4초마다 실행
      velMult = velMultTop; // 속도 배수 초기화
      dashLoop = random(2, 4);
      if (turn >= 0) { // 일정 시간마다 랜덤한 방향전환
        deg = random(360);
      }
      if (fishPos[0] <= 0 + headSize * .5) { // 왼쪽 벽 방향전환
        deg = 360 - deg + 180;
      }
      if (fishPos[0] >= width - headSize * .5) { // 오른쪽 벽 방향전환
        deg = 360 - deg + 180;
      }
      if (fishPos[1] <= 0 - headSize * .5) { // 천장 방향전환
        deg = 360 - deg;
      }
      if (fishPos[1] >= height * .9 - headSize * .5) { // 바닥 방향전환
        deg = 360 - deg;
      }
      startFrame = frameCount; //시작프레임 최신화
    } else {
      if (velMult > 20) { // 속도 줄어들다 20%가 되면 유지
        velMult *= 0.96; // 속도 서서히 줄어듦
      }
    }
    for (int idx = 0; idx < 2; idx++) {
      this.vel[idx] = moveSpeed[idx]; // 대쉬 속도 받아오기
      this.vel[idx] *= velMult;

      // variablePractice 과제 코드 활용
      this.fishPos[0] += cos(radians(deg)) * this.vel[idx];
      this.fishPos[1] += sin(radians(deg)) * this.vel[idx]; // 절대각도를 받아 해당 각도로 이동하도록 함

      // 충돌 처리
      if (fishPos[0] < headSize * .5) { // 왼쪽 벽 충돌
        fishPos[0] = headSize * .5;
      }
      if (fishPos[0] > width - headSize * .5) { // 오른쪽 벽 충돌
        fishPos[0] = width - headSize * .5;
      }
      if (fishPos[1] < - headSize * .5) { // 천장 충돌 수면. 위로 올라가는 경우를 고려해 살짝 높임
        fishPos[1] = - headSize * .5;
      }
      if (fishPos[1] > height * .99 - headSize * .5) { // 바닥 충돌
        fishPos[1] = height * .99 - headSize * .5;
      }
    }
  }

  // 물고기 몸통 크기 설정 & 머리 따라가게 설정
  ArrayList<float[]> trails; // 이전 물고기 위치 저장하는 배열
  void fishBody() {
    trails.add(new float[] {fishPos[0], fishPos[1]});
    if (trails.size() > trailSize) {
      trails.remove(0);
    }
  }

  int randomCol = int(random(360)); // 물고기 색상 설정
  void display() {
    for (int fishDraw = 0; fishDraw < trails.size(); fishDraw++) {
      push();
      translate(trails.get(fishDraw)[0], trails.get(fishDraw)[1]);
      noStroke();
      fill(randomCol, 35, 60, map(fishDraw, trailSize - 1, 0, 255, 0));
      circle(0, 0, headSize * pow(map(fishDraw, trailSize - 1, 0, 1, 0), .6));
      pop();
    }
  }
}
