// some basic clock functions

abstract class Clock {
  
  abstract void clockface();
  abstract void time();
  
  int getSecond() {
    return second();
  }
  
  int getMinute() {
    return minute();
  }
  
  int getHour() {
    return hour();
  }
  
}