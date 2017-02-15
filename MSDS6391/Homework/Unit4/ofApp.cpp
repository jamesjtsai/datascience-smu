//
//  ofApp.cpp
//  mySketch
//
//  Created by James Tsai and Wid Sogata on 2/5/17.
//
//

#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0, 0, 0);
    ofSetWindowShape(640, 360);
    ofSetWindowTitle("Smoke Particles");
    img.load("texture.png");
    ps = ParticleSystem(0, ofVec3f(ofGetWindowWidth() / 2, ofGetWindowHeight() - 100), img);
}

//--------------------------------------------------------------
void ofApp::update(){
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    img.draw(ofGetWindowWidth()/2, 400);
    //ofBackground(0, 0, 0);
    float dx = ofMap(mouseX, 0, ofGetWindowWidth(), -0.2, 0.2);
    // Calculate a "wind" force based on mouse horizontal position
    ofVec3f wind = ofVec3f(dx, 0);
    acc += wind;
    ps.applyForce(wind);
    ps.run();
    for (int i = 0; i < 2; i++) {
        ps.addParticle();
    }
    // Draw an arrow representing the wind force
    drawVector(wind, ofVec3f(ofGetWindowWidth()/2, 50), 500);
}

//// Renders a vector object 'v' as an arrow and a position 'loc'
void ofApp::drawVector(ofVec3f v, ofVec3f loc, float scayl) {
    ofPushMatrix();
    float arrowsize = 4;
    // Translate to position to render vector
    ofTranslate(loc.x, loc.y);
    ofSetColor(255);
    ofFill();
    //// Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    ofVec3f v1(1, 0, 0);
    ofRotate(v.angle(v1));
    //// Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.length()*scayl;
    //// Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    ofLine(0, 0, len, 0);
    ofLine(len, 0, len - arrowsize, +arrowsize / 2);
    ofLine(len, 0, len - arrowsize, -arrowsize / 2);
    ofPopMatrix();
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){
}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){
}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){
}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){
}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){
}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){
}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){
}
