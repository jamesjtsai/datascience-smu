// vine arguments
// l - float between 1 and 160, indicates size of the vine
// d - float between 0 and .89, indicates rate of decrease in segments
// h - float indicating rate in which vine curls
// r - integer value 1 or -1, indicates direction of vine
// b - boolean value indicating whether circles should be added
void vine(float l, float d, float h, int r, boolean b) {
  float t = map(l, 1, 160, 1, 30);
  float angle = sin(radians(l))*5;
  strokeWeight(t);
  stroke(0, 150, 0, 100);
  fill(0, 100, 0);
  bezier(0, 0, 0, 0, -t, -t, 0, -l);
  bezier(0, 0, 0, 0, t, -t, 0, -l);
  if(b) {
    fill(255);
    ellipse(0, 0, t, t);
  }
  translate(0, -l);
  l *= d;
  if(l > 5){
    pushMatrix();
    rotate(radians(r*(h+angle)));
    vine(l, d, h, r, b);
    popMatrix();
  } else {
    if (r == -1)
      mickey(.1);
    else
      leaf(30, false);
  }
}

// leaf arguments
// l - float indicating size of leaf
// b - true = leaf, false = flower
void leaf(float l, boolean b) {
  float t = map(l, 1, 160, 1, 30);
  strokeWeight(t);
  rotate(radians(-30.0));
  for(float i=0; i<3.5; i=i+0.5) {
    if(b) {
      stroke(0, 150, 0, 100);
      fill(0, 100, 0);
    } else {
      stroke(255, 215, 0, 100);
      fill(255, 215, 0);
    }
    bezier(0, 0, 0, 0, -t, -t, 0, -l);
    bezier(0, 0, 0, 0, t, -t, 0, -l);
    rotate(radians(10+i));
  }
}

void mickey(float s) {
  noStroke();
  fill(255, 165, 0);
  ellipse(0, 0, 150*s, 150*s);
  ellipse(-70*s, -70*s, 100*s, 100*s);
  ellipse(70*s, -70*s, 100*s, 100*s);
}

void drawVine() {
  pushMatrix();
  translate(width/8, height/1.2);
  vine(160, 0.89, 10, 1, true);
  popMatrix();
}

float[] lX, lY, lS;
void drawFlora() {
  noStroke();
  fill(0);
  rect(0, height/1.17, width,height);
  for (int i=0; i<100; i++) {
    pushMatrix();
    translate(lX[i], lY[i]);
    leaf(lS[i], true);
    popMatrix();
  }
  int d = -1;
  for(int i=0; i<5; i++) {
    pushMatrix();
    translate(width/(i+1),height/1.18);
    d *= -1;
    vine(40, 0.89, 10, d, false);
    popMatrix();
  }
}

void initFlora() {
  lX = new float[100];
  lY = new float[100];
  lS = new float[100];
  for (int i=0; i<100; i++) {
    lX[i]=random(width);
    lY[i]=random(height/1.15, height);
    lS[i]=random(40,60);
  }
}