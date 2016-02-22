StringList photos = new StringList();
PImage img;
int pi;
boolean b;

void initPhotos() {
  pi = 0;
  b = true;
  photos.append("olaf.jpg");
  photos.append("bubbles.jpg");
  photos.append("cards.png");
  photos.append("eyes.jpg");
  photos.append("flag.png");
  photos.append("icecream.jpg");
}

void sequencePhotos() {
  if(second()%10==0 && b) {
    if(photos.size()-1 == pi) {
      pi = 0;
    } else {
      pi++;
    }
    b = false;
  }
  if(second()%11==0 && second()!=0 || second()==1) {
    b = true;
  }
}

void drawPhoto() {
  img = tiles.get(pi).getImage();
  image(img, 0, 0);
}