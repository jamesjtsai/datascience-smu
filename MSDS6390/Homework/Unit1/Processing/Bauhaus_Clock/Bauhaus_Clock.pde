/*
Class:   MSDS6390 - Visualization 1
Date:    January 14, 2016
Name:    James Tsai

Title:   "Bauhaus Clock" - Design inspired by my German Diving Watch (Sinn U1).

Links:   http://www.sinn.de/en/Modell/U1.htm
         http://gearpatrol.com/2011/12/15/timekeeping-a-guide-to-german-watches/
         http://www.colourlovers.com/palette/593047/Bauhaus
         
Palette: Charcoal         Hex: 222222   RGB: 34,34,34
         Fluff            Hex: F0F3F7   RGB: 240,243,247
         Red is alive     Hex: 99281A   RGB: 153,40,26
         Strong yellow    Hex: BFA21A   RGB: 191,162,26
         Search for blue  Hex: 144184   RGB: 20,65,132

Keywords:Bauhaus, Stark, Precision, Mechanical Art
*/

// Declare Bauhaus palette
color charcoal = #222222;
color fluff = #F0F3F7;
color red = #99281A;
color yellow = #BFA21A;
color blue = #144184;

// Declare clock diameter
float clockDiameter;
int clockX, clockY;

// Declare initial second hand position (for smooth sweep only)
float msInitial;

// Declare seconds hand radii
float secRadSmall, secRadMedium, secRadBig, secRadBigger;

// Declare minutes hand radii
float minRadSmall, minRadMedium, minRadBig;

// Declare hours hand radii
float hrsRadSmall, hrsRadMedium, hrsRadBig;

void setup() {
  size(800, 800);
  
  // Clock dimensions
  int radius = min(width, height) / 2;
  clockDiameter = radius * 1.8;
  clockX = width / 2;
  clockY = height / 2;
  
  // Radii for seconds
  secRadSmall = radius * 0.70;
  secRadMedium = radius * 0.72;
  secRadBig = radius * 0.73;
  secRadBigger = radius * 0.74;
  
  // Radii for minutes
  minRadSmall = radius * 0.10;
  minRadMedium = radius * 0.62;
  minRadBig = radius * 0.70;
  
  // Radii for hours
  hrsRadSmall = radius * 0.20;
  hrsRadMedium = radius * 0.40;
  hrsRadBig = radius * 0.50;
  
  // Initial position for seconds hand
  // Take the current seconds and convert to millisecond equivalent
  // Can't use millis() function here as it is a timer function and return actual milliseconds of the current time
  // This will cause the clock to be at most off 1 millisecond
  msInitial = second() * 1000;
}

