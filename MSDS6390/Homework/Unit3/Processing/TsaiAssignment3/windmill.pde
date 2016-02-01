// draw windmill - can control location, size, number of arms, and rotation rate
void drawWindmill(float wx, float wy, int ws, float wn, float wr) {
  pushMatrix();
  translate(wx, wy);
  drawBuilding();
  strokeWeight(1);
  rotate(frameCount/wr);
  fill(fluff);
  for(int i=0; i<wn; i++) {
     drawArm(ws);
     rotate(PI/(wn/2));
  }
  fill(blue);
  polygon(0, 0, guWidth*1.5, 6);
  popMatrix();
}

// draw arms of the windmill
void drawArm(float ws) {
  stroke(1);
  fill(grey);
  rect(guWidth*ws*0.4, 0, guWidth*ws*0.6, guHeight*ws*0.25);
  fill(charcoal);
  rect(0, 0, guWidth*ws, guHeight*ws*0.04);
  for (float a=1; a<2.5; a+=0.10) {
    line(guWidth*ws*0.4*a, 0, guWidth*ws*0.4*a, guHeight*ws*0.25);
  }
  line(guWidth*ws*0.4, guHeight*ws*0.1, guWidth*ws, guHeight*ws*0.1);
  line(guWidth*ws*0.4, guHeight*ws*0.2, guWidth*ws, guHeight*ws*0.2);
}

// draw windmill building
void drawBuilding() {
  beginShape();
  strokeWeight(2);
  stroke(1);
  fill(brick);
  vertex(0, guHeight*(-3));
  vertex(guWidth*(-5), guHeight*4);
  vertex(guWidth*(-2), guHeight*4);
  vertex(0, guHeight*(-3));
  vertex(guWidth*2, guHeight*4);
  vertex(0, guHeight*(-3));
  vertex(guWidth*5, guHeight*4);
  vertex(guWidth*(-2), guHeight*4);
  endShape(CLOSE);
  // draw body
  beginShape();
  vertex(guWidth*(-5), guHeight*4);
  vertex(guWidth*(-5), guHeight*15);
  vertex(guWidth*5, guHeight*15);
  vertex(guWidth*5, guHeight*4);
  endShape(CLOSE);
  // draw base
  beginShape();
  fill(charcoal);
  vertex(guWidth*(-8), guHeight*15);
  vertex(guWidth*(-9), guHeight*17);
  vertex(guWidth*(9), guHeight*17);
  vertex(guWidth*(8), guHeight*15);
  endShape(CLOSE);
  // draw window
  fill(windowColor);
  beginShape();
  vertex(guWidth*(-2), guHeight*5);
  vertex(guWidth*(-2), guHeight*10);
  vertex(guWidth*2, guHeight*10);
  vertex(guWidth*2, guHeight*5);
  endShape(CLOSE);
  line(0, guHeight*5, 0, guHeight*10);
  line(guWidth*(-2), guHeight*7.5, guWidth*2, guHeight*7.5);
}

// initialize the window color
void initWindow() {
  windowColor = white;
}