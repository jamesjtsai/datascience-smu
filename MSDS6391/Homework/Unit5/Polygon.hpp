//
//  Polygon.hpp
//  Viz2Assignment5
//
//  Created by James Tsai and Wid Sogata on 2/14/17.
//
//

#ifndef Polygon_hpp
#define Polygon_hpp

#include "ofMain.h"
#include <stdio.h>
#include <iostream>

namespace Assignment5 {
    class Polygon {
    private:
        ofVec2f position;
        float size;
        int sides;
        ofColor fillCol;
        ofVec2f* vecs;
        void _init();
        
    public:
        Polygon();
        Polygon(int sides, float size, const ofVec2f& position);
        Polygon(int sides, float size, ofColor fillCol, const ofVec2f& position);
        
        ~Polygon();
        Polygon(const Polygon& p);
        Polygon& operator=(const Polygon& p);
        
        void display();
    };
}

#endif /* Polygon_hpp */
