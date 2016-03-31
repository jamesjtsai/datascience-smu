// this class renders the original images

class Images extends ImageLoader {
  
  Images() {
  }
  
  Images(String[] filenames) {
    super(filenames);
  }
  
  void display() {
    pushMatrix();
    noStroke();
    image(super.getImage(), 0, 0);
    popMatrix();
  }
 
}