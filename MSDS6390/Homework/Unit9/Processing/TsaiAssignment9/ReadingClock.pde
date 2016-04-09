// class to create Reading clock - accurate to within 5 minutes

class ReadingClock extends Clock {
  
  ReadingClock() {
    super();
  }
  
  void time() {
    pushMatrix();
    translate(width/2, 0);
    clockface();
    popMatrix();
  }
  
  void clockface() {
    fill(Bauhaus.red);
    rect(15, 15, width/2-30, height/2-30, 10);
    textFont(font);
    textSize(50);
    fill(getColor(0));
    text(words[0], 60, 80);
    fill(getColor(1));
    text(words[1], 120, 80);
    fill(getColor(2));
    text(words[2], 180, 80);
    fill(getColor(3));
    text(words[3], 300, 80);
    fill(getColor(4));
    text(words[4], 390, 80);
    fill(getColor(5));
    text(words[5], 600, 80);
    fill(getColor(6));
    text(words[6], 60, 150);
    fill(getColor(7));
    text(words[7], 180, 150);
    fill(getColor(8));
    text(words[8], 390, 150);
    fill(getColor(9));
    text(words[9], 470, 150);
    fill(getColor(10));
    text(words[10], 590, 150);
    fill(getColor(11));
    text(words[11], 60, 220);
    fill(getColor(12));
    text(words[12], 190, 220);
    fill(getColor(13));
    text(words[13], 340, 220);
    fill(getColor(14));
    text(words[14], 480, 220);
    fill(getColor(15));
    text(words[15], 590, 220);
    fill(getColor(16));
    text(words[16], 60, 290);
    fill(getColor(17));
    text(words[17], 210, 290);
    fill(getColor(18));
    text(words[18], 360, 290);
    fill(getColor(19));
    text(words[19], 480, 290);
    fill(getColor(20));
    text(words[20], 590, 290);
    fill(getColor(21));
    text(words[21], 60, 360);
    fill(getColor(22));
    text(words[22], 240, 360);
  }
  
  color getColor(int pos) {
    // "IT IS"
    if (pos == 0 || pos == 1)
       return Bauhaus.fluff;
    
    // "HALF"
    if (pos == 2) {
      if (getMinute() >= 30 && getMinute() < 35)
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "TEN"
    if (pos == 3) {
      if (getMinute() >= 10 && getMinute() < 15)
         return Bauhaus.fluff;
      if (getMinute() >= 50 && getMinute() < 55)
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "QUARTER"
    if (pos == 4) {
      if (getMinute() >= 15 && getMinute() < 20)
         return Bauhaus.fluff;
      if (getMinute() >= 45 && getMinute() < 50)
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "TWENTY"
    if (pos == 5) {
      if (getMinute() >= 20 && getMinute() < 30)
         return Bauhaus.fluff;
      if (getMinute() >= 35 && getMinute() < 45)
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "FIVE"
    if (pos == 6) {
      if (getMinute() >= 5 && getMinute() < 10)
         return Bauhaus.fluff;
      if (getMinute() >= 25 && getMinute() < 30)
         return Bauhaus.fluff;
      if ((getMinute() >= 35 && getMinute() < 40) || (getMinute() >= 55))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "MINUTES"
    if (pos == 7) {
      if (getMinute() >= 5 && getMinute() < 15)
         return Bauhaus.fluff;
      if (getMinute() >= 20 && getMinute() < 30)
         return Bauhaus.fluff;
      if ((getMinute() >= 35 && getMinute() < 45) || (getMinute() >= 50))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "TO"
    if (pos == 8) {
      if (getMinute() >= 35)
         return Bauhaus.fluff;
      else
         return Bauhaus.muted;
    }
    
    // "PAST"
    if (pos == 9) {
      if (getMinute() >= 5 && getMinute() < 35)
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "ONE"
    if (pos == 10) {
      if ((getHour() == 0 && getMinute() >= 35) || (getHour() == 1 && getMinute() >= 0 && getMinute() < 35))
         return Bauhaus.fluff;
      if ((getHour() == 12 && getMinute() >= 35) || (getHour() == 13 && getMinute() >= 0 && getMinute() < 35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "THREE"
    if (pos == 12) {
      if ((getHour() == 2 && getMinute() >= 35) || (getHour() == 3 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      if ((getHour() == 14 && getMinute() >= 35) || (getHour() == 15 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "TWO"
    if (pos == 11) {
      if ((getHour() == 1 && getMinute() >= 35) || (getHour() == 2 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      if ((getHour() == 13 && getMinute() >= 35) || (getHour() == 14 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "FOUR"
    if (pos == 13) {
      if ((getHour() == 3 && getMinute() >= 35) || (getHour() == 4 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;  
      if ((getHour() == 15 && getMinute() >= 35) || (getHour() == 16 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "FIVE"
    if (pos == 14) {
      if ((getHour() == 4 && getMinute() >= 35) || (getHour() == 5 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      if ((getHour() == 16 && getMinute() >= 35) || (getHour() == 17 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "SIX"
    if (pos == 15) {
      if ((getHour() == 5 && getMinute() >= 35) || (getHour() == 6 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      if ((getHour() == 17 && getMinute() >= 35) || (getHour() == 18 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "SEVEN"
    if (pos == 16) {
      if ((getHour() == 6 && getMinute() >= 35) || (getHour() == 7 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      if ((getHour() == 18 && getMinute() >= 35) || (getHour() == 19 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "EIGHT"
    if (pos == 17) {
      if ((getHour() == 7 && getMinute() >= 35) || (getHour() == 8 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;    
      if ((getHour() == 19 && getMinute() >= 35) || (getHour() == 20 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "NINE" 
    if (pos == 18) {
      if ((getHour() == 8 && getMinute() >= 35) || (getHour() == 9 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      if ((getHour() == 20 && getMinute() >= 35) || (getHour() == 21 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "TEN"
    if (pos == 19) {
      if ((getHour() == 9 && getMinute() >= 35) || (getHour() == 10 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      if ((getHour() == 21 && getMinute() >= 35) || (getHour() == 22 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "ELEVEN"
    if (pos == 20) {
      if ((getHour() == 10 && getMinute() >= 35) || (getHour() == 11 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      if ((getHour() == 22 && getMinute() >= 35) || (getHour() == 23 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
    
    // "TWELVE"
    if (pos == 21) {
      if ((getHour() == 11 && getMinute() >= 35) || (getHour() == 12 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      if ((getHour() == 23 && getMinute() >= 35) || (getHour() == 0 && getMinute() >=0 && getMinute() <35))
         return Bauhaus.fluff;
      return Bauhaus.muted;
    }
       
    // "O'CLOCK"
    if (pos == 22) {
      return Bauhaus.fluff;
    }
    return Bauhaus.muted;
  }
  
  String[] words = { "IT", "IS", "HALF", "TEN", "QUARTER", "TWENTY", "FIVE", "MINUTES", "TO",
                     "PAST", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT",
                     "NINE", "TEN", "ELEVEN", "TWELVE", "O'CLOCK" };
                  
  PFont font = createFont(Bauhaus.font, 40);
  
}