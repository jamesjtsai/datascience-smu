//
//  Particle.cpp
//  mySketch
//
//  Created by James Tsai and Wid Sogata on 2/5/17.
//
//

#include "Particle.hpp"

Particle::Particle() {
}

double drand()   /* uniform distribution, (0..1] */
{
    return (rand() + 1.0) / (RAND_MAX + 1.0);
}

double random_normal()  /* normal distribution, centered on 0, std dev 1 */
{
    return sqrt(-2 * log(drand())) * cos(2 * PI*drand());
}

Particle::Particle(ofVec3f l, ofImage img_){
    acc = ofVec3f(0, 0, 0);
    float vx = random_normal()*0.3;
    float vy = random_normal()*0.3 - 1.0;
    vel = ofVec3f(vx, vy);
    loc.set(l);
    lifespan = 100.0;
    img = img_;
}

void Particle::run() {
    update();
    render();
}

void Particle::applyForce(ofVec3f f) {
    acc += f;
}

void Particle::update() {
    vel += acc;
    loc += vel;
    lifespan -= 2.5;
    acc *= 0.0;
}

void Particle::render() {
    ofEnableAlphaBlending();
    ofSetColor(255, 0, 0, lifespan);
    img.draw(loc.x, loc.y);
}

bool Particle::isDead() {
    if (lifespan <= 0.0)
        return TRUE;
    else
        return FALSE;
}
