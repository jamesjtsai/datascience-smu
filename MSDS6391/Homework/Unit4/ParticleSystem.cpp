//
//  ParticleSystem.cpp
//  mySketch
//
//  Created by James Tsai and Wid Sogata on 2/5/17.
//
//

#include "ParticleSystem.hpp"

ParticleSystem::ParticleSystem(){}
ParticleSystem::ParticleSystem(int num, ofVec3f v, ofImage img_){
    origin.set(v);
    img = img_;
    for (int i=0; i<num; i++) {
        Particle p = Particle(origin, img);
        particles.push_back(p);
    }
}

void ParticleSystem::run() {
    for (int i=particles.size()-1; i>=0; i--) {
        particles.at(i).run();
        if (particles.at(i).isDead()) {
            particles.erase(particles.begin()+i);
        }
    }
}

void ParticleSystem::applyForce(ofVec3f dir) {
    for (int i=particles.size()-1; i>=0; i--) {
        particles.at(i).applyForce(dir);
    }
}

void ParticleSystem::addParticle() {
    Particle n = Particle(origin, img);
    particles.push_back(n);
}

