class Sphere {
  
 Sphere(float note) {
   this.note = note;
   if (note < 250) 
     sphere1 = createShape(SPHERE, 30);
   if (note > 250 && note < 500)
     sphere1 = createShape(SPHERE, 20);
   if (note > 500) 
     sphere1 = createShape(SPHERE, 10);
   sphere2 = createShape(SPHERE, 30);
   PImage mercury = loadImage("mercury.jpg");
   PImage sparks = loadImage("sparks.jpg");
   sphere1.setTexture(mercury);
   sphere2.setTexture(sparks);
   led = false;
 }
 
 void render() {
   lightSpecular(204, 204, 204);
   sphere2.setStroke(false);
   sphere1.setStroke(false);
   if(led == true)
     shape(sphere2);
   else
     shape(sphere1);
 }
 
 void notePlayed(float note) {
   if (this.note == note) 
     led = true;
   else
     led = false;
 }
 
 PShape sphere1, sphere2;
 boolean led;
 float note;
  
}