void drawMoon(float px, float py, float pr1, float pr2, color pc) {
  pushMatrix();
  translate(px, py);
  fill(pc);
  noStroke();
  ellipse(0, 0, pr1, pr2);
  fill(charcoal);
  ellipse(10, -5, pr1-15, pr2-15);
  popMatrix();
}