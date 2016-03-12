// This class displays all the visualizations based on the images and color arrays.

class Visualizer {
  
  Visualizer(Data d) {
    this.d = d;
  }
  
  void photos() {
    pushMatrix();
    stroke(1);
    line(0, height/2, width, height/2);
    line(width/2, 0, width/2, height);
    noStroke();
    image(d.getImage(), 0, 0);
    popMatrix();
  } 
  
  void tiles() {
    pushMatrix();
    translate(width/2, height/2);
    stroke(3);
    strokeWeight(1);
    int cnt = 0;
    color[] cd = this.d.getColors();
    for(int x=0; x<640; x=x+20) {
      for(int y=0; y<360; y=y+18) {
        fill(cd[cnt]);
        rect(x, y, 20, 18);
        cnt++;
      }
    }
    popMatrix();
  }
  
  void spin() {
    pushMatrix();
    translate(width/1.3, height/4);
    noStroke();
    for (int i = 0; i<640; i++) {
      pushMatrix();
      float s = circleSize+noise(i*0.5)*circleSize;
      rotate(radians(-i-frameCount*map(s, circleSize, circleSize*2, 0.5, 0.1)));
      if(this.d.getColors() != null)
        fill(this.d.getColors()[639-i], 150);
      else
        fill(map(s, circleSize, circleSize*2, 255, 0), 0, 0, 125);
      ellipse(-s, -s, map(s, circleSize, circleSize*2, 5, 25), map(s, circleSize, circleSize*2, 5, 25));
      popMatrix();
    }
    popMatrix();
  }
  
  void wave() {
    theta += 0.05;
    for (int j=0; j<6; j++) {
      float x = theta;
      for (int i=0; i<yvalues.length; i++) {
        yvalues[i] = sin(x)*amplitude;
        x+=dx;
      }
    }
    pushMatrix();
    translate(-width/100, height/1.33);
    noStroke();
    for (int x=0; x<yvalues.length; x++) {
      if(this.d.getColors() != null)
        fill(this.d.getColors()[x], 200);
      else
        fill(255, 0, 0);
      ellipse(x, yvalues[x], 25, 25);
    }
    popMatrix();
  }
  
  Data d;
  float circleSize = 60;
  float dx = (2*PI)/640;
  float[] yvalues = new float[640];
  float theta = 0.0;
  float amplitude = 50.0;
  
}