var systemla, systemlb, systemlc, systemld, systemle, systemlf, systemlg, systemlh;
var systemra, systemrb, systemrc, systemrd, systemre, systemrf, systemrg, systemrh;

function setup() {
  createCanvas(1024, 1024);
  noStroke();

  systemlh = new ParticleSystem(createVector(width/1.99, 372.5), boolean(0));
  systemlg = new ParticleSystem(createVector(width/1.99, 426), boolean(0));
  systemlf = new ParticleSystem(createVector(width/1.99, 479.5), boolean(0));
  systemle = new ParticleSystem(createVector(width/1.99, 533), boolean(0));
  systemld = new ParticleSystem(createVector(width/1.99, 586.5), boolean(0));
  systemlc = new ParticleSystem(createVector(width/1.99, 640), boolean(0));
  systemlb = new ParticleSystem(createVector(width/1.99, 693.5), boolean(0));
  systemla = new ParticleSystem(createVector(width/1.99, 747), boolean(0));


  systemrh = new ParticleSystem(createVector(width/1.62, 372.5), boolean(1));
  systemrg = new ParticleSystem(createVector(width/1.62, 426), boolean(1));
  systemrf = new ParticleSystem(createVector(width/1.62, 479.5), boolean(1));
  systemre = new ParticleSystem(createVector(width/1.62, 533), boolean(1));
  systemrd = new ParticleSystem(createVector(width/1.62, 586.5), boolean(1));
  systemrc = new ParticleSystem(createVector(width/1.62, 640), boolean(1));
  systemrb = new ParticleSystem(createVector(width/1.62, 693.5), boolean(1));
  systemra = new ParticleSystem(createVector(width/1.62, 747), boolean(1));
}

function draw() {
  var s = second();
  background(0);
  noStroke();

  if (s>1) {
    systemla.addParticle();
    systemla.run();
    systemra.addParticle();
    systemra.run();
  }

  if (s>2) {
    systemlb.addParticle();
    systemlb.run();
    systemrb.addParticle();
    systemrb.run();
  }

  if (s>3) {
    systemlc.addParticle();
    systemlc.run();
    systemrc.addParticle();
    systemrc.run();
  }

  if (s>4) {
    systemld.addParticle();
    systemld.run();
    systemrd.addParticle();
    systemrd.run();
  }

  if (s>5) {
    systemle.addParticle();
    systemle.run();
    systemre.addParticle();
    systemre.run();
  }

  if (s>6) {
    systemlf.addParticle();
    systemlf.run();
    systemrf.addParticle();
    systemrf.run();

    systemlg.addParticle();
    systemlg.run();
    systemrg.addParticle();
    systemrg.run();

    systemlh.addParticle();
    systemlh.run();
    systemrh.addParticle();
    systemrh.run();
  }
  drawTaipei101();
}

function launch(stage) {


}

function drawTaipei101() {
  noFill();
  stroke(255);
  // draw top
  push();
  translate(width/2, height/6);
  quad(55, 0, 45, 100, 75, 100, 65, 0);
  pop();
  push();
  translate(width/2, height/3.75);
  quad(25, 0, 40, 75, 85, 75, 100, 0);
  quad(25, 75, 25, 90, 100, 90, 100, 75);
  pop();
  // draws bottom part of building
  push();
  translate(width/2, height/3.3);
  for (var i=0; i<8; i++) {
    translate(0, 55);
    quad(0, 0, 25, 55, 100, 55, 125, 0);
  }
  translate(0, 55);
  quad(15, 0, 0, 110, 125, 110, 110, 0);
  pop();
}

var Particle = function(position, right) {
  this.acceleration = createVector(0, 0.1);
  
  if (right) {
    this.velocity = createVector(random(5, 3), random(-5, -3));
  } else {
    this.velocity = createVector(random(-5, -3), random(-5, -3));
  }
  
  //this.velocity = createVector(random(5, 3), random(-5, -3));
  this.position = position.copy();
  this.lifespan = random(100, 2000);
  this.d = (2000-this.lifespan)/100;
};

Particle.prototype.run = function() {
  this.update();
  this.display();
  this.boundary();
};

// Method to update position
Particle.prototype.update = function(){
  this.velocity.add(this.acceleration);
  this.position.add(this.velocity);
  this.lifespan -= 15;
};

// Method to display
Particle.prototype.display = function() {
  fill(0, 255, 0, this.lifespan);
  ellipse(this.position.x, this.position.y, this.d, this.d);
};

Particle.prototype.boundary = function() {
  if (this.position.y > height/1.2) {
    y = this.velocity.y;
    x = this.velocity.x;
    y *= -1;
    this.velocity = createVector(x, y);
  }
}

// Is the particle still useful?
Particle.prototype.isDead = function(){
  if (this.lifespan < 0) {
    return true;
  } else {
    return false;
  }
};

var ParticleSystem = function(position, right) {
  this.origin = position.copy();
  this.right = right;
  this.particles = [];
};

ParticleSystem.prototype.addParticle = function() {
  this.particles.push(new Particle(this.origin, this.right));
};

ParticleSystem.prototype.run = function() {
  for (var i = this.particles.length-1; i >= 0; i--) {
    var p = this.particles[i];
    p.run();
    if (p.isDead()) {
      this.particles.splice(i, 1);
    }
  }
};