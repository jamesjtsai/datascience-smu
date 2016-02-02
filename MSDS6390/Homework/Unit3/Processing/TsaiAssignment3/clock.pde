void drawClock() {
  int sec = second();
  String state = "SUNRISE";
  pushMatrix();
  translate(width/1.3, height/1.1);
  fill(white);
  if (sec>=0 && sec <15) {
    state = "NIGHT";
  }
  if (sec>=15 && sec<20) {
    state = "SUNRISE";
  }
  if (sec>=20 && sec<30) {
    state = "MORNING";
  }
  if (sec>=30 && sec<40) {
    state = "AFTERNOON";
  }
  if (sec>=40 && sec<45) {
    state = "SUNSET";
  }
  if (sec>=45 && sec<=59) {
    state = "NIGHT";
  }
  textSize(30);
  textAlign(CENTER);
  text(state+" :"+sec, 50, 50);
  popMatrix();
}