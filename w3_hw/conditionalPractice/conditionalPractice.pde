void setup() {
  size(640, 480);
  rectMode(CENTER);
  stroke(127);
  strokeWeight(4);
}

void draw() {
  background(0);
  int shapeH = 100;

  if (mouseY < height / 4) {
    line(width / 2 - shapeH / 2, //선 그리기
      10,
      width / 2 + shapeH / 2,
      height / 4 - 10);
  } else if (mouseY < height / 2) {
    circle(width / 2, height * 3 / 8, shapeH);        //원 그리기
  } else if (mouseY < height * 3 / 4) {
    float a, x1, x2, x3, y1, y2, y3;              //정삼각형 그리기

    a = 2  / sqrt(3) * shapeH;                    //한 변의 길이

    x1 = width / 2 - a / 2;
    x2 = width / 2 + a / 2;
    x3 = width / 2;

    y1 = height * 3 / 4 - (height / 4 - shapeH) / 2;
    y2 = height * 3 / 4 - (height / 4 - shapeH) / 2;
    y3 = height / 2 + (height / 4 - shapeH) / 2;

    triangle(x1, y1, x2, y2, x3, y3);
  } else {
    square(width / 2, height * 7 / 8, shapeH);    //정사각형 그리기
  }

  line(0, height * 1 / 4, width, height * 1 / 4);
  line(0, height * 2 / 4, width, height * 2 / 4);
  line(0, height * 3 / 4, width, height * 3 / 4);
}
