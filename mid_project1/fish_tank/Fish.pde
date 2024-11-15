class Fish {
  float[] fishPos;
  float[] vel;
  float deg = random(50, 120); // 처음에 아래 방향으로 나오도록 설정
  float range = 500; // 물고기 먹이 탐지 사정거리
  float headSize;

  Fish(float fishX, float fishY, float headSize) {
    fishPos = new float[2];
    vel = new float[2];
    init(fishX, fishY, headSize);
  }

  void init(float fishX, float fishY, float fishRad) {
    fishPos[0] = fishX;
    fishPos[1] = fishY;
    headSize = fishRad * 2;
  }

  void target(ArrayList<Food> foods) { // 목표 좌표 설정
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

  void targetRandom(float rotate) {  // 랜덤 방향으로 방향 각도 변경
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

  void eat() { // 물고기가 먹이를 먹었을 때
    if ( headSize < fishRad * 2 * 2) { // 최대 크기는 기존 크기의 2배로 설정
      headSize *= 1.01; // 조금씩 커지게
    }
  }

  int velMultTop = 100; // 최대 속도 배수
  float velMult = velMultTop; // 초기 속도 배수 설정
  int startFrame = 0; // 시작프레임 설정
  float dashLoop = random(2, 4); // 반복 시간 설정
  void fishRandomDash(float turn) {
    if (frameCount - startFrame > frameRate * dashLoop) { // 2 ~ 4초마다 실행
      velMult = velMultTop; // 속도 배수 초기화

      dashLoop = random(2, 4);

      if (turn >= 0) {
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
      this.vel[idx] = dashSpeed[idx]; // 대쉬 속도 받아오기
      this.vel[idx] *= velMult;
      // variablePractice 과제 코드 활용
      this.fishPos[0] += cos(radians(deg)) * this.vel[idx];
      this.fishPos[1] += sin(radians(deg)) * this.vel[idx]; // 절대각도를 받아 해당 각도로 이동하도록 함

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
  
  void fishBody() { // 물고기 몸통 크기 설정 & 머리 따라가게 설정
  
  }

  int randomCol = int(random(360)); // 물고기 색상 설정
  void display() {
    push();
    translate(fishPos[0], fishPos[1]);
    noStroke();
    fill(randomCol, 30, 80);
    circle(0, 0, headSize); // 머리
    pop();
  }
}
