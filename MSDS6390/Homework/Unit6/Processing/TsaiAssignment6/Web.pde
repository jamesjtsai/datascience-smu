StringList times = new StringList();
StringList locations = new StringList();
StringList ridenames = new StringList();
String url = "http://www.easywdw.com/waits/?&park=mk&sort=ride";

private void parseHTML() {
  times.clear();
  locations.clear();
  ridenames.clear();
  String lines[] = loadStrings(url);
  for (int i=0; i<lines.length; i++) {
    String[] minutes = match(lines[i], "([0-9]+) Min");
    if (minutes != null) {
      for (int j=0; j<minutes.length; j++) {
        if (j == 1) {
          times.append(minutes[j]);
        }
      }
      String[] ride = match(lines[i-2], "<H2>(.+)</H2>");
      for (int k=0; k<ride.length; k++) {
        if (k==1) {
          ridenames.append(ride[k]);
        }
      }
      String[] location = match(lines[i-1], "<H2>(.+)</H2>");
      for (int l=0; l<location.length; l++) {
        if (l==1) {
          locations.append(location[l]);
        }
      }
    }
  }
}

//private void parseTEST() {
//  times.clear();
//  locations.clear();
//  ridenames.clear();
//  times.append("10");
//  locations.append("Tomorrowland");
//  ridenames.append("People Mover");
//  times.append("20");
//  locations.append("Fantasyland");
//  ridenames.append("Princess Anna");
//}