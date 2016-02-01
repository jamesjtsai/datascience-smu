void drawSky() {
  seconds = second();
  int index = seconds/3;
  // day time sky (gradual increase in brightness)
  // traverse thru array from darkest to brightest every 3 seconds
  if (seconds>=0 && seconds<30) {
    background(skyColors[index]);
  }
  // night time sky (gradual decrease in brightness)
  // traverse thru array from brightest to darkest every 3 seconds
  if (seconds>=30 && seconds<=59) {
    index = 9-((seconds-30)/3);
    background(skyColors[index]);
  }
  // draw sun and apply colors to window, clouds, and ground
  // increase and decrease intensity (radius) of the sun based on seconds
  if (seconds>=15 && seconds<45) {
    float intensity = 600-(abs(30-seconds)*40);
    drawSun(width/4, height/4, 50, intensity, yellow, -550);
    windowColor = white;
    cloudColor = white;
    groundColor = grass;
  }
  // draw moon and apply colors to window, clouds, and ground
  if (seconds>=45 || seconds<15) {
    drawStars();
    drawMoon(width/4, height/4, 125, 125, white);
    windowColor = yellow;
    cloudColor = grey;
    groundColor = meadow;
  }
  // clouds are always present
  drawClouds();
}

// array of 10 shades of Deep Sky Blue
void initSky() {
  skyColors[0] = blackPearl1;
  skyColors[1] = blackPearl2;
  skyColors[2] = blackPearl3;
  skyColors[3] = nordic;
  skyColors[4] = sherpaBlue1;
  skyColors[5] = sherpaBlue2;
  skyColors[6] = blueLagoon;
  skyColors[7] = easternBlue;
  skyColors[8] = bondiBlue;
  skyColors[9] = deepSkyBlue;
}