void draw() {
  // Draw the clock background
  background(charcoal);
  
  // Draw the clock
  fill(blue);
  // charcoal color looks interesting too (higher contrast)
  // fill(charcoal);
  noStroke();
  ellipse(clockX, clockY, clockDiameter, clockDiameter);
  
  // Draw the 60 minute ticks
  // Use line to connect outer and inner circles to form ticks
  stroke(fluff);
  strokeWeight(10);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x1 = clockX + cos(angle) * secRadMedium;
    float y1 = clockY + sin(angle) * secRadMedium;
    float x2 = clockX + cos(angle) * secRadBigger;
    float y2 = clockY + sin(angle) * secRadBigger;
    line(x1, y1, x2, y2);
  }
  
  // Draw rectangular large tick for 3 o'clock position
  fill(fluff);
  float angle=radians(0);
  float x = clockX + cos(angle) * secRadMedium;
  float y = clockY + sin(angle) * secRadMedium;
  rect(x-95, y-25, 75, 45);
  
  // Draw rectangular large tick for 6 o'clock position
  angle=radians(90);
  x = clockX + cos(angle) * secRadMedium;
  y = clockY + sin(angle) * secRadMedium;
  rect(x-25, y-95, 45, 75);
  
  // Draw rectangular large tick for 9 o'clock position
  angle=radians(180);
  x = clockX + cos(angle) * secRadMedium;
  y = clockY + sin(angle) * secRadMedium;
  rect(x+20, y-25, 75, 45);
  
  // Draw rectangular large tick for 12 o'clock position
  angle=radians(270);
  x = clockX + cos(angle) * secRadMedium;
  y = clockY + sin(angle) * secRadMedium;
  rect(x-25, y+20, 45, 75);
  rect(x-25, y+120, 45, 20);
  
  // Draw large tick for 20 minute mark
  strokeWeight(30);
  angle=radians(28);
  float x1 = clockX + cos(angle) * secRadMedium;
  float y1 = clockY + sin(angle) * secRadMedium;
  angle=radians(35);
  float x2 = clockX + cos(angle) * secRadMedium;
  float y2 = clockY + sin(angle) * secRadMedium;
  line(x1-20, y1-20, x2-20, y2-20);
  
  // Draw large tick for 25 minute mark
  angle=radians(55);
  x1 = clockX + cos(angle) * secRadMedium;
  y1 = clockY + sin(angle) * secRadMedium;
  angle=radians(62);
  x2 = clockX + cos(angle) * secRadMedium;
  y2 = clockY + sin(angle) * secRadMedium;
  line(x1-20, y1-20, x2-20, y2-20);
  
  // Draw large tick for 35 minute mark
  angle=radians(118);
  x1 = clockX + cos(angle) * secRadMedium;
  y1 = clockY + sin(angle) * secRadMedium;
  angle=radians(125);
  x2 = clockX + cos(angle) * secRadMedium;
  y2 = clockY + sin(angle) * secRadMedium;
  line(x1+20, y1-20, x2+20, y2-20);
  
  // Draw large tick for 40 minute mark
  angle=radians(145);
  x1 = clockX + cos(angle) * secRadMedium;
  y1 = clockY + sin(angle) * secRadMedium;
  angle=radians(152);
  x2 = clockX + cos(angle) * secRadMedium;
  y2 = clockY + sin(angle) * secRadMedium;
  line(x1+20, y1-20, x2+20, y2-20);
  
  // Draw large tick for 50 minute mark
  angle=radians(208);
  x1 = clockX + cos(angle) * secRadMedium;
  y1 = clockY + sin(angle) * secRadMedium;
  angle=radians(215);
  x2 = clockX + cos(angle) * secRadMedium;
  y2 = clockY + sin(angle) * secRadMedium;
  line(x1+20, y1+20, x2+20, y2+20);
  
  // Draw large tick for 55 minute mark
  angle=radians(235);
  x1 = clockX + cos(angle) * secRadMedium;
  y1 = clockY + sin(angle) * secRadMedium;
  angle=radians(242);
  x2 = clockX + cos(angle) * secRadMedium;
  y2 = clockY + sin(angle) * secRadMedium;
  line(x1+20, y1+20, x2+20, y2+20);
  
  // Draw large tick for 5 minute mark
  angle=radians(298);
  x1 = clockX + cos(angle) * secRadMedium;
  y1 = clockY + sin(angle) * secRadMedium;
  angle=radians(305);
  x2 = clockX + cos(angle) * secRadMedium;
  y2 = clockY + sin(angle) * secRadMedium;
  line(x1-20, y1+20, x2-20, y2+20);
  
  // Draw large tick for 10 minute mark
  angle=radians(325);
  x1 = clockX + cos(angle) * secRadMedium;
  y1 = clockY + sin(angle) * secRadMedium;
  angle=radians(332);
  x2 = clockX + cos(angle) * secRadMedium;
  y2 = clockY + sin(angle) * secRadMedium;
  line(x1-20, y1+20, x2-20, y2+20);
  
  // Angles for sin() and cos() start at 3 o'clock position;
  // Subtract HALF_PI to make them start at the top
  // Smooth second hand sweep, add starting second hand position + milliseconds timer
  float s = map(msInitial+millis(), 0, 60000, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  /* Can also use regular second hand sweep usings seconds
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI; */
  
  // Draw hands of the clock
  // Hour Hand
  // Draw inner circle to create the mounting hole
  stroke(fluff);
  ellipse(clockX, clockY, 41, 41);
  // Draw the yellow parts of the hour hand
  stroke(yellow);
  strokeWeight(42);
  line(clockX, clockY, clockX + cos(h) * hrsRadMedium, clockY + sin(h) * hrsRadMedium);
  strokeWeight(20);
  line(clockX, clockY, clockX + cos(h) * hrsRadBig, clockY + sin(h) * hrsRadBig);
  // Draw the red part of the hour hand
  stroke(red);
  strokeWeight(40);
  line(clockX, clockY, clockX + cos(h) * hrsRadSmall, clockY + sin(h) * hrsRadSmall);
  // Draw hour hand mount
  stroke(red);
  ellipse(clockX, clockY, 28, 28);
  
  // Minute Hand
  // Draw yellow circle to be part of minute hand mount
  stroke(yellow);
  ellipse(clockX, clockY, 22, 22);
  // Draw the yellow parts of the minute hand
  stroke(yellow);
  strokeWeight(42);
  line(clockX, clockY, clockX + cos(m) * minRadMedium, clockY + sin(m) * minRadMedium);
  strokeWeight(20);
  line(clockX, clockY, clockX + cos(m) * minRadBig, clockY + sin(m) * minRadBig);
  // Draw the red part of the minute hand
  stroke(red);
  strokeWeight(40);
  line(clockX, clockY, clockX + cos(m) * minRadSmall, clockY + sin(m) * minRadSmall);
  // Draw the minute hand mount
  ellipse(clockX, clockY, 20, 20);
  
  // Second Hand
  // Draw yellow part of the second hand
  stroke(yellow);
  strokeWeight(17);
  line(clockX, clockY, clockX + cos(s) * secRadBig, clockY + sin(s) * secRadBig);
  // Draw red part of the second hand
  stroke(red);
  strokeWeight(15);
  line(clockX, clockY, clockX + cos(s) * secRadSmall, clockY + sin(s) * secRadSmall);
}