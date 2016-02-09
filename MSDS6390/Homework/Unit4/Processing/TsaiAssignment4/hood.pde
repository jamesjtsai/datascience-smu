void drawHood() {
  noStroke();
  fill(nordic);
  beginShape();
  // left outer
  vertex(0, guHeight*40);
  vertex(0, guHeight*24);
  vertex(guWidth*6, guHeight*20);
  vertex(guWidth*6, guHeight*13);
  vertex(guWidth*10, guHeight*8);
  vertex(guWidth*18, guHeight*4);
  // right outer
  vertex(guWidth*22, guHeight*4);
  vertex(guWidth*30, guHeight*8);
  vertex(guWidth*34, guHeight*13);
  vertex(guWidth*34, guHeight*20);
  vertex(guWidth*40, guHeight*24);
  vertex(guWidth*40, guHeight*40);
  // right inner  
  vertex(guWidth*30, guHeight*40);
  vertex(guWidth*30, guHeight*35);
  vertex(guWidth*28, guHeight*31);
  vertex(guWidth*27, guHeight*29);
  vertex(guWidth*27, guHeight*28);
  vertex(guWidth*28, guHeight*26);
  vertex(guWidth*32, guHeight*23);
  vertex(guWidth*31, guHeight*20);
  vertex(guWidth*30, guHeight*18);
  vertex(guWidth*28, guHeight*17);
  vertex(guWidth*20, guHeight*22);
  // left inner
  vertex(guWidth*20, guHeight*22);
  vertex(guWidth*12, guHeight*17);
  vertex(guWidth*10, guHeight*18);
  vertex(guWidth*9, guHeight*20);
  vertex(guWidth*8, guHeight*23);
  vertex(guWidth*12, guHeight*26); 
  vertex(guWidth*13, guHeight*28);
  vertex(guWidth*13, guHeight*29);
  vertex(guWidth*12, guHeight*31);
  vertex(guWidth*10, guHeight*35);
  vertex(guWidth*10, guHeight*40);
  rect(guWidth*10, guHeight*35, guWidth*40, guHeight*40);
  endShape(CLOSE);
}