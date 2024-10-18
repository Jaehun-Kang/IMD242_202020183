int[] fruitArray = new int[8];
String[] fruitNames = {
  "Apple", "Banana", "Coconut", "Durian", "Elderberry", "Fig", "Grape", "HuckleBerry"};
int fruitMax = 100;
float graphXStart;
float graphYStart;
float graphWidth;
float graphGap;
int fruitSum = 0;
int fruitAverage;

void setup() {
  size(1280, 720);
  //size(960, 720);

  colorMode(HSB, 360, 100, 100);

  for (int idx = 0; idx < fruitArray.length; idx++) {
    fruitArray[idx] = int(random(1, fruitMax));

    fruitSum = fruitSum + fruitArray[idx];
    fruitAverage = fruitSum / fruitArray.length;
  }
}

void draw() {
  background(40);
  strokeWeight(graphWidth);
  strokeCap(SQUARE);
  textAlign(CENTER);

  float setTextSize = width / fruitArray.length * .1 + 4;
  textSize(setTextSize);

  graphXStart = width / (fruitArray.length + 1);
  graphYStart = height * .75;
  graphWidth = graphXStart * .3 + 2;
  graphGap = graphXStart;

  for (int idx = 0; idx < fruitArray.length; idx++) {
    stroke(360 / fruitArray.length * idx, 70, 90);
    fill(360 / fruitArray.length * idx, 70, 90);

    float graphX = graphXStart + idx * graphGap;
    line(graphX, graphYStart, graphX, graphYStart - fruitArray[idx] * 4);
    text(fruitNames[idx], graphX, graphYStart + setTextSize * 1.4);
    text(fruitArray[idx], graphX, graphYStart - fruitArray[idx] * 4 - setTextSize * .5);
  }

  stroke(100);
  strokeWeight(2);
fill(125);
  line(graphXStart * .5, graphYStart, width - graphXStart * .5, graphYStart);
  line(graphXStart * .5, graphYStart, graphXStart * .5, graphYStart - fruitMax * 4);
  textAlign(RIGHT);
  text(0, graphXStart * .5 - setTextSize * .5, graphYStart + setTextSize * .8);
  text(fruitMax, graphXStart * .5 - setTextSize * .5, graphYStart - fruitMax * 4 + setTextSize * .8);

  fill(255);
  float sumY = graphYStart + setTextSize * 5;
  float averageY = sumY + setTextSize * 1.5;
  textAlign(LEFT);
  text("Sum", width - graphXStart * 1.5, sumY);
  text("Average", width - graphXStart * 1.5, averageY);
  textAlign(RIGHT);
  text(fruitSum, width - graphXStart * .65, sumY);
  text(fruitAverage, width - graphXStart * .65, averageY);
}
