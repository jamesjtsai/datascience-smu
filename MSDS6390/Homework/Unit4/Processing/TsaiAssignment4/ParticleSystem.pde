// Modified from Daniel Shiffman's Smoke Particle System example

class ParticleSystem {
  
  ArrayList<Particle> particles;
  PVector origin;
  PImage img;
  int mode;
  
  ParticleSystem(int num, PVector v, PImage img_, int mode_) {
    particles = new ArrayList<Particle>();
    origin = v.copy();
    img = img_;
    mode = mode_;
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin, img, mode));
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  void applyForce(PVector dir) {
    for (Particle p: particles) {
      p.applyForce(dir);
    }
  }  

  void addParticle() {
    particles.add(new Particle(origin,img, mode));
  }

}