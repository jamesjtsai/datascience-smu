class MusicLoader {
  
  MusicLoader() {
    si = 0;
    songs = new ArrayList<float[]>();
    songs.add(MusicData.chromatic);
    songs.add(MusicData.pause);
    songs.add(MusicData.cello_suite_1);
    songs.add(MusicData.pause);
    songs.add(MusicData.rondeau);
    songs.add(MusicData.pause);
  }
  
  float[] getSong() {
    return songs.get(si);
  }
  
  void next() {
    if(si < songs.size()-1)
      si++;
    else
      si = 0;
  }
  
  int getSongIndex() {
    return si;
  }
  
  ArrayList<float[]> songs;
  int si;
  
}