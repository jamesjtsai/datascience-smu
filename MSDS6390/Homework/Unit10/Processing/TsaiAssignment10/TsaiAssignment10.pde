/*
Class:   MSDS6390 - Visualization 1
Date:    April 26, 2016
Name:    James Tsai
Title:   Assignment #10, 3D Java Visualization
*/

import beads.*;
import org.jaudiolibs.beads.*;
import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam camera;
Spheres s;
Instrument i;
MusicLoader m;

void setup() {
  size(1000, 1000, P3D);
  camera = new PeasyCam(this, width/2, height/2, 0, 1300);
  camera.setMinimumDistance(.001);
  camera.setMaximumDistance(5000);
  camera.rotateZ(-1.25);
  camera.rotateY(0.55);
  camera.rotateX(-.75);
  s = new Spheres();
  i = new Instrument(s);
  m = new MusicLoader();
}

void draw() {
  background(80);
  s.render();
  i.play(m.getSong());
}