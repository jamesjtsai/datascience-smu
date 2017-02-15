//
//  ParticleSystem.hpp
//  mySketch
//
//  Created by James Tsai and Wid Sogata on 2/5/17.
//
//

#ifndef ParticleSystem_hpp
#define ParticleSystem_hpp

#include <stdio.h>
#include "Particle.hpp"

class ParticleSystem: public Particle {
protected:
    std::vector<Particle> particles;
    ofVec3f origin;
    ofImage img;
public:
    ParticleSystem();
    ParticleSystem(int num, ofVec3f v, ofImage img);
    void run();
    void applyForce(ofVec3f dir);
    void addParticle();
    
};

#endif /* ParticleSystem_hpp */
