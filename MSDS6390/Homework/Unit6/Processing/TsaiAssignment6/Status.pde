void drawStatus() {
  int i=99;
  if(dist(mouseX, mouseY, 100, 667) <= 30)
    i=0;
  if(dist(mouseX, mouseY, 100, 507) <= 30)
    i=1;
  if(dist(mouseX, mouseY, 130, 369) <= 30)
    i=2;
  if(dist(mouseX, mouseY, 182, 253) <= 30)
    i=3;
  if(dist(mouseX, mouseY, 253, 166) <= 30)
    i=4;
  if(dist(mouseX, mouseY, 335, 105) <= 30)
    i=5;
  if(dist(mouseX, mouseY, 415, 75) <= 30)
    i=6;
  if(dist(mouseX, mouseY, 495, 65) <= 30)
    i=7;
  if(dist(mouseX, mouseY, 565, 75) <= 30)
    i=8;
  if(dist(mouseX, mouseY, 625, 100) <= 20)
    i=9;
  if(dist(mouseX, mouseY, 668, 133) <= 20)
    i=10;
  if(dist(mouseX, mouseY, 700, 175) <= 15)
    i=11;
  if(dist(mouseX, mouseY, 718, 212) <= 15)
    i=12;
  if(dist(mouseX, mouseY, 726, 252) <= 15)
    i=13;
  if(dist(mouseX, mouseY, 724, 286) <= 15)
    i=14;
  if(dist(mouseX, mouseY, 716, 317) <= 15)
    i=15;
  if(dist(mouseX, mouseY, 703, 341) <= 15)
    i=16;
  if(dist(mouseX, mouseY, 687, 360) <= 10)
    i=17;
  if(dist(mouseX, mouseY, 670, 374) <= 10)
    i=18;
  if(dist(mouseX, mouseY, 654, 384) <= 10)
    i=19;
  if(dist(mouseX, mouseY, 635, 388) <= 10)
    i=20;
  if(dist(mouseX, mouseY, 620, 388) <= 10)
    i=21;
  if(dist(mouseX, mouseY, 607, 387) <= 10)
    i=22;
  if(dist(mouseX, mouseY, 595, 383) <= 10)
    i=23;
  if(dist(mouseX, mouseY, 585, 376) <= 5)
    i=24;
  if(dist(mouseX, mouseY, 578, 369) <= 2)
    i=25;
  if(dist(mouseX, mouseY, 573, 364) <= 2)
    i=26;
  if(dist(mouseX, mouseY, 570, 357) <= 2)
    i=27;
  if(dist(mouseX, mouseY, 567, 350) <= 2)
    i=28;
  if(dist(mouseX, mouseY, 567, 343) <= 2)
    i=29;
  // make sure there is something to display in that position
  if (rides.length >= (i+1))
    displayStatus(i);
}

PFont font;
void drawSign() {
  noStroke();
  pushMatrix();
  translate(width/1.3, height/1.3);
  mickey(1.25);
  // pole to hold mickey sign
  rect(-20, 0, 40, 200);
  fill(0);
  if (pi == 0)
    font = createFont("waltograph42.ttf", 40);
  if (pi == 1)
    font = createFont("spacestation77.ttf", 32);
  if (pi == 2)
    font = createFont("junglefe.ttf", 25);
  if (pi == 3)
    font = createFont("storybook.ttf", 25);
  textFont(font);
  textAlign(CENTER);
  text(displays.get(pi), 0, -55);
  textSize(20);
  text("average wait", 0, -20);
  fill(255);
  // rectangle for average wait time
  rect(-40, -15, 80, 50);
  fill(0);
  textSize(50);
  text((int)getAverageWaitTime(), 0, 25);
  textSize(20);
  text("minutes", 0, 55);
  popMatrix();
}

void displayStatus(int i) {
  noStroke();
  fill(255);
  ellipse(475, 240, 400, 100);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  String ride = rides[i].getRide();
  if (ride.length() > 33) {
    textSize(15);
  }
  if (ride.length() > 52) {
    textSize(10);
  }
  if (ride.length() > 56) {
    textSize(9);
  }
  text(ride, 475, 225);
  textSize(20);
  text(rides[i].getLocation(), 475, 250);
  text(rides[i].getTime()+" minutes", 475, 275);
}