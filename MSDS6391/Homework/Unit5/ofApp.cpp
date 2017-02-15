//
//  Polygon.hpp
//  Viz2Assignment5
//
//  Created by James Tsai and Wid Sogata on 2/14/17.
//
//

#include "ofApp.h"

ofApp::~ofApp() {
    delete [] polys;
    polys = NULL;
}

//--------------------------------------------------------------
void ofApp::setup() {
    numOfPolygons = (int)ofRandom(25, 50);
    polys = new Assignment5::Polygon[numOfPolygons];
    for (int i=0; i<numOfPolygons; i++) {
        polys[i] = Assignment5::Polygon((int)ofRandom(3, 20), ofRandom(50, 100), ofColor(rand(), rand(), rand()), ofVec2f(ofRandom(ofGetWidth()), ofRandom(ofGetHeight())));
    }
}

//--------------------------------------------------------------
void ofApp::update() {
}

//--------------------------------------------------------------
void ofApp::draw() {
    for (int i=0; i<numOfPolygons; i++) {
        polys[i].display();
    }
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key) {
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ) {
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button) {
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button) {
}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y) {
}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y) {
}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h) {
}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg) {
}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo) {
}
