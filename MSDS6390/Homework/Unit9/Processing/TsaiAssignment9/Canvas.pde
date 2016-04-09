// canvas color and dividers

class Canvas {
  
  void render() {
    background(Bauhaus.grey);
    strokeWeight(3);
    stroke(Bauhaus.fluff);
    line(0, 0, 0, height);
    line(width/2, 0, width/2, height);
    line(width, 0, width, height);
    line(0, 0, width, 0);
    line(0, height, width, height);
  }
  
}