void drawSkull() {
  fill(lightGrey);
  beginShape();
  // right side
  vertex(guWidth*20, guHeight*22);
  vertex(guWidth*28, guHeight*17);
  vertex(guWidth*29, guHeight*17.5);
  vertex(guWidth*30, guHeight*20);
  vertex(guWidth*31, guHeight*20);
  vertex(guWidth*31, guHeight*22);
  vertex(guWidth*28, guHeight*24);
  vertex(guWidth*26, guHeight*24);
  vertex(guWidth*26, guHeight*28.5);
  vertex(guWidth*23, guHeight*33.5);
  vertex(guWidth*20, guHeight*33.5);
  // left side
  vertex(guWidth*17, guHeight*33.5);
  vertex(guWidth*14, guHeight*28.5);
  vertex(guWidth*14, guHeight*24);
  vertex(guWidth*12, guHeight*24);
  vertex(guWidth*9, guHeight*22);
  vertex(guWidth*9, guHeight*20);
  vertex(guWidth*10, guHeight*20);
  vertex(guWidth*11, guHeight*17.5);
  vertex(guWidth*12, guHeight*17);
  vertex(guWidth*20, guHeight*22);
  endShape(CLOSE);
}

void drawEyes() {
  fill(black);
  // draw right eye
  beginShape();
  vertex(guWidth*23, guHeight*20);
  vertex(guWidth*28, guHeight*17);
  vertex(guWidth*28, guHeight*18);
  vertex(guWidth*27.5, guHeight*19.5);
  vertex(guWidth*25, guHeight*20.5);
  vertex(guWidth*23, guHeight*20);
  endShape(CLOSE);
  // draw left eye
  beginShape();
  vertex(guWidth*17, guHeight*20);
  vertex(guWidth*12, guHeight*17);
  vertex(guWidth*12, guHeight*18);
  vertex(guWidth*12.5, guHeight*19.5);
  vertex(guWidth*15, guHeight*20.5);
  vertex(guWidth*17, guHeight*20);
  endShape(CLOSE);
  // draw right and left eyeball
  fill(flame);
  ellipse(guWidth*25.5, guHeight*19.2, guWidth*1.5, guWidth*1.5);
  ellipse(guWidth*14.5, guHeight*19.2, guWidth*1.5, guWidth*1.5);
  fill(black);
  ellipse(guWidth*25.5, guHeight*19.2, guWidth*.5, guWidth*.5);
  ellipse(guWidth*14.5, guHeight*19.2, guWidth*.5, guWidth*.5);
}

void drawNose() {
  fill(black);
  beginShape();
  vertex(guWidth*20, guHeight*23.5);
  vertex(guWidth*21, guHeight*22.5);
  vertex(guWidth*22, guHeight*24.5);
  vertex(guWidth*21, guHeight*25.5);
  vertex(guWidth*20, guHeight*25);
  vertex(guWidth*19, guHeight*25.5);
  vertex(guWidth*18, guHeight*24.5);
  vertex(guWidth*19, guHeight*22.5);
  vertex(guWidth*20, guHeight*23.5);
  endShape(CLOSE);
}

void drawMouth() {
  fill(black);
  beginShape();
  vertex(guWidth*20, guHeight*30);
  vertex(guWidth*26, guHeight*28.5);
  vertex(guWidth*22, guHeight*31.5);
  vertex(guWidth*20, guHeight*31.5);
  vertex(guWidth*18, guHeight*31.5);
  vertex(guWidth*14, guHeight*28.5);
  vertex(guWidth*20, guHeight*30);
  endShape(CLOSE);
}