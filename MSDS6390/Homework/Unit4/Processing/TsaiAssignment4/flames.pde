ParticleSystem[] stage1 = new ParticleSystem[4];
ParticleSystem[] stage2 = new ParticleSystem[3];
ParticleSystem[] stage3 = new ParticleSystem[5];
ParticleSystem[] stage4 = new ParticleSystem[7];

void drawFlames() {
  float dx = random(-0.3, 0.3);
  PVector wind = new PVector(dx,-0.3);
  timer = map(millis(), 0, 60000, 0, 60);
  if (timer>0) {
   for(int i=0; i<stage1.length; i++) {
    stage1[i].applyForce(wind);
    stage1[i].addParticle();
    stage1[i].run();
   }
  }
  if (timer>5) {
   for(int j=0; j<stage2.length; j++) {
     stage2[j].applyForce(wind);
     stage2[j].addParticle();
     stage2[j].run();
   }
  }
  if (timer>10) {
   for(int k=0; k<stage3.length; k++) {
    stage3[k].applyForce(wind);
    stage3[k].addParticle();
    stage3[k].run();
   }
  }
  if (timer>13) {
   for(int l=0; l<stage4.length; l++) {
    stage4[l].applyForce(wind);
    stage4[l].addParticle();
    stage4[l].run();
    inner = flame;
   }
  }
}

void initFlames() {
  inner = grey;
  stage1[0] = new ParticleSystem(10,new PVector(guWidth*10, guHeight*23),img, 0);
  stage1[1] = new ParticleSystem(10,new PVector(guWidth*11.5, guHeight*23.7),img, 0);
  stage1[2] = new ParticleSystem(10,new PVector(guWidth*13, guHeight*24.5),img, 0);
  stage1[3] = new ParticleSystem(10,new PVector(guWidth*14.5, guHeight*19.2),img, 2);
  stage2[0] = new ParticleSystem(10,new PVector(guWidth*28.5, guHeight*23.7),img, 0);
  stage2[1] = new ParticleSystem(10,new PVector(guWidth*30, guHeight*23),img, 0);
  stage2[2] = new ParticleSystem(10,new PVector(guWidth*25.5, guHeight*19.2),img, 2);
  stage3[0] = new ParticleSystem(10,new PVector(guWidth*27, guHeight*24.5),img, 0);
  stage3[1] = new ParticleSystem(10,new PVector(guWidth*10, guHeight*19.7),img, 1);
  stage3[2] = new ParticleSystem(10,new PVector(guWidth*30, guHeight*19.7),img, 1);
  stage3[3] = new ParticleSystem(10,new PVector(guWidth*14, guHeight*27.5),img, 0);
  stage3[4] = new ParticleSystem(10,new PVector(guWidth*26, guHeight*27.5),img, 0);
  stage4[0] = new ParticleSystem(10,new PVector(guWidth*24, guHeight*32),img, 0);
  stage4[1] = new ParticleSystem(10,new PVector(guWidth*16, guHeight*32),img, 0);
  stage4[2] = new ParticleSystem(10,new PVector(guWidth*18, guHeight*34),img, 0);
  stage4[3] = new ParticleSystem(10,new PVector(guWidth*20, guHeight*34),img, 0);
  stage4[4] = new ParticleSystem(10,new PVector(guWidth*22, guHeight*34),img, 0);
  stage4[5] = new ParticleSystem(10,new PVector(guWidth*14.5, guHeight*19.2),img, 0);
  stage4[6] = new ParticleSystem(10,new PVector(guWidth*25.5, guHeight*19.2),img, 0);
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