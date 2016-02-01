float outer = 0;

// draw 100 stars using star function
// use random function to simulate twinkle by varying the radius of each star
void drawStars() {
  fill(white);
  for(int i=0; i<100; i++) {
    outer = random(5);
    star(rX[i], rY[i], rI[i], rO[i]+outer, 5);
  }
}

void initStar() {
  for(int i=0; i<100; i++) {
    rX[i] = random(0, width);
    rY[i] = random(0, height);
    rI[i] = random(0, 5);
    rO[i] = random(5, 10);
  }
}