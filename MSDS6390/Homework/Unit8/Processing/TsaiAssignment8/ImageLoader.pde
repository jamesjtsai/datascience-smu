// this class manages the images

abstract class ImageLoader {
  
  abstract void display();
  
  ImageLoader() {
  }
  
  ImageLoader(String[] filenames) {
    this.pi = 0;
    this.filenames = new String[filenames.length];
    images = new PImage[filenames.length];   
    for(int i=0; i<filenames.length; i++) {
      this.filenames[i] = filenames[i];
      images[i] = loadImage(filenames[i]);
    }
    logCurrentPhoto();
  }
  
  void logCurrentPhoto() {
    println(new java.util.Date().toString() + ": " + this.filenames[pi]);
  }
  
  void next() {
    if(this.images.length-1 == pi)
      pi = 0;
    else
      pi++;
    logCurrentPhoto();
  }
  
  PImage getImage() {
    return images[pi];
  }
  
  PImage[] getAllImages() {
    return images;
  }
  
  int getImageIndex() {
    return pi;
  }
  
  String[] filenames;
  PImage[] images;
  int pi;
  
}