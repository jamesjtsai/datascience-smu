/*
Class:   MSDS6390 - Visualization 1
Date:    March 30, 2016
Name:    James Tsai
Title:   Assignment #8, Midterm
*/

// declare globals
String[] photos = { "icecream.jpg", "milkyway.jpg", "simpsons.jpg" };

Images i;
PixelCipher p;
Visualizer v;

void setup() {
  // 2x2 640x360 panels
  size(1280, 720);
  // extract the images to be used for encrypting messages
  i = new Images(photos);
  // parse the pixels from the images
  p = new PixelCipher(i);
  // visualize the encryption process
  v = new Visualizer(p);
}

void draw() {
  background(128);
  i.display();
  v.rgbbits();
  v.calculations();
  v.keyboard();
  v.rgbcipher();
  v.cleartext();
  v.grid();
}

void keyPressed() {
  if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) p.setCurrentTyped(key);
}

void mouseClicked() {
  if (dist(mouseX, mouseY, 0, 0) <= 360) i.next();
}