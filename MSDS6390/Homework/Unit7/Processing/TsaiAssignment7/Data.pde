// This class stores images, color array for visualizations, and traversing through the photos.

class Data {
  
  Data(String[] filenames) {
    this.pi = 0;
    this.filenames = new String[filenames.length];
    images = new PImage[filenames.length];   
    for(int i=0; i<filenames.length; i++) {
      this.filenames[i] = filenames[i];
      images[i] = loadImage(filenames[i]);
    }
    loadColors();
  }
  
  void loadColors() {
    this.colors = new ArrayList<color[]>();
    PImage img;
    for(int i=0; i<this.filenames.length; i++) {
      img = loadImage(this.filenames[i]);
      loadPixels();
      int p = 0;
      color[] c = new color[640];
      for(int x=0; x<640; x=x+20) {
        for(int y=0; y<360; y=y+18) {
          c[p] = img.get(x, y);   
          p++;
        }
      }
      this.colors.add(c);
    }
  }
  
  void next() {
    if(second()%10==0 && b) {
      if(this.images.length-1 == pi)
        pi = 0;
      else
        pi++;
      this.b = false;
      printCurrentFile();
    }
    if(second()%11==0 && second()!=0 || second()==1) {
      this.b = true;
    }
  }
  
  void printCurrentFile() {
    println(new java.util.Date().toString() + ": " + this.filenames[pi]);
  }
  
  int getPhotoIndex() {
    return this.pi;
  }
  
  PImage getImage() {
    return this.images[this.pi];
  }
  
  color[] getColors() {
    return this.colors.get(this.pi);
  }
  
  String[] filenames;
  PImage[] images;
  ArrayList<color[]> colors;
  boolean b;
  int pi;
  
}