void drawGround(float gx, float gy) {
  fill(groundColor);
  rect(gx, gy, width, height);
}

void initGround() {
  groundColor = grass;
}