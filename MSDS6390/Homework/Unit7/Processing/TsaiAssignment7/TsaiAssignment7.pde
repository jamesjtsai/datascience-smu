/*
Class:   MSDS6390 - Visualization 1
Date:    March 12, 2016
Name:    James Tsai
Title:   Assignment #7, OOP
*/

String[] photos = {"simpsons.jpg", "kylo.jpg", "tesla.jpg", "money.jpg",
                   "bread.jpg", "canada.jpg", "milkyway.jpg"};
Data d;
Visualizer v;

void setup() {
  size(1280, 720);
  d = new Data(photos);
  v = new Visualizer(d);
}

void draw() {
  background(128, 128, 128);
  d.next();
  v.photos();
  v.spin();
  v.wave();
  v.tiles();
}