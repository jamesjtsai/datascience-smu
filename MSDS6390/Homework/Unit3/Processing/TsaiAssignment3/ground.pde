void drawGround(float gx, float gy) {
  fill(groundColor);
  rect(gx, gy, width, height);
  pushMatrix();
  for(int i=0; i<7; i++) {
    drawFlower(width/6+(i*(width/20)), gy);
  }
  popMatrix();
}

void drawFlower(float fx, float fy) {
  pushMatrix();
  translate(fx, fy);
  fill(#FAD13D);
  ellipse(0, 0, 10, 10);
  for(int i=0; i<5; i++) {
    fill(#F93DFA);
    ellipse(0, -10, 10, 10);
    rotate(radians(72));
  }
  popMatrix();
}

void initGround() {
  groundColor = grass;
}