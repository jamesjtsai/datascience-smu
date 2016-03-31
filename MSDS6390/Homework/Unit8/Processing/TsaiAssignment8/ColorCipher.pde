// this class defines some basic methods for creating a color cipher

abstract class CipherColor {
  
  abstract color encryptText(color co, char ch);
  abstract void loadColors();
  
  CipherColor() {
  }
  
  CipherColor(String cipherName) {
    this.cipherName = cipherName;
  }
  
  void setText(char c) {
    if (index < MAX_CIPHER_SIZE) 
       plaintext[index] = c;
  }
  
  char[] getPlaintext() {
    return plaintext;
  }
  
  void setCipherColor(color c) {
    if (index < MAX_CIPHER_SIZE) 
       ciphercolor[index] = c;
  }
  
  color getCurrentCipherColor() {
    if(index > 0 && index < MAX_CIPHER_SIZE)
      return ciphercolor[index-1];
    else
      return ciphercolor[0];
  }
  
  color[] getCipherColor() {
    return ciphercolor;
  }
  
  void increment() {
    if (index < MAX_CIPHER_SIZE)
      index++;
  }
  
  int getIndex() {
    return index;
  }
  
  int getRed(color c) {
    return (int)(c >> 16 & 0xFF);
  }
  
  int getGreen(color c) {
    return (int)(c >> 8 & 0xFF);
  }
  
  int getBlue(color c) {
    return (int)(c & 0xFF);
  }
  
  boolean[] getCipherRedBits() {
    return convertToBits(getRed(ciphercolor[index]));
  }
  
  boolean[] getCipherGreenBits() {
    return convertToBits(getGreen(ciphercolor[index]));
  }
  
  boolean[] getCipherBlueBits() {
    return convertToBits(getBlue(ciphercolor[index]));
  }
  
  boolean[] convertToBits(int c) {
    byte[] bytes = new byte[] { (byte)(c & 0xff), (byte)((c & 0xff00) >> 8) };
    boolean[] keyUsage = new boolean[8];
    for (int i = 0; i != 8; i++)
      keyUsage[i] = (bytes[i / 8] & (0x80 >>> (i % 8))) != 0;
    return keyUsage;
  }
  
  String cipherName;
  char[] plaintext;
  color[] ciphercolor;
  int index;
  int MAX_CIPHER_SIZE = 640;
  
}