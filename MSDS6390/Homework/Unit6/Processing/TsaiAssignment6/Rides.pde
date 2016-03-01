ArrayList<Rides> alRides = new ArrayList<Rides>();
Rides[] rides;

class Rides implements Comparable<Rides>{
  Rides(int time, String location, String ride){
    this.time = time;
    this.location = location;
    this.ride = ride;
  }
  void setTime(int time) {
    this.time = time;
  }
  int getTime() {
    return this.time;
  }
  void setLocation(String location) {
    this.location = location;
  }
  String getLocation() {
    return this.location;
  }
  void setRide(String ride) {
    this.ride = ride;
  }
  String getRide() {
    return this.ride;
  }
  int compareTo(Rides r) {
    int compareTime = ((Rides)r).getTime();
    return this.time - compareTime;
  }
  String ride;
  String location;
  int time;
}

void initRides() {
  // parse HTML - can plug in another parser here
  alRides.clear();
  //parseTEST();
  parseHTML();
  for(int i=0; i<ridenames.size(); i++) {
    String r=ridenames.get(i);
    String l=locations.get(i);
    int t=parseInt(times.get(i));
    alRides.add(new Rides(t, l, r));
  }
  // convert array list to array
  rides = alRides.toArray(new Rides[alRides.size()]);
  // sort the array by time
  java.util.Arrays.sort(rides);
}

void printRides() {
  for (int i=0; i<rides.length; i++) {
    Rides ride = rides[i];
    println(ride.getRide() + "=> " + ride.getTime() + "," + ride.getLocation());
  }
}

String printDateTime() {
  return (new java.util.Date().toString());
}

float getAverageWaitTime() {
  int total = 0;
  for(int k=0; k<times.size(); k++)
    total = total + parseInt(times.get(k));
  if (times.size() == 0) return 0;
  return (float)total/(float)times.size();
}

void mouseClicked() {
  pi++;
  if (pi == 4)
    pi = 0;
  initRides();
}