// Modified from Daniel Shiffman's Smoke Particle System example

class Particle {
  
  PVector loc, vel, acc;
  float lifespan;
  PImage img;
  int mode;

  Particle(PVector l,PImage img_,int mode_) {
    acc = new PVector(0,0);
    float vx = randomGaussian()*0.3;
    float vy = randomGaussian()*0.3 - 1.0;
    vel = new PVector(vx,vy);
    loc = l.copy();
    lifespan = 100.0;
    img = img_;
    // pass in mode to determine what kind of flame and smoke
    mode = mode_;
  }

  void run() {
    update();
    render();
  }
  
  void applyForce(PVector f) {
    acc.add(f);
  }  

  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 2.5;
    acc.mult(0);
  }

  void render() {
    imageMode(CENTER);
    if (mode == 0) {
      // yellow portion of the flame
      tint(yellow,lifespan);
      image(img,loc.x,loc.y);
      // red portion of the flame
      tint(red,lifespan);
      image(img,loc.x,loc.y,img.width/3,img.height);
      // embers of the flame, located slightly above the flame
      fill(white,lifespan);
      ellipse(loc.x,loc.y/1.03,2,5);
    }
    if (mode == 1) {
      tint(white,lifespan);
      image(img,loc.x,loc.y);
    }
    if (mode == 2) {
      tint(lightGrey,lifespan);
      image(img,loc.x,loc.y);
    }
  }

  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}