// draws sun using star function
// add rotation to simulate sun rays
void drawSun(float px, float py, float pr1, float pr2, color pc, float pr) {
  pushMatrix();
  translate(px, py);
  fill(pc);
  noStroke();
  rotate(frameCount/pr);
  star(0, 0, pr1, pr2, 40); 
  popMatrix();
}