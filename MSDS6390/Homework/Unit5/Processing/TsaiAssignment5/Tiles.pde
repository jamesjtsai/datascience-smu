ArrayList<Tiles> tiles = new ArrayList<Tiles>();
color[] cPI;

class Tiles {
  Tiles(String fn_) {
    fn = fn_;
    img = loadImage(fn_);
    loadColors();
  }
  
  private void loadColors() {
    loadPixels();
    int i=0;
    colors = new color[576];
    for(int x=0; x<img.width; x=x+20) {
      for(int y=0; y<img.height; y=y+20) {
        colors[i] = img.get(x, y);
        i++;
      }
    }
  }
  
  PImage getImage() {
    return img;
  }
  
  color[] getColors() {
    return colors;
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
  for(int x=0; x<img.width; x=x+20) {
    for(int y=0; y<img.height; y=y+20) {
      fill(cPI[count]);
      rect(x, y+height/3, 22, 22);
      count++;
    }
  }
}