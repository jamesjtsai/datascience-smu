/*
Class:   MSDS6390 - Visualization 1
Date:    February 4, 2016
Name:    James Tsai

Title:   Assignment #4, Dynamic Composition II

Links:

Keywords: Ghost Rider, Flaming Skull
*/

float gridUnit;
float guWidth;
float guHeight;
float timer;
PImage img;

void setup() {
 size(625, 875);
 img = loadImage("texture.png");
 gridUnit = 0.025;
 guWidth=width*gridUnit;
 guHeight=height*gridUnit;
 timer = 0;
 initFlames();
 
}

void draw() {
  drawBackground();
  drawHood();
  drawInner();
  drawSkull();
  drawEyes();
  drawNose();
  drawMouth();
  drawFlames();
}