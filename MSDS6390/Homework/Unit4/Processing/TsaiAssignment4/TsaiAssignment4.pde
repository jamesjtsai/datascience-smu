/*
Class:   MSDS6390 - Visualization 1
Date:    February 4, 2016
Name:    James Tsai

Title:   Assignment #4, Dynamic Composition II

Links:   http://captainberunov.deviantart.com/art/Connor-la-vengeance-340903523
         https://en.wikipedia.org/wiki/Ghost_Rider_(Johnny_Blaze)

Keywords: Ghost Rider, Flaming Skull, Johnny Blaze
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