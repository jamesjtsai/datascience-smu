/*
Class:   MSDS6390 - Visualization 1
Date:    February 25, 2016
Name:    James Tsai
Title:   Assignment #6, Net Visualization
*/

void setup() {
  size(800, 800);
  initRides();
  initFlora();
}

void draw() {
  background(50, 100, 155);
  drawVine();
  drawFlora();
  drawSign();
  drawStatus();
}