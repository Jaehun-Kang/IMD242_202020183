class Fish {
  float[] pos;
  float[] vel;
  float deg;

  Fish(float fishX, float fishY, float deg) {
    pos = new float[2];
    vel = new float[2];
    init(fishX, fishY, deg);
  }

  void init(float fishX, float fishY, float deg) {
    pos[0] = fishX;
    pos[1] = fishY;
    this.deg = deg;
  }

  void setTarget(float deg) {
    for (int idx = 0; idx < 2; idx++) {
      
    }
  }

  void display() {
    push();
    translate(pos[0], pos[1]);
    noStroke();
    fill(50, 255, 50);
    circle(0, 0, 20);
    pop();
  }
}
