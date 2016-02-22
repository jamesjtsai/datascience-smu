// How far apart should each horizontal location be spaced
int xspacing = 2;

// Width of entire wave
int w;
// Start angle at 0
float theta = 0.0;

// Height of wave
float amplitude = 80.0;

// How many pixels before the wave repeats
float period = 576.0;

// Value for incrementing X, a function of period and xspacing
float dx;

// Using an array to store height values for the wave
float[] yvalues;

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.03;
  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave(color[] cw) {
  noStroke();
  fill(255, 0, 0);
  for (int x = 0; x < yvalues.length; x++) {
    fill(cw[x+125]);
    ellipse(x*xspacing, height/1.20+yvalues[x], 25, 25);
  }
}

void initWave() {
  noStroke();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void drawWave() {
  calcWave();
  renderWave(cPI);
}

void drawGrid() {
  stroke(3);
  float gridUnit = 0.03125;
  for (float a = 0; a < 1; a += gridUnit) {
    line(0, height*a, width, height*a);
    line(width*a, 0, width*a, height);
  }
}