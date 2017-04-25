/* Assignment 11
 * MSDS 6391 - 04/22/17
 * James Tsai, Wid Sogata
 *
 * Hotels close to SMU
 * Ratings derived from Google Maps
 */

var points = [
  /* 5-star hotels */
  {lat: 32.792226, lng: -96.803659, val1: 4.6, val2: 429, val3: 3.90, val4: 5.70, name: "The Ritz-Carlton, Dallas"},
  {lat: 32.804145, lng: -96.807352, val1: 4.5, val2: 285, val3: 2.90, val4: 3.60, name: "Rosewood Mansion on Turtle Creek"},
  {lat: 32.801931, lng: -96.833220, val1: 4.0, val2: 129, val3: 6.70, val4: 4.00, name: "Hilton Garden Inn Dallas/Market Center"},
  {lat: 32.905849, lng: -96.921287, val1: 4.3, val2: 115, val3: 15.9, val4: 11.2, name: "Omni Dallas Hotel at Park West"},
  {lat: 32.862930, lng: -96.958358, val1: 4.6, val2: 395, val3: 17.7, val4: 11.3, name: "Four Seasons at Las Colinas"},
  /* 4-star hotels */
  {lat: 32.826141, lng: -96.847008, val1: 5.0, val2: 131, val3: 3.90, val4: 1.30, name: "Aloft Dallas Love Field"},
  {lat: 32.836142, lng: -96.777876, val1: 4.4, val2: 159, val3: 0.70, val4: 4.40, name: "The Highland Dallas"},
  {lat: 32.819910, lng: -96.786350, val1: 3.3, val2: 79,  val3: 1.30, val4: 4.80, name: "La Quinta Inn Dallas Uptown"},
  {lat: 32.809127, lng: -96.809373, val1: 4.4, val2: 137, val3: 2.60, val4: 3.00, name: "Warwick Melrose - Dallas"},
  {lat: 32.862730, lng: -96.810101, val1: 4.2, val2: 160, val3: 2.80, val4: 4.30, name: "Hilton Dallas/Park Cities"},
  {lat: 32.785915, lng: -96.801793, val1: 4.2, val2: 219, val3: 4.30, val4: 6.00, name: "Fairmont Dallas"},
  {lat: 32.886728, lng: -96.771363, val1: 4.1, val2: 99,  val3: 3.60, val4: 7.80, name: "Courtyard by Marriott Dallas Central Expressway"},
  {lat: 32.794225, lng: -96.801405, val1: 4.5, val2: 240, val3: 3.70, val4: 5.80, name: "Hotel ZaZa Dallas"},
  {lat: 32.800400, lng: -96.830386, val1: 4.3, val2: 139, val3: 7.10, val4: 4.50, name: "Hilton Anatole"},
  //{lat: 32.840324, lng: -96.775173, val1: 4.1, val2: 129, val3: 0.70, name: "Magnolia Hotel Dallas Park Cities"},
  /* 3-star hotels */
  {lat: 32.840102, lng: -96.788719, val1: 4.3, val2: 233, val3: 0.40, val4: 4.00, name: "The Lumen"},
  {lat: 32.836140, lng: -96.777952, val1: 4.4, val2: 159, val3: 0.70, val4: 4.40, name: "The Highland Dallas"},
  {lat: 32.862852, lng: -96.768569, val1: 3.9, val2: 159, val3: 3.00, val4: 7.30, name: "Doubletree by Hilton Hotel Dallas - Campbell Centre"},
  {lat: 32.833836, lng: -96.834855, val1: 4.0, val2: 149, val3: 3.00, val4: 1.00, name: "Doubletree by Hilton Hotel Dallas - Love Field"},
  {lat: 32.887408, lng: -96.770909, val1: 3.6, val2: 139, val3: 3.60, val4: 7.90, name: "Residence Inn by Marriott Dallas Central Expressway"},
  {lat: 32.883074, lng: -96.770866, val1: 3.7, val2: 99,  val3: 2.90, val4: 7.60, name: "La Quinta Inn & Suites Dallas North Central"},
  {lat: 32.862231, lng: -96.771599, val1: 4.2, val2: 159, val3: 2.00, val4: 6.60, name: "Hyatt House Dallas/Lincoln Park"}
];
