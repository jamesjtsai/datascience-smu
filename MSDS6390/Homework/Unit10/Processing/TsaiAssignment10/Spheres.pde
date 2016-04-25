class Spheres {
  
  Spheres() {
    spheres = new ArrayList<Sphere>();
    spheres.add(new Sphere(Notes.C3));
    spheres.add(new Sphere(Notes.CS3));
    spheres.add(new Sphere(Notes.D3));
    spheres.add(new Sphere(Notes.DS3));
    spheres.add(new Sphere(Notes.E3));
    spheres.add(new Sphere(Notes.F3));
    spheres.add(new Sphere(Notes.FS3));
    spheres.add(new Sphere(Notes.G3));
    spheres.add(new Sphere(Notes.GS3));
    spheres.add(new Sphere(Notes.A3));
    spheres.add(new Sphere(Notes.AS3));
    spheres.add(new Sphere(Notes.B3));
    spheres.add(new Sphere(Notes.C4));
    spheres.add(new Sphere(Notes.CS4));
    spheres.add(new Sphere(Notes.D4));
    spheres.add(new Sphere(Notes.DS4));
    spheres.add(new Sphere(Notes.E4));
    spheres.add(new Sphere(Notes.F4));
    spheres.add(new Sphere(Notes.FS4));
    spheres.add(new Sphere(Notes.G4));
    spheres.add(new Sphere(Notes.GS4));
    spheres.add(new Sphere(Notes.A4));
    spheres.add(new Sphere(Notes.AS4));
    spheres.add(new Sphere(Notes.B4));
    spheres.add(new Sphere(Notes.C5));
    spheres.add(new Sphere(Notes.CS5));
    spheres.add(new Sphere(Notes.D5));
    spheres.add(new Sphere(Notes.DS5));
    spheres.add(new Sphere(Notes.E5));
    spheres.add(new Sphere(Notes.F5));
    spheres.add(new Sphere(Notes.FS5));
    spheres.add(new Sphere(Notes.G5));
    spheres.add(new Sphere(Notes.GS5));
    spheres.add(new Sphere(Notes.A5));
    spheres.add(new Sphere(Notes.AS5));
    spheres.add(new Sphere(Notes.B5));
    spheres.add(new Sphere(Notes.C6));
  }
  
  void render() {
    for(Sphere s: spheres) {
      s.notePlayed(note);
    }
    float deg = 30.0;
    float rad = radians(deg);
    float r = width/5;
    pushMatrix();
    translate(width/2, height/2);
    for(int i=0; i<37; i++) {
      strokeWeight(10);
      stroke(255, 255, 255);
      // equal-tempered scale arranged along a logarithmic spiral
      translate(0.4*r*cos(i*rad)*exp(0.075*i*rad), 0.4*r*sin(i*rad)*exp(0.075*i*rad), 0);
      spheres.get(i).render();
    }
    popMatrix();
  }
  
  void notePlayed(float note) {
    this.note = note;
  }
  
  float note;
  ArrayList<Sphere> spheres;
  
}