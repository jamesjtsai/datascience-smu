var fireworks = [];
var locations = [372.5, 426, 479.5, 533, 586.5, 640, 693.5, 747];

function setup() {
  createCanvas(1024, 1024);
  noStroke();
  // create particle systems for all possible locations
  for (var i=0; i<locations.length; i++) {
    fireworks.push(new ParticleSystem(createVector(width/1.99, locations[i]), boolean(0), boolean(1)));
    fireworks.push(new ParticleSystem(createVector(width/1.62, locations[i]), boolean(1), boolean(1)));
  }
  fireworks.push(new ParticleSystem(createVector(width/1.79, 160), boolean(1), boolean(0)));
}

function draw() {
  ms = millis();
  background(25);
  noStroke();
  textSize(36);
  if (ms>1000 && ms<1250) {
    background(70);
    fireworks[15].addParticle();
    fireworks[14].addParticle();
    fill(255, 255, 0);
    text('9', 565, 790);
  }
  if (ms>2000 && ms<2250) {
    background(70);
    fireworks[13].addParticle();
    fireworks[12].addParticle();
    fill(255, 255, 0);
    text('8', 565, 735);
  }
  if (ms>3000 && ms<3250) {
    background(70);
    fireworks[11].addParticle();
    fireworks[10].addParticle();
    fill(255, 255, 0);
    text('7', 565, 680);
  }
  if (ms>4000 && ms<4250) {
    background(70);
    fireworks[9].addParticle();
    fireworks[8].addParticle();
    fill(255, 255, 0);
    text('6', 565, 625);
  }
  if (ms>5000 && ms<5250) {
    background(70);
    fireworks[7].addParticle();
    fireworks[6].addParticle();
    fill(255, 255, 0);
    text('5', 565, 570);
  }
  if (ms>6000 && ms<6250) {
    background(70);
    fireworks[5].addParticle();
    fireworks[4].addParticle();
    fill(255, 255, 0);
    text('4', 565, 515);
  }
  if (ms>7000 && ms<7250) {
    background(70);
    fireworks[3].addParticle();
    fireworks[2].addParticle();
    fill(255, 255, 0);
    text('3', 565, 460);
  }
  if (ms>8000 && ms<8250) {
    background(70);
    fireworks[1].addParticle();
    fireworks[0].addParticle();
    fill(255, 255, 0);
    text('2', 565, 405);
  }
  if (ms>9000 && ms<9250) {
    background(70);
    fireworks[16].addParticle();
    fill(255, 255, 0);
    text('1', 565, 325);
  }
  if (ms>10000) {
    for(var j=0; j<fireworks.length; j++) {
      background(70);
      fireworks[j].addParticle();
    }
    fill(255, 255, 0);
    textSize(20);
    text('2017', 552, 300);
  }
  for(var i=0; i<fireworks.length; i++) {
    fireworks[i].run();
  }
  drawTaipei101();
}

function drawTaipei101() {
  fill(0, 0, 0, 100);
  strokeWeight(2);
  stroke(0);
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
  quad(15, 0, 0, 200, 125, 200, 110, 0);
  translate(22, -10);
  ellipse(40, 40, 40, 40);
  translate(17, 17);
  rect(15, 15, 15, 15);
  pop();
}

var Particle = function(position, rside, rain) {
  this.acceleration = createVector(0, 0.1);
  if (rside)
    x = random(5, 3);
  else
    x = random(-5, -3);
  
  if (rain)
    y = random(-5, -3);
  else {
    x = random(-5, 3);
    y = random(-5, 3);
  }
  
  this.velocity = createVector(x, y);
  this.position = position.copy();
  this.lifespan = random(500, 2000);
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
  fill(random(0, 255), random(0, 255), random(0, 255), this.lifespan);
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

var ParticleSystem = function(position, rside, rain) {
  this.origin = position.copy();
  this.rside = rside;
  this.rain = rain;
  this.particles = [];
};

ParticleSystem.prototype.addParticle = function() {
  this.particles.push(new Particle(this.origin, this.rside, this.rain));
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