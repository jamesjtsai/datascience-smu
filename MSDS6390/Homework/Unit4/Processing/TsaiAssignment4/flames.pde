ParticleSystem[] stage1F = new ParticleSystem[3];
ParticleSystem[] stage1S = new ParticleSystem[2];
ParticleSystem[] stage2F = new ParticleSystem[3];
ParticleSystem[] stage2S = new ParticleSystem[2];
ParticleSystem[] stage3F = new ParticleSystem[3];
ParticleSystem[] stage3S = new ParticleSystem[2];
ParticleSystem[] stage4F = new ParticleSystem[8];

void drawFlames() {
  // randomize wind turbulence
  float dx = random(-0.4, 0.4);
  float dy = random(-0.3, -0.5);
  PVector wind = new PVector(dx, dy);
  timer = map(millis(), 0, 60000, 0, 60);
  // stage 1 fire
  if (timer>0) {
   for(int i=0; i<stage1F.length; i++) {
    stage1F[i].applyForce(wind);
    stage1F[i].addParticle();
    stage1F[i].run();
   }
  }
  // stage 1 smoke
  if (timer>0 && timer<14) {
   for(int i=0; i<stage1S.length; i++) {
    stage1S[i].applyForce(wind);
    stage1S[i].addParticle();
    stage1S[i].run();
   }
  }
  // stage 2 fire
  if (timer>5) {
   for(int j=0; j<stage2F.length; j++) {
     stage2F[j].applyForce(wind);
     stage2F[j].addParticle();
     stage2F[j].run();
   }
  }
  // stage 2 smoke
  if (timer>5 && timer<16) {
   for(int j=0; j<stage2S.length; j++) {
     stage2S[j].applyForce(wind);
     stage2S[j].addParticle();
     stage2S[j].run();
   }
  }
  // stage 3 fire
  if (timer>10) {
   for(int k=0; k<stage3F.length; k++) {
    stage3F[k].applyForce(wind);
    stage3F[k].addParticle();
    stage3F[k].run();
   }
  }
  // stage 3 smoke
  if (timer>10 && timer<17) {
   for(int k=0; k<stage3S.length; k++) {
    stage3S[k].applyForce(wind);
    stage3S[k].addParticle();
    stage3S[k].run();
   }
  }
  // stage 4 fire
  if (timer>17) {
   for(int l=0; l<stage4F.length; l++) {
    stage4F[l].applyForce(wind);
    stage4F[l].addParticle();
    stage4F[l].run();
    inner = flame;
   }
  }
}

void initFlames() {
  inner = grey;
  // stage 1 fire
  stage1F[0] = new ParticleSystem(10,new PVector(guWidth*10, guHeight*23),img, 0);
  stage1F[1] = new ParticleSystem(10,new PVector(guWidth*11.5, guHeight*23.7),img, 0);
  stage1F[2] = new ParticleSystem(10,new PVector(guWidth*13, guHeight*24.5),img, 0);
  // stage 1 smoke
  stage1S[0] = new ParticleSystem(10,new PVector(guWidth*14.5, guHeight*19.2),img, 2);
  stage1S[1] = new ParticleSystem(10,new PVector(guWidth*10, guHeight*19.7),img, 2);
  // stage 2 fire
  stage2F[0] = new ParticleSystem(10,new PVector(guWidth*28.5, guHeight*23.7),img, 0);
  stage2F[1] = new ParticleSystem(10,new PVector(guWidth*30, guHeight*23),img, 0);
  stage2F[2] = new ParticleSystem(10,new PVector(guWidth*25.5, guHeight*19.2),img, 0);
  // stage 2 smoke 
  stage2S[0] = new ParticleSystem(10,new PVector(guWidth*20, guHeight*25),img, 1);
  stage2S[1] = new ParticleSystem(10,new PVector(guWidth*23, guHeight*30),img, 1);
  // stage 3 fire
  stage3F[0] = new ParticleSystem(10,new PVector(guWidth*27, guHeight*24.5),img, 0);
  stage3F[1] = new ParticleSystem(10,new PVector(guWidth*14, guHeight*27.5),img, 0);
  stage3F[2] = new ParticleSystem(10,new PVector(guWidth*26, guHeight*27.5),img, 0);
  // stage 3 smoke
  stage3S[0] = new ParticleSystem(10,new PVector(guWidth*30, guHeight*19.7),img, 1);
  stage3S[1] = new ParticleSystem(10,new PVector(guWidth*25, guHeight*29),img, 1);
  // stage 4 fire
  stage4F[0] = new ParticleSystem(10,new PVector(guWidth*24, guHeight*32),img, 0);
  stage4F[1] = new ParticleSystem(10,new PVector(guWidth*16, guHeight*32),img, 0);
  stage4F[2] = new ParticleSystem(10,new PVector(guWidth*18, guHeight*34),img, 0);
  stage4F[3] = new ParticleSystem(10,new PVector(guWidth*20, guHeight*34),img, 0);
  stage4F[4] = new ParticleSystem(10,new PVector(guWidth*22, guHeight*34),img, 0);
  stage4F[5] = new ParticleSystem(10,new PVector(guWidth*28.5, guHeight*23.7),img, 0);
  stage4F[6] = new ParticleSystem(10,new PVector(guWidth*30, guHeight*23),img, 0);
  stage4F[7] = new ParticleSystem(10,new PVector(guWidth*14.5, guHeight*19.2),img, 0);
}

void drawInner() {
  fill(inner);
  beginShape();
  vertex(guWidth*32, guHeight*35);
  vertex(guWidth*28, guHeight*31);
  vertex(guWidth*27, guHeight*29);
  vertex(guWidth*27, guHeight*28);
  vertex(guWidth*28, guHeight*26);
  vertex(guWidth*32, guHeight*23);
  vertex(guWidth*31, guHeight*20);
  vertex(guWidth*30, guHeight*18);
  vertex(guWidth*28, guHeight*17);
  vertex(guWidth*20, guHeight*22);
  vertex(guWidth*12, guHeight*17);
  vertex(guWidth*10, guHeight*18);
  vertex(guWidth*9, guHeight*20);
  vertex(guWidth*8, guHeight*23);
  vertex(guWidth*12, guHeight*26);
  vertex(guWidth*13, guHeight*28);
  vertex(guWidth*13, guHeight*29);
  vertex(guWidth*12, guHeight*31);
  vertex(guWidth*8, guHeight*35);
  endShape(CLOSE);
}