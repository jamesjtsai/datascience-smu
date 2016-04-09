/*
Class:   MSDS6390 - Visualization 1
Date:    April 9, 2016
Name:    James Tsai
Title:   Assignment #9, Advanced OOP
Links:   http://www.sinn.de/en/Modell/U1.htm
         http://www.hammacher.com/Product/86683
         https://en.wikipedia.org/wiki/Binary_clock
*/

Canvas cv;
ArrayList<Clock> clocks;

void setup() {
  size(1600, 800);
  cv = new Canvas();
  clocks = new ArrayList<Clock>();
  clocks.add(new AnalogClock());
  clocks.add(new ReadingClock());
  clocks.add(new BinaryClock());
}

void draw() {
  //scale(0.85);
  cv.render();
  for(Clock c: clocks) {
   c.time();
  }
}