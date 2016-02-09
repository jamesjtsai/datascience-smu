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
    if (mode == 0) {
      fill(brown,lifespan);
      imageMode(CENTER);
      tint(yellow,lifespan);
      image(img,loc.x,loc.y);
      tint(red,lifespan);
      image(img,loc.x,loc.y,img.width/3,img.height);
      fill(white,lifespan+50);
      ellipse(loc.x,loc.y,1,5);
    }
    if (mode == 1) {
      imageMode(CENTER);
      tint(white,lifespan);
      image(img,loc.x,loc.y);
    }
    if (mode == 2) {
      imageMode(CENTER);
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