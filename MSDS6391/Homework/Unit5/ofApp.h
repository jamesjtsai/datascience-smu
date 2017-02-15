//
//  Polygon.hpp
//  Viz2Assignment5
//
//  Created by James Tsai and Wid Sogata on 2/14/17.
//
//

#pragma once

#include "ofMain.h"
#include "Polygon.hpp"

class ofApp : public ofBaseApp{

	public:
        ~ofApp();
    
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
    
        Assignment5::Polygon* polys;
        int numOfPolygons;
};
