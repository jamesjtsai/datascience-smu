/*
Class:   MSDS6390 - Visualization 1
Date:    January 28, 2016
Name:    James Tsai, Stacy Manning

Title:   Assignment #3, Dynamic Composition I
         Movements/Changes - Windmill, Sun, Clouds, Stars, Sky, Window, Ground

Links:   http://www.htmlcsscolor.com/hex/17BDE8
         http://www.colourlovers.com/palette/264688/Grass_Green

Keywords:Dutch, Windmill
*/

// Declare color palette
// sky colors
color blackPearl1 = #031A1F;
color blackPearl2 = #042027;
color blackPearl3 = #052831;
color nordic = #06323D;
color sherpaBlue1 = #073E4C;
color sherpaBlue2 = #094E5F;
color blueLagoon = #0B6177;
color easternBlue = #0E7995;
color bondiBlue = #1297BA;
color deepSkyBlue = #17BDE8;
// other colors
color blue = #144184;
color brick = #96160B;
color charcoal = #222222;
color fluff = #F0F3F7;
color grass = #01A611;
color grey = #808080;
color meadow = #005C09;
color white = #FFFFFF;
color yellow = #FFFF00;

// Declare grid size
float gridUnit = 0.015;

// Normalize units
float guWidth;
float guHeight;

// Declare seconds to determine current cycle
int seconds;

// Random positions for stars
float[] rX = new float[100]; 
float[] rY = new float[100];
float[] rI = new float[100]; 
float[] rO = new float[100];

// Random cloud sizes and speed
float[] cS = new float[3];
float[] cX = new float[3];
float[] cY = new float[3];
float[] cR = new float[3];

// Array of sky colors
color[] skyColors = new color[10];

// Declare windmill window color
color windowColor;

// Declare cloud color
color cloudColor;

// Declare ground color
color groundColor;

void setup() {
  size(1000, 1000);
  guWidth = width*gridUnit;
  guHeight = height*gridUnit;
  initStar();
  initSky();
  initWindow();
  initCloud();
  initGround();
}

void draw() {
  // draw sky
  drawSky();
  // draw windmill - pass windmill coordinates, size, number of arms, speed
  drawWindmill(width/1.35, height/1.5, 15, 7, 150);
  // draw ground - pass coordinates
  drawGround(0, height/1.1);
  drawClock();
}