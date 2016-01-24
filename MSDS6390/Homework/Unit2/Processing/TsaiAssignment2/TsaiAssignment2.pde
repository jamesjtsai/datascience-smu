/*
Class:   MSDS6390 - Visualization 1
Date:    January 21, 2016
Name:    James Tsai

Title:   Assignment #2, Self-Portrait

Links:   http://www.colourlovers.com/palette/1366158/Kabuki
         https://en.wikipedia.org/wiki/Y%C5%8Dkai
         https://www.pinterest.com/pin/278097345717544121/
         
Palette: Bright Red    Hex: FF0000   RGB: 255,0,0
         Kabuki Red    Hex: 8F2332   RGB: 143,35,50
         White         Hex: E0CBAC   RGB: 255,255,255
         Blackberry    Hex: 030B0E   RGB: 3,11,14
         
Keywords:Kabuki, Yokai, Ghost, Phantom, Strange Apparition
*/

// declare palette
color red = #FF0000;
color redKabuki = #8F2332;
color white = #EEEEEE;
color blackberry = #030B0E;

// declare grid unit
float gridUnit;

void setup() {
  size(600, 800);
  // compose picture using 40x40 grid (1/.025)
  gridUnit = 0.025;
}

void draw() {
  // can resize with no problems
  // scale(0.5);
  // draw head
  drawHead();
  // draw face paint
  drawFacePaint();
  // draw eyebrows
  drawEyebrows();
  // draw eyes
  drawEyes();
  // draw nose
  drawNose();
  // draw mouth
  drawMouth();
  // draw chin
  drawChin();
  // draw grid
  //drawGrid();
}

