// class to create analog clock

class AnalogClock extends Clock {
  
  AnalogClock() {
    super();
    msInitial = getSecond() * 1000;
  }
  
  void time() {
    pushMatrix();
    translate(width/4, height/2);
    clockface();
    displayHands();
    popMatrix();
  }
  
  void clockface() {
    strokeWeight(8);
    stroke(Bauhaus.RED);
    fill(Bauhaus.BLUE);
    ellipse(0, 0, clockDiameter, clockDiameter);
    stroke(Bauhaus.FLUFF);
    strokeWeight(8);
    strokeCap(PROJECT);
    for (int a = 0; a < 360; a+=6) {
      float angle = radians(a);
      float x1 = cos(angle) * secRadMedium;
      float y1 = sin(angle) * secRadMedium;
      float x2 = cos(angle) * secRadBigger;
      float y2 = sin(angle) * secRadBigger;
      line(x1, y1, x2, y2);
    }
    fill(Bauhaus.FLUFF);
    for(int i=0; i<4; i++) {
      float angle = radians(i*90);
      float x = cos(angle) * secRadMedium * 0.92;
      float y = sin(angle) * secRadMedium * 0.92;
      rect(x-17.5, y-17.5, 35, 35);
      if(i == 3)
        rect(x-17.5, y+33, 35, 10);
    }
    int[][] lticks = { {29, 34}, {56, 61}, 
                       {119, 124}, {146, 151},
                       {209, 214}, {236, 241},
                       {299, 304}, {326, 331}
                     };
    for(int i=0; i<8; i++) {
      strokeWeight(20);
      float angle=radians(lticks[i][0]);
      float x1 = cos(angle) * secRadBigger * 1.04;
      float y1 = sin(angle) * secRadBigger * 1.04;
      angle=radians(lticks[i][1]);
      float x2 = cos(angle) * secRadBigger * 1.04;
      float y2 = sin(angle) * secRadBigger * 1.04;
      if(i == 0 || i == 1)
        line(x1-20, y1-20, x2-20, y2-20);
      if(i == 2 || i == 3)
        line(x1+20, y1-20, x2+20, y2-20);
      if(i == 4 || i == 5)
        line(x1+20, y1+20, x2+20, y2+20);
      if(i == 6 || i == 7)
        line(x1-20, y1+20, x2-20, y2+20);
    }
  }
  
  void displayHands() {
    hourHand();
    minuteHand();
    secondHand();
  }
  
  void hourHand() { 
    float hrsRadSmall = radius * 0.20;
    float hrsRadMedium = radius * 0.40;
    float hrsRadBig = radius * 0.50;
    float h = map(getHour() + norm(getMinute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
    stroke(Bauhaus.FLUFF);
    ellipse(0, 0, 41, 41);
    // Draw the yellow parts of the hour hand
    stroke(Bauhaus.YELLOW);
    strokeWeight(42);
    line(0, 0, cos(h) * hrsRadMedium, sin(h) * hrsRadMedium);
    strokeWeight(15);
    line(0, 0, cos(h) * hrsRadBig, sin(h) * hrsRadBig);
    // Draw the red part of the hour hand
    stroke(Bauhaus.RED);
    strokeWeight(40);
    line(0, 0, cos(h) * hrsRadSmall, sin(h) * hrsRadSmall);
    // Draw hour hand mount
    stroke(Bauhaus.RED);
    ellipse(0, 0, 28, 28);
  }
  
  void minuteHand() {
    // Radii for minutes
    float minRadSmall = radius * 0.10;
    float minRadMedium = radius * 0.62;
    float minRadBig = radius * 0.70;
    float m = map(getMinute() + norm(getSecond(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
    stroke(Bauhaus.YELLOW);
    ellipse(0, 0, 22, 22);
    strokeWeight(42);
    line(0, 0, cos(m) * minRadMedium, sin(m) * minRadMedium);
    strokeWeight(15);
    line(0, 0, cos(m) * minRadBig, sin(m) * minRadBig);
    // Draw the red part of the minute hand
    stroke(Bauhaus.RED);
    strokeWeight(40);
    line(0, 0, cos(m) * minRadSmall, sin(m) * minRadSmall);
    // Draw the minute hand mount
    ellipse(0, 0, 20, 20);
  }
  
  void secondHand() {
    stroke(Bauhaus.YELLOW);
    strokeWeight(17);
    float s = map(msInitial+millis(), 0, 60000, 0, TWO_PI) - HALF_PI;
    line(0, 0, cos(s) * secRadBig, sin(s) * secRadBig);
    stroke(Bauhaus.RED);
    strokeWeight(15);
    line(0, 0, cos(s) * secRadSmall, sin(s) * secRadSmall);
  }
  
  float clockDiameter = height/1.25;
  float radius = clockDiameter/2;
  float secRadSmall = radius * 0.70;
  float secRadMedium = radius * 0.82;
  float secRadBig = radius * 0.73;
  float secRadBigger = radius * 0.84;
  float msInitial;
  
}