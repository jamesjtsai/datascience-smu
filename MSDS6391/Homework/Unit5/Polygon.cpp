//
//  Polygon.hpp
//  Viz2Assignment5
//
//  Created by James Tsai and Wid Sogata on 2/14/17.
//
//

#include "Polygon.hpp"

void Assignment5::Polygon::_init() {
    std::cout << "_init() function" << std::endl;
    vecs = new ofVec2f[sides];
    float theta = 0;
    for (int i=0; i<sides; i++) {
        float x = cos(theta)*size;
        float y = sin(theta)*size;
        vecs[i] = ofVec2f(x, y);
        theta += TWO_PI/sides;
    }
}

Assignment5::Polygon::Polygon() {
    std::cout << "default polygon constructor" << std::endl;
    position = ofVec2f(ofGetWidth()/2, ofGetHeight()/2);
    size = 100;
    sides = 6;
    _init();
}

Assignment5::Polygon::Polygon(int sides, float size, const ofVec2f& position):
sides(sides), size(size), position(position) {
    cout << "polygon overloaded constructor" << std::endl;
    _init();
}

Assignment5::Polygon::Polygon(int sides, float size, ofColor fillCol, const ofVec2f& position):
sides(sides), size(size), fillCol(fillCol), position(position) {
    cout << "polygon overloaded constructor" << std::endl;
    _init();
}

Assignment5::Polygon::~Polygon() {
    std::cout << "polygon destructor" << std::endl;
    delete [] vecs;
    vecs = NULL;
}

Assignment5::Polygon::Polygon(const Polygon& p) {
    std::cout << "polygon copy constructor" << std::endl;
    position = p.position;
    size = p.size;
    sides = p.sides;
    fillCol = p.fillCol;
    _init();
}

Assignment5::Polygon& Assignment5::Polygon::operator=(const Polygon& p) {
    std::cout << "overloaded polygon assignment operator" << std::endl;
    if (this != &p) {
        position = p.position;
        size = p.size;
        sides = p.sides;
        fillCol = p.fillCol;
        delete[] vecs;
        vecs = NULL;
        _init();
    }
    return *this;
}

void Assignment5::Polygon::display() {
    ofSetColor(fillCol);
    ofPushMatrix();
    ofTranslate(position.x, position.y);
    ofRotate(ofGetFrameNum());
    ofBeginShape();
    for (int i=0; i<sides; i++) {
        ofVertex(vecs[i].x, vecs[i].y);
    }
    ofEndShape();
    ofPopMatrix();
}
