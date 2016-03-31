// this class visualizes the data derived from PixelCipher object

class Visualizer {
  
  Visualizer() {
  }
  
  Visualizer(PixelCipher p) {
    this.p = p;
  }
  
  void rgbbits() {
    pushMatrix();
    translate(width/2, 0);
    noStroke();
    boolean[] redBits = p.getRedBits();
    boolean[] greenBits = p.getGreenBits();
    boolean[] blueBits = p.getBlueBits();
    int r = p.getRed();
    int g = p.getGreen();
    int b = p.getBlue();
    int[] bits = { 128, 64, 32, 16, 8, 4, 2, 1 };
    font = createFont("digital-7.ttf", 24);
    textFont(font);
    fill(255, 255, 0);
    textAlign(CENTER);
    for(int i=0; i<3; i++) {
      text("1", 20, 65+115*i);
      text("0", 20, 105+115*i);
    }
    textAlign(LEFT);
    for(int i=0; i<bits.length; i++) {
      text(bits[i], 42 + 57*i, 30);
      text(bits[i], 42 + 57*i, 145);
      text(bits[i], 42 + 57*i, 260);
    }
    fill(175, 175, 175);
    rect(34, 35, 433, 86, 10);
    rect(34, 150, 433, 86, 10);
    rect(34, 265, 433, 86, 10);
    for(int i=0; i<8; i++) {
      fill(0, 128, 0);
      rect(37+i*55, 37, 42, 82, 10);
      rect(37+i*55, 152, 42, 82, 10);
      rect(37+i*55, 267, 42, 82, 10);
      fill(0);
      rect(40+i*55, 40, 35, 75, 10);
      rect(40+i*55, 155, 35, 75, 10);
      rect(40+i*55, 270, 35, 75, 10);
    }
    fill(255);
    for(int i=0; i<redBits.length; i++) {
      if(redBits[i]==true)
        rect(40+i*55, 40, 35, 35, 10);
      else
        rect(40+i*55, 80, 35, 35, 10);
    }
    for(int i=0; i<greenBits.length; i++) {
      if(greenBits[i]==true)
        rect(40+i*55, 155, 35, 35, 10);
      else
        rect(40+i*55, 195, 35, 35, 10);
    }
    for(int i=0; i<blueBits.length; i++) {
      if(blueBits[i]==true)
        rect(40+i*55, 270, 35, 35, 10);
      else
        rect(40+i*55, 310, 35, 35, 10);
    }
    fill(175, 175, 175);
    rect(507, 37, 106, 81, 10);
    rect(507, 152, 106, 81, 10);
    rect(507, 267, 106, 81, 10);
    fill(r, 0, 0);
    rect(510, 40, 100, 75, 10);
    fill(0, g, 0);
    rect(510, 155, 100, 75, 10);
    fill(0, 0, b);
    rect(510, 270, 100, 75, 10);
    fill(0);
    textAlign(LEFT);
    fill(255, 255, 0);
    text("RED=" + r, 508, 30);
    text("GREEN=" + g, 508, 145);
    text("BLUE=" + b, 508, 260);
    popMatrix();
  }
  
  void calculations() {
    pushMatrix();
    translate(0, height/2);
    noStroke();
    PFont font = createFont("digital-7.ttf", 24);
    textFont(font);
    boolean[] redBits = p.getRedBits();
    boolean[] greenBits = p.getGreenBits();
    boolean[] blueBits = p.getBlueBits();
    boolean[] currentBits = p.getCurrentBits();
    int r = p.getRed();
    int g = p.getGreen();
    int b = p.getBlue();
    int encR = p.getCurrentTyped()^r;
    int encG = p.getCurrentTyped()^g;
    int encB = p.getCurrentTyped()^b;
    boolean[] encRBits = p.convertToBits(encR);
    boolean[] encGBits = p.convertToBits(encG);
    boolean[] encBBits = p.convertToBits(encB);
    fill(175, 175, 175);
    rect(47, 35, 551, 75, 10);
    fill(255, 255, 0);
    text("XOR(R,K)="+encR, 45, 30);
    text("XOR(G,K)="+encG, 175, 30);
    text("XOR(B,K)="+encB, 305, 30);
    text("COLOR("+encR+","+encG+","+encB+")", 460, 30);
    fill(0, 128, 0);
    rect(50, 37, 101, 71, 10);
    rect(494, 37, 101, 71, 10);
    rect(180, 37, 101, 71, 10);
    rect(310, 37, 101, 71, 10);
    fill(0);
    rect(53, 40, 95, 65, 10);
    rect(183, 40, 95, 65, 10);
    rect(313, 40, 95, 65, 10);
    if (p.getIndex() == 0)
      fill(encR, encG, encB);
    else
      fill(p.getCurrentCipherColor());
    rect(497, 40, 95, 65, 10);
    fill(255);
    for(int i=0; i<redBits.length; i++) {
      if(redBits[i]==true)
        text("1", 60+i*10, 60);
      else
        text("0", 60+i*10, 60);
      if(currentBits[i]==true)
        text("1", 60+i*10, 80);
      else
        text("0", 60+i*10, 80);
      if(encRBits[i]==true)
        text("1", 60+i*10, 100);
      else
        text("0", 60+i*10, 100);
    }
    for(int i=0; i<greenBits.length; i++) {
      if(greenBits[i]==true)
        text("1", 190+i*10, 60);
      else
        text("0", 190+i*10, 60);
      if(currentBits[i]==true)
        text("1", 190+i*10, 80);
      else
        text("0", 190+i*10, 80);
      if(encGBits[i]==true)
        text("1", 190+i*10, 100);
      else
        text("0", 190+i*10, 100);
    }
    for(int i=0; i<blueBits.length; i++) {
      if(blueBits[i]==true)
        text("1", 320+i*10, 60);
      else
        text("0", 320+i*10, 60);
      if(currentBits[i]==true)
        text("1", 320+i*10, 80);
      else
        text("0", 320+i*10, 80);
      if(encBBits[i]==true)
        text("1", 320+i*10, 100);
      else
        text("0", 320+i*10, 100);
    }
    popMatrix();
  }
  
