/*
Class:   MSDS6390 - Visualization 1
Date:    March 12, 2016
Name:    James Tsai
Title:   Assignment #7, OOP
*/

// declare globals
String[] photos = {"simpsons.jpg", "kylo.jpg", "tesla.jpg", "money.jpg",
                   "bread.jpg", "canada.jpg", "milkyway.jpg"};
Data d;
Visualizer v;

void setup() {
  // 2x2 640x360 panels
  size(1280, 720);
  // instantiate Data object
  d = new Data(photos);
  // instantiate Visualizer object
  v = new Visualizer(d);
}

void draw() {
  // neutral background
  background(128);
  // traverse photos
  d.next();
  // display visualizations
  v.photos();
  v.vortex();
  v.wave();
  v.tiles();
  v.grid();
  // enable mouse interaction
  v.interact();
}

void mouseClicked() {
  // enable/disable image inversion
  d.setInvert();
}

  