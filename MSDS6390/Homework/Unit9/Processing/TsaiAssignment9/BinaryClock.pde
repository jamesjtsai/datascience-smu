// class to create Binary-coded decimal clock

import java.util.BitSet;

class BinaryClock extends Clock {
  
  BinaryClock() {
    super();
  }
  
  void time() {
    pushMatrix();
    translate(width/2, height/2);
    clockface();
    displayBits();
    popMatrix();
  }
  
  void clockface() {
    strokeWeight(3);
    stroke(Bauhaus.FLUFF);
    line(0, 0, width/2, 0);
    line(width/6, 0, width/6, height/2);
    line(width/3, 0, width/3, height/2);
    for(int i=0; i<6; i=i+2) {
      pushMatrix();
        translate(((5-i)*width/12)+7, 7);
        led(false);
        pushMatrix();
          translate(0, height/8);
          led(false);
        popMatrix();
        pushMatrix();
          translate(0, 2*height/8);
          led(false);
        popMatrix();
        pushMatrix();
          translate(0, 3*height/8);
          led(false);
        popMatrix(); 
      popMatrix();
    }
    for(int i=1; i<4; i=i+2) {
      pushMatrix();
        translate(((5-i)*width/12)+7, 7);
        pushMatrix();
          translate(0, height/8);
          led(false);
        popMatrix();
        pushMatrix();
          translate(0, 2*height/8);
          led(false);
        popMatrix();
        pushMatrix();
          translate(0, 3*height/8);
          led(false);
        popMatrix(); 
      popMatrix();
    }
    pushMatrix();
    translate(7, 7);
      pushMatrix();
        translate(0, 2*height/8);
        led(false);
      popMatrix();
      pushMatrix();
        translate(0, 3*height/8);
        led(false);
      popMatrix(); 
    popMatrix();
  }
  
  void draw(BitSet bs, int pos) {
    if(pos == 1 || pos == 2 || pos == 3 || pos == 4 || pos == 5 || pos == 6) {
      pushMatrix();
      translate(((6-pos)*width/12)+7, 7);
      noStroke();
      if(bs.get(3) == true) {
        pushMatrix();
        translate(0, 0);
        led(true);
        popMatrix();
      }
      if(bs.get(2) == true) {
        pushMatrix();
        translate(0, height/8);
        led(true);
        popMatrix();
      }
      if(bs.get(1) == true) {
        pushMatrix();
        translate(0, 2*height/8);
        led(true);
        popMatrix();
      }
      if(bs.get(0) == true) {
        pushMatrix();
        translate(0, 3*height/8);
        led(true);
        popMatrix();     
      }
      popMatrix();
    }
  }
  
  void led(boolean b) {
    beginShape();
    strokeWeight(5);
    stroke(Bauhaus.RED);
    if(b)
      fill(Bauhaus.YELLOW);
    else
      fill(Bauhaus.GREY);
    rect(width/54, height/38, width/27, height/19, 10);
    endShape();
  }
  
  void displayBits() {
    int hr = getHour();
    String hrStr = nf(hr, 2);
    char h2 = hrStr.charAt(0);
    char h1 = hrStr.charAt(1); 
    int min = getMinute();
    String minStr = nf(min, 2);
    char m2 = minStr.charAt(0);
    char m1 = minStr.charAt(1);
    int sec = getSecond();
    String secStr = nf(sec, 2);
    char s2 = secStr.charAt(0);
    char s1 = secStr.charAt(1);
    BitSet bs6 = toBitSet((byte)h2);
    BitSet bs5 = toBitSet((byte)h1);
    BitSet bs4 = toBitSet((byte)m2);
    BitSet bs3 = toBitSet((byte)m1);
    BitSet bs2 = toBitSet((byte)s2);
    BitSet bs1 = toBitSet((byte)s1);
    draw(bs6, 6);
    draw(bs5, 5);
    draw(bs4, 4);
    draw(bs3, 3);
    draw(bs2, 2);
    draw(bs1, 1);
  }
  
  BitSet toBitSet(byte b) {
    BitSet bs = new BitSet(Byte.SIZE);
    for (int i = 0; i < Byte.SIZE; i++) {
      if (((b >> i) & 1) == 1) {
        bs.set(i);
      }
    }
    return bs;
  }
  
}