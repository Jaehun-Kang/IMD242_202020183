// int[] colours = {
//   0xFF257180,
//   0xFFF2E5BF,
//   0xFFFD8B51,
//   0xFFCB6040
// };

let colours = [
  "#257180",
  "#F2E5BF",
  "#FD8B51",
  "#CB6040"
];

// float[] gravity = {0, 0.1};
// float friction = 0.99;
// int cnt = 0;
// int[] mouse = {0, 0};

let gravity = [0, .1];
let friction = .99;
let cnt = 0;
let mouse = [0, 0];

// ArrayList<Confetti> confetties;

let confetties = [];

// void setup() {
//   size(800, 800);
//   confetties = new ArrayList<Confetti>();
// }

function setup() {
  createCanvas(800, 800);
}

// void gen(float x, float y, float n) {
//   for (int idx = 0; idx < n; idx++) {
//     float randomW = random(4, 20);
//     float randomH = random(4, 20);
//     float randomForce = random(1, 10);
//     float randomAngForce = random(-30, 30);
//     Confetti newConfetti = new Confetti(x, y,
//       randomW, randomH,
//       colours[int(random(colours.length))],
//       randomForce, randomAngForce);
//     confetties.add(newConfetti);
//   }
// }

let gen = (x, y, n) => {
  for (let idx = 0; idx < n; idx++) {
    let randomW = random(4, 20);
    let randomH = random(4, 20);
    let randomForce = random(1, 10);
    let randomAngForce = random(-30, 30);
    let newConfetti = new Confetti(x, y, randomW, randomH, colours[int(random(colours.length))], randomForce, randomAngForce);
    confetties.push(newConfetti);
  }
}

// void mousePressed() {
//   cnt = 0;
//   mouse[0] = mouseX;
//   mouse[1] = mouseY;
// }

function mousePressed() {
  cnt = 0;
  mouse[0] = mouseX;
  mouse[1] = mouseY;
}

// void mouseReleased() {
//   println("gen: " + cnt);
//   gen(mouse[0], mouse[1], cnt);
// }

function mouseReleased () {
  console.log("gen: " + cnt);
  gen(mouse[0], mouse[1], cnt);
}

// void keyPressed() {
//   if (key =='p' || key =='P')
//     println("confetties: " + confetties.size());
// }

function keyPressed () {
  if (key =='p' || key =='P')
    console.log("confetties: " + confetties.length);
}

// void draw() {
//   if (mousePressed) {
//     cnt++;
//   }
//   background(255);
//   for (int idx = confetties.size() - 1; idx >= 0; idx--) {
//     Confetti aConfetti = confetties.get(idx);
//     aConfetti.update(gravity, friction);
//     if (aConfetti.isOutOfScreen()) {
//       confetties.remove(idx);
//     }
//   }
//   for (int idx = 0; idx < confetties.size(); idx++)
//     confetties.get(idx).display();
// }

function draw() {
  if (mouseIsPressed) {
    cnt++;
  }
  background(255);
  for (let idx = confetties.length - 1; idx >= 0; idx--) {
    let aConfetti = confetties[idx];
    aConfetti.update(gravity, friction);
    if (aConfetti.isOutOfScreen()) {
      confetties.splice(idx, 1);
    }
  }
  confetties.forEach(confetti => {
    confetti.display();
  });
}
