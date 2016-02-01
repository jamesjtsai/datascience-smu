// draw 3 clouds with random height position, size, and speed
void drawClouds() {
  for(int i=0; i<3; i++) {
    if(cX[i] <= width) {
      cX[i] += cR[i];
      cloud(cX[i], cY[i], cS[i]);
    } else {
      cX[i] = 0;
      cY[i] = random(0, height/2);
    }
  }
}

void cloud(float cx, float cy, float cs) {
  pushMatrix();
  translate(cx, cy);
  beginShape();
  fill(cloudColor);
  noStroke();
  ellipse(25, 70, cs*1.5, cs*1.5);
  ellipse(75, 70, cs*1.5, cs*1.5);
  ellipse(50, 70, cs*2.75, cs);
  endShape();
  popMatrix();
}
    
void initCloud() {
  cloudColor = white;
  for(int i=0; i<3; i++) {
    cS[i] = random(80, 100);
    cX[i] = random(0, width/2);
    cY[i] = random(0, height/2);
    cR[i] = random(.25, 1);
  }
}