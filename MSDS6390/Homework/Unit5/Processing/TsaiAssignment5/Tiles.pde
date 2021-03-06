ArrayList<Tiles> tiles = new ArrayList<Tiles>();
color[] cPI;

class Tiles {
  Tiles(String fn) {
    this.fn = fn;
    this.img = loadImage(fn);
    loadColors();
  }
  
  private void loadColors() {
    loadPixels();
    int i=0;
    this.colors = new color[640];
    for(int x=0; x<this.img.width; x=x+20) {
      for(int y=0; y<this.img.height; y=y+18) {
        this.colors[i] = this.img.get(x, y);
        i++;
      }
    }
  }
  
  PImage getImage() {
    return this.img;
  }
  
  color[] getColors() {
    return this.colors;
  }
  
  String fn;
  PImage img;
  color[] colors;
}

void initTiles() {
  for(int p=0; p<photos.size(); p++) {
    Tiles t1 = new Tiles(photos.get(p));
    tiles.add(t1);
  }
}

void drawTiles() {
  stroke(3);
  cPI = tiles.get(pi).getColors();
  int count=0;
  for(int x=0; x<this.img.width; x=x+20) {
    for(int y=0; y<this.img.height; y=y+18) {
      fill(cPI[count]);
      rect(x, y+height/3, 22, 22);
      count++;
    }
  }
}