void polygon(float x, float y, float radius, int npoints) {
  // helper function to draw any symmetrical polygon of npoints 
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void drawIris(float x, float y) {
  // helper function to draw irises 
  strokeWeight(0.5);
  float angle, x1, y1, x2, y2;
  int radius = width/25;
  for (int a = 0; a < 360; a+=6) {
    angle = radians(a);
    x1 = cos(angle) * radius*0.55;
    y1 = sin(angle) * radius*0.55;
    x1 = x1 + x;
    y1 = y1 + y;
    x2 = cos(angle) * radius*0.20;
    y2 = sin(angle) * radius*0.20;
    x2 = x2 + x;
    y2 = y2 + y;
    line(x1, y1, x2, y2);
  }
}

void drawGrid() {
  // helper function to draw 40x40 grid
  for (float a = 0; a < 1; a += gridUnit) {
    line(0, height*a, width, height*a);
    line(width*a, 0, width*a, height);
  }
}

void drawChin() {
  strokeWeight(0.5);
  line(width*13*gridUnit, height*35*gridUnit, width*27*gridUnit, height*35*gridUnit);
}

void drawMouth() {
  fill(redKabuki);
  beginShape();
  vertex(width*13*gridUnit, height*31*gridUnit);
  vertex(width*18*gridUnit, height*30*gridUnit);
  vertex(width*22*gridUnit, height*30*gridUnit);
  vertex(width*27*gridUnit, height*31*gridUnit);
  vertex(width*23*gridUnit, height*33*gridUnit);
  vertex(width*17*gridUnit, height*33*gridUnit);
  vertex(width*13*gridUnit, height*31*gridUnit);
  vertex(width*27*gridUnit, height*31*gridUnit);
  endShape(CLOSE);
}

void drawEyebrows() {
  // set up color
  fill(blackberry);
  
  // eyebrows
  // left
  beginShape();
  vertex(width*2*gridUnit, height*14*gridUnit);
  vertex(width*6*gridUnit, height*13*gridUnit);
  vertex(width*16*gridUnit, height*15*gridUnit);
  vertex(width*15*gridUnit, height*16*gridUnit);
  vertex(width*6*gridUnit, height*14*gridUnit);
  vertex(width*2*gridUnit, height*14*gridUnit);
  endShape(CLOSE);
  // right
  beginShape();
  vertex(width*38*gridUnit, height*14*gridUnit);
  vertex(width*34*gridUnit, height*13*gridUnit);
  vertex(width*24*gridUnit, height*15*gridUnit);
  vertex(width*25*gridUnit, height*16*gridUnit);
  vertex(width*34*gridUnit, height*14*gridUnit);
  vertex(width*38*gridUnit, height*14*gridUnit);
  endShape(CLOSE);
}

void drawEyes() {
  // set up stroke weight and color
  strokeWeight(3);
  fill(white);
  
  // draw eyes
  // left
  beginShape();
  vertex(width*7.5*gridUnit, height*17*gridUnit);
  vertex(width*9.9*gridUnit, height*17.4*gridUnit);
  vertex(width*12.4*gridUnit, height*17.4*gridUnit);
  vertex(width*14.8*gridUnit, height*17*gridUnit);
  vertex(width*12*gridUnit, height*15.6*gridUnit);
  vertex(width*9.9*gridUnit, height*15.6*gridUnit);
  vertex(width*7.5*gridUnit, height*17*gridUnit);
  endShape(CLOSE);
  polygon(width*11*gridUnit, height*16.5*gridUnit, width*0.025, 10);
  // right
  fill(255);
  beginShape();
  vertex(width*32.5*gridUnit, height*17*gridUnit);
  vertex(width*30.1*gridUnit, height*17.4*gridUnit);
  vertex(width*27.6*gridUnit, height*17.4*gridUnit);
  vertex(width*25.2*gridUnit, height*17*gridUnit);
  vertex(width*28*gridUnit, height*15.6*gridUnit);
  vertex(width*30.1*gridUnit, height*15.6*gridUnit);
  vertex(width*32.5*gridUnit, height*17*gridUnit);
  endShape(CLOSE);
  strokeWeight(3);
  polygon(width*29*gridUnit, height*16.5*gridUnit, width*0.025, 10);
  
  // draw irises
  drawIris(width*11*gridUnit, height*16.5*gridUnit);
  drawIris(width*29*gridUnit, height*16.5*gridUnit);
}

void drawNose() {
  // set up color
  fill(white);
  
  // nose
  beginShape();
  vertex(width*18*gridUnit, height*18*gridUnit);
  vertex(width*22*gridUnit, height*18*gridUnit);
  vertex(width*21*gridUnit, height*23*gridUnit);
  vertex(width*23*gridUnit, height*25*gridUnit);
  vertex(width*20*gridUnit, height*26*gridUnit);
  vertex(width*17*gridUnit, height*25*gridUnit);
  vertex(width*19*gridUnit, height*23*gridUnit);
  vertex(width*18*gridUnit, height*18*gridUnit);
  endShape(CLOSE);
  beginShape();
  vertex(width*17*gridUnit, height*25*gridUnit);
  vertex(width*19*gridUnit, height*23*gridUnit);
  vertex(width*18*gridUnit, height*18*gridUnit);
  vertex(width*17*gridUnit, height*25*gridUnit);
  endShape(CLOSE);
  beginShape();
  vertex(width*23*gridUnit, height*25*gridUnit);
  vertex(width*21*gridUnit, height*23*gridUnit);
  vertex(width*22*gridUnit, height*18*gridUnit);
  vertex(width*23*gridUnit, height*25*gridUnit);
  endShape(CLOSE);
  beginShape();
  vertex(width*17*gridUnit, height*25*gridUnit);
  vertex(width*17*gridUnit, height*26*gridUnit);
  vertex(width*20*gridUnit, height*27*gridUnit);
  vertex(width*23*gridUnit, height*26*gridUnit);
  vertex(width*23*gridUnit, height*25*gridUnit);
  vertex(width*20*gridUnit, height*26*gridUnit);
  vertex(width*17*gridUnit, height*25*gridUnit);
  endShape(CLOSE);
}

void drawFacePaint() {
  // set up stroke weight and color
  strokeWeight(0);
  fill(red);
 
  // paint eyes red
  // left
  beginShape();
  vertex(width*2*gridUnit, height*15*gridUnit);
  vertex(width*8*gridUnit, height*18*gridUnit);
  vertex(width*8*gridUnit, height*16*gridUnit);
  vertex(width*2*gridUnit, height*15*gridUnit);
  endShape(CLOSE);
  ellipse(width*11*gridUnit, height*17*gridUnit, width*10*gridUnit, height*2.5*gridUnit);
  // right
  beginShape();
  vertex(width*38*gridUnit, height*15*gridUnit);
  vertex(width*32*gridUnit, height*18*gridUnit);
  vertex(width*32*gridUnit, height*16*gridUnit);
  vertex(width*38*gridUnit, height*15*gridUnit);
  endShape(CLOSE);
  ellipse(width*29*gridUnit, height*17*gridUnit, width*10*gridUnit, height*2.5*gridUnit);
  
  // paint eyes black
  fill(blackberry);
  // left
  beginShape();
  vertex(width*2*gridUnit, height*15*gridUnit);
  vertex(width*8*gridUnit, height*17*gridUnit);
  vertex(width*8*gridUnit, height*15.5*gridUnit);
  vertex(width*2*gridUnit, height*15*gridUnit);
  endShape(CLOSE);
  ellipse(width*11*gridUnit, height*16.5*gridUnit, width*10*gridUnit, height*2.5*gridUnit);
  // right
  beginShape();
  vertex(width*38*gridUnit, height*15*gridUnit);
  vertex(width*32*gridUnit, height*17*gridUnit);
  vertex(width*32*gridUnit, height*15.5*gridUnit);
  vertex(width*38*gridUnit, height*15*gridUnit);
  endShape(CLOSE);
  ellipse(width*29*gridUnit, height*16.5*gridUnit, width*10*gridUnit, height*2.5*gridUnit);
  
  // paint forehead red
  fill(red);
  // left
  beginShape();
  vertex(width*13*gridUnit, height*1*gridUnit);
  vertex(width*9*gridUnit, height*5*gridUnit);
  vertex(width*9*gridUnit, height*9*gridUnit);
  vertex(width*14*gridUnit, height*15*gridUnit);
  vertex(width*16*gridUnit, height*15*gridUnit);
  vertex(width*16*gridUnit, height*14*gridUnit);
  vertex(width*13*gridUnit, height*11*gridUnit);
  vertex(width*13*gridUnit, height*1*gridUnit);
  endShape(CLOSE);
  // right
  beginShape();
  vertex(width*27*gridUnit, height*1*gridUnit);
  vertex(width*31*gridUnit, height*5*gridUnit);
  vertex(width*31*gridUnit, height*9*gridUnit);
  vertex(width*26*gridUnit, height*15*gridUnit);
  vertex(width*24*gridUnit, height*15*gridUnit);
  vertex(width*24*gridUnit, height*14*gridUnit);
  vertex(width*27*gridUnit, height*11*gridUnit);
  vertex(width*27*gridUnit, height*1*gridUnit);
  endShape(CLOSE);
  
  // paint connecting eyebrows
  beginShape();
  vertex(width*16*gridUnit, height*14*gridUnit);
  vertex(width*24*gridUnit, height*14*gridUnit);
  vertex(width*24*gridUnit, height*15*gridUnit);
  vertex(width*16*gridUnit, height*15*gridUnit);
  endShape(CLOSE);
  
  // paint connecting eyes
  beginShape();
  vertex(width*16*gridUnit, height*15*gridUnit);
  vertex(width*18*gridUnit, height*17*gridUnit);
  vertex(width*22*gridUnit, height*17*gridUnit);
  vertex(width*24*gridUnit, height*15*gridUnit);
  vertex(width*26*gridUnit, height*15*gridUnit);
  vertex(width*23*gridUnit, height*18*gridUnit);
  vertex(width*23*gridUnit, height*25*gridUnit);
  vertex(width*17*gridUnit, height*25*gridUnit);
  vertex(width*17*gridUnit, height*18*gridUnit);
  vertex(width*14*gridUnit, height*15*gridUnit);
  vertex(width*16*gridUnit, height*15*gridUnit);
  endShape(CLOSE);
  
  // paint cheeks
  // left
  beginShape();
  vertex(width*17*gridUnit, height*16*gridUnit);
  vertex(width*18*gridUnit, height*17*gridUnit);
  vertex(width*10*gridUnit, height*24*gridUnit);
  vertex(width*2*gridUnit, height*26*gridUnit);
  vertex(width*10*gridUnit, height*23*gridUnit);
  vertex(width*17*gridUnit, height*16*gridUnit);
  endShape(CLOSE);
  // right
  beginShape();
  vertex(width*23*gridUnit, height*16*gridUnit);
  vertex(width*22*gridUnit, height*17*gridUnit);
  vertex(width*30*gridUnit, height*24*gridUnit);
  vertex(width*38*gridUnit, height*26*gridUnit);
  vertex(width*30*gridUnit, height*23*gridUnit);
  vertex(width*23*gridUnit, height*16*gridUnit);
  endShape(CLOSE);
  
  // paint the chin
  beginShape();
  vertex(width*23*gridUnit, height*39*gridUnit);
  vertex(width*17*gridUnit, height*39*gridUnit);
  vertex(width*20*gridUnit, height*33*gridUnit);
  endShape(CLOSE);
}

void drawHead() {
  // set up stroke weight and color
  strokeWeight(1);
  fill(white);

  // head
  beginShape();
  vertex(0, height*18*gridUnit);
  vertex(width*2*gridUnit, height*15*gridUnit);
  vertex(width*2*gridUnit, height*6*gridUnit);
  vertex(width*11*gridUnit, height*1*gridUnit);
  vertex(width*31*gridUnit, height*1*gridUnit);
  vertex(width*38*gridUnit, height*6*gridUnit);
  vertex(width*38*gridUnit, height*15*gridUnit);
  vertex(width*40*gridUnit, height*18*gridUnit);
  vertex(width*38*gridUnit, height*22*gridUnit);
  vertex(width*38*gridUnit, height*26*gridUnit);
  vertex(width*36*gridUnit, height*31*gridUnit);
  vertex(width*32*gridUnit, height*35*gridUnit);
  vertex(width*27*gridUnit, height*38*gridUnit);
  vertex(width*24*gridUnit, height*39*gridUnit);
  vertex(width*16*gridUnit, height*39*gridUnit);
  vertex(width*13*gridUnit, height*38*gridUnit);
  vertex(width*8*gridUnit, height*35*gridUnit);
  vertex(width*4*gridUnit, height*31*gridUnit);
  vertex(width*2*gridUnit, height*26*gridUnit);
  vertex(width*2*gridUnit, height*22*gridUnit);
  vertex(0, height*18*gridUnit);
  endShape(CLOSE);
}