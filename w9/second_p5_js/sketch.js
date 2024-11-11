let tileNumX = 16,
  tileNumY = 12;

function setup() {
  createCanvas(640, 480);
  background('#33333388');
}

function draw() {
  // for (let column = 0; column < width; column += 40) {
  //   for (let row = 0; row < height; row += 40) {
  //     //모든 변수는 let 또는 var 붙임(타입 구분 x)
  //     let x = 20 + column,
  //       y = 20 + row,
  //       d = 30;
  //     noStroke();
  //     fill('cornflowerblue');
  //     circle(x, y, d);
  //   }
  // }

  fill('cornflowerblue');
  for (let row = 0; row < tileNumY; row++) {
    for (let column = 0; column < tileNumX; column++) {
      let tileW = width / tileNumX;
      let tileH = height / tileNumY;

      let x = tileW * 0.5 + column * tileW;
      let y = tileH * 0.5 + row * tileH;

      ellipse(x, y, tileW, tileH);
    }
  }
}
