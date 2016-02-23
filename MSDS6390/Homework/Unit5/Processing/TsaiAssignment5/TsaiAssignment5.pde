/*
Class:   MSDS6390 - Visualization 1
Date:    February 18, 2016
Name:    James Tsai
Title:   Assignment #5, Imaging Visualization
*/

void setup() {
  size(640, 1080);
  initPhotos();
  initTiles();
  initWave();
}

void draw() {
  background(128, 128, 128);
  traversePhotos();
  drawPhoto();
  drawTiles();
  drawWave();
}