  void keyboard() {
    pushMatrix();
    translate(0, height/2);
    noStroke();
    PFont font = createFont("digital-7.ttf", 24);
    textFont(font);
    int r = p.getRed();
    int g = p.getGreen();
    int b = p.getBlue();
    fill(175, 175, 175);
    rect(47, 127, 551, 196, 10);
    for(int i=0; i<10; i++) {
      fill(0, 128, 0);
      rect(50+i*55, 130, 50, 50, 10);
      fill(0);
      rect(53+i*55, 133, 44, 44, 10);
      fill(r, g, b);
      rect(53+i*55, 162, 44, 15, 10);
      fill(255);
      textSize(20);
      textAlign(LEFT);
      text(qwerty[i], 70+i*55, 153);
    }
    for(int i=10; i<19; i++) {
      fill(0, 128, 0);
      rect(70+(i-10)*55, 200, 50, 50, 10);
      fill(0);
      rect(73+(i-10)*55, 203, 44, 44, 10);
      fill(r, g, b);
      rect(73+(i-10)*55, 232, 44, 15, 10);
      fill(255);
      textSize(20);
      textAlign(LEFT);
      text(qwerty[i], 90+(i-10)*55, 223);
    }
    for(int i=19; i<26; i++) {
      fill(0, 128, 0);
      rect(110+(i-19)*55, 270, 50, 50, 10);
      fill(0);
      rect(113+(i-19)*55, 273, 44, 44, 10);
      fill(r, g, b);
      rect(113+(i-19)*55, 302, 44, 15, 10);
      fill(255);
      textSize(20);
      textAlign(LEFT);
      text(qwerty[i], 130+(i-19)*55, 293);
    }
    popMatrix();
  }
  
  void cleartext() {
    pushMatrix();
    translate(width/2, height/1.33);
    noStroke();
    PFont font = createFont("digital-7.ttf", 24);
    textFont(font);
    fill(175, 175, 175);
    rect(34, 35, 572, 134, 10);
    fill(0, 128, 0);
    rect(37, 38, 566, 128, 10);
    fill(0);
    rect(40, 41, 560, 122, 10);
    fill(255, 255, 0);
    textSize(20);
    textAlign(LEFT);
    text("CLEAR TEXT", 40, 30);
    int j=0;
    for(int i=0; i<MAX_TERMINAL_BUFFER; i++) {
      if(i>55) j=1;
      if(i>111) j=2;        
      if(i>167) j=3;  
      if(i>223) j=4;
      if(p.getPlaintext()[i] != 0)
        text(p.getPlaintext()[i], (40+(i-(56*j))*10), 68+j*20);
   } 
   popMatrix();
  }
  
  void rgbcipher() {
    pushMatrix();
    translate(width/2, height/2);
    noStroke();
    PFont font = createFont("digital-7.ttf", 24);
    textFont(font);
    fill(175, 175, 175);
    rect(34, 35, 572, 134, 10);
    fill(0, 128, 0);
    rect(37, 38, 566, 128, 10);
    fill(0);
    rect(40, 41, 560, 122, 10);
    fill(255, 255, 0);
    textSize(20);
    textAlign(LEFT);
    text("RGB CIPHER", 40, 30);
    int j=0;
    for(int i=0; i<MAX_TERMINAL_BUFFER; i++) {
      if(p.getCipherColor()[i] != 0) {
        if(i>55) j=1;
        if(i>111) j=2;
        if(i>167) j=3;
        if(i>223) j=4;
        fill(p.getCipherColor()[i]);
        rect((40+(i-(56*j))*10), 52+j*20, 10, 20);
      }
    }
    popMatrix();
  }
  
  void grid() {
    strokeWeight(3);
    stroke(255);
    line(0, 0, width, 0);
    line(0, height/2, width, height/2);
    line(0, height, width, height);
    line(0, 0, 0, height);
    line(width/2, 0, width/2, height);
    line(width, 0, width, height);
    line(width/1.14, 0, width/1.14, height/2);
    line(width/2, 3*height/4, width, 3*height/4);
  }
  
  PixelCipher p;
  PFont font;
  char[] qwerty = {'Q', 'W', 'E', 'R', 'T', 'Y', 
                   'U', 'I', 'O', 'P', 'A', 'S',
                   'D', 'F', 'G', 'H', 'J', 'K',
                   'L', 'Z', 'X', 'C', 'V', 'B',
                   'N', 'M'};
  int MAX_TERMINAL_BUFFER = 280;
  
}