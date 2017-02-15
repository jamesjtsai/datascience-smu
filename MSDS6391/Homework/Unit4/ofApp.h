//
//  ofApp.h
//  mySketch
//
//  Created by James Tsai and Wid Sogata on 2/5/17.
//
//

#pragma once

#include "ofMain.h"
#include "ParticleSystem.hpp"
#include "Particle.hpp"

class ofApp : public ofBaseApp{
    
public:
    void setup();
    void update();
    void draw();
    void keyPressed(int key);
    void keyReleased(int key);
    void mouseMoved(int x, int y );
    void mouseDragged(int x, int y, int button);
    void mousePressed(int x, int y, int button);
    void mouseReleased(int x, int y, int button);
    void mouseEntered(int x, int y);
    void mouseExited(int x, int y);
    void windowResized(int w, int h);
    void dragEvent(ofDragInfo dragInfo);
    void gotMessage(ofMessage msg);
    void drawVector(ofVec3f v, ofVec3f loc, float scayl);
    ofImage img;
    ParticleSystem ps;
    ofVec3f acc;
};
