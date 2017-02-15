//
//  Particle.hpp
//  mySketch
//
//  Created by James Tsai and Wid Sogata on 2/5/17.
//
//

#ifndef Particle_hpp
#define Particle_hpp

#include <stdio.h>
#include "ofmain.h"

class Particle {
    
protected:
    ofVec3f loc;
    ofVec3f vel;
    ofVec3f acc;
    float lifespan;
    ofImage img;
    
public:
    Particle();
    Particle(ofVec3f pos, ofImage img);
    void run();
    void applyForce(ofVec3f f);
    void update();
    void render();
    bool isDead();
};

#endif /* Particle_hpp */
