class Instrument implements Notes {
  
  Instrument() {
  }
  
  Instrument(Spheres s) {
    this.s = s;
    index = 0;
    timeToWait = 200;
    ac = new AudioContext();
    gainGlide = new Glide(ac, 0.0, 50);
    frequencyGlide = new Glide(ac, 20, 50);
    gainEnvelope = new Envelope(ac, 0.0);
    wp = new WavePlayer(ac, frequencyGlide, Buffer.SINE);
    g = new Gain(ac, 1, gainGlide);
    g.addInput(wp);
    ac.out.addInput(g);
    ac.start();
    lastTime = millis();
  }
  
  void play(float[] music) {
    if( millis() - lastTime > timeToWait)
    {
      lastTime = millis();
      if(index < music.length-1) {
        index++;
        float note = music[index];
        s.notePlayed(note);
        gainGlide.setValue(0.25);
        frequencyGlide.setValue(note);
      }
      else {
        index=0;
        m.next();
      }
    }
  }
  
  Spheres s;
  AudioContext ac;
  WavePlayer wp;
  Gain g;
  Glide gainGlide, frequencyGlide;
  Gain delayGain;
  Envelope gainEnvelope;
  int index, lastTime, timeToWait;
  
}