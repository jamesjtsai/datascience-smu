// this class defines how the pixels are extracted and used for encryption

class PixelCipher extends CipherColor {
  
  PixelCipher() {
    super();
  }
  
  PixelCipher(ImageLoader i) {
    super("PixelCipher");
    this.i = i;
    index = 0;
    loadColors();
    plaintext = new char[MAX_CIPHER_SIZE];
    ciphercolor = new color[MAX_CIPHER_SIZE];
  }
  
  void loadColors() {
    colors = new ArrayList<color[]>();
    PImage[] img = i.getAllImages();
    for(int i=0; i<img.length; i++) {
      loadPixels();
      int p = 0;
      color[] c = new color[640];
      for(int x=0; x<640; x=x+20) {
        for(int y=0; y<360; y=y+18) {
          c[p] = img[i].get(x, y);
          p++;
        }
      }
      colors.add(c);
    }
  }
  
  color[] getColors() {
    return colors.get(i.getImageIndex());
  }
  
  int getRed() {
    return getRed(getColors()[index]);
  }
  
  int getGreen() {
    return getGreen(getColors()[index]);
  }
  
  int getBlue() {
    return getBlue(getColors()[index]);
  }
  
  boolean[] getRedBits() {
    return convertToBits(getRed(getColors()[index]));
  }
  
  boolean[] getGreenBits() {
    return convertToBits(getGreen(getColors()[index]));
  }
  
  boolean[] getBlueBits() {
    return convertToBits(getBlue(getColors()[index]));
  }
  
  boolean[] getCurrentBits() {
    return convertToBits(getCurrentTyped());
  }
  
  color encryptText(color co, char ch) {
    int r = (int)(co >> 16 & 0xFF);
    int g = (int)(co >> 8 & 0xFF);
    int b = (int)(co & 0xFF);
    return color(r^ch, g^ch, b^ch);
  }
  
  char getCurrentTyped() {
    return ct;
  }
  
  void setCurrentTyped(char c) {
    ct = Character.toUpperCase(c);
    super.setText(ct);
    super.setCipherColor(encryptText(getColors()[index], ct));
    super.increment();
  }
  
  ImageLoader i;
  ArrayList<color[]> colors;
  char ct;
  
}