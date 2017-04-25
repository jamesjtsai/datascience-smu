/* Assignment 11
 * MSDS 6391 - 04/22/17
 * James Tsai, Wid Sogata
 *
 * Partially derived from crossfilter's example
 * Colors chosen from: https://www.smu.edu/DevelopmentExternalAffairs/PublicAffairs/IntegratedMarketing/Branding/Colors \
 */

var map;
var markers = [];

var filter;
var val1Dimension;
var val1Grouping;
var val2Dimension;
var val2Grouping;
var val3Dimension;
var val3Grouping;
var val4Dimension;
var val4Grouping;
var charts;
var domCharts;

var latDimension;
var lngDimension;
var idDimension;
var idGrouping;

function init() {
  initMap();
  initCrossfilter();

  // bind map bounds to lat/lng filter dimensions
  latDimension = filter.dimension(function(p) { return p.lat; });
  lngDimension = filter.dimension(function(p) { return p.lng; });
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = this.getBounds();
    var northEast = bounds.getNorthEast();
    var southWest = bounds.getSouthWest();

    // NOTE: need to be careful with the dateline here
    lngDimension.filterRange([southWest.lng(), northEast.lng()]);
    latDimension.filterRange([southWest.lat(), northEast.lat()]);

    // NOTE: may want to debounce here, perhaps on requestAnimationFrame
    updateCharts();
  });

  // dimension and group for looking up currently selected markers
  idDimension = filter.dimension(function(p, i) { return i; });
  idGrouping = idDimension.group(function(id) { return id; });

  renderAll();
}

function initMap() {
  google.maps.visualRefresh = true;

  var myLatlng = new google.maps.LatLng(32.841182, -96.784464);
  var mapOptions = {
    zoom: 12,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    mapTypeControl: false,
    streetViewControl: true,
    panControl: false
  };
  map = new google.maps.Map(document.getElementById('map-div'), mapOptions);

var locations = [
  ['Magnolia Hotel Dallas Park Cities (Get My Diploma Here!)', 32.840571, -96.775416, 2],
  ['Southern Methodist University', 32.841182, -96.784464, 1]
];

var visiting = [
  ['Margaret Hunt Hill Bridge', 32.781828, -96.817662, 3],
  ['Texas Book Repository', 32.780118, -96.808409, 2],
  ['The Dallas World Aquarium', 32.783420, -96.805115, 1]
];

var image = 'images/blue_MarkerS.png';
var image2 = 'images/darkgreen_MarkerV.png'
var infowindow = new google.maps.InfoWindow();

var marker, i;

for (i = 0; i < locations.length; i++) {
  marker = new google.maps.Marker({
    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
    map: map,
    icon: image,
    animation: google.maps.Animation.DROP
  });

  google.maps.event.addListener(marker, 'click', (function(marker, i) {
    return function() {
      infowindow.setContent(locations[i][0]);
      infowindow.open(map, marker);
    }
  })(marker, i));
}

for (i = 0; i < visiting.length; i++) {
  marker = new google.maps.Marker({
    position: new google.maps.LatLng(visiting[i][1], visiting[i][2]),
    map: map,
    icon: image2
  });

  google.maps.event.addListener(marker, 'click', (function(marker, i) {
    return function() {
      infowindow.setContent(visiting[i][0]);
      infowindow.open(map, marker);
    }
  })(marker, i));
}

// create array of markers from points and add them to the map
  for (var i = 0; i < points.length; i++) {
    var point = points[i];
    markers[i] = new google.maps.Marker({
      position: new google.maps.LatLng(point.lat, point.lng),
      map: map,
      title: point.name
    });
  }
}

function initCrossfilter() {
  filter = crossfilter(points);

  // simple dimensions and groupings for major variables
  val1Dimension = filter.dimension(
      function(p) {
        return p.val1;
      });

  val1Grouping = val1Dimension.group(
      function(v) {
        //return Math.floor(v);
        return v;
      });

  val2Dimension = filter.dimension(
      function(p) {
        return p.val2;
      });

  val2Grouping = val2Dimension.group(
      function(v) {
        return v;
      });

  val3Dimension = filter.dimension(
      function(p) {
        return p.val3;
      });

  val3Grouping = val3Dimension.group(
      function(v) {
        return v;
      });

  val4Dimension = filter.dimension(
      function(p) {
        return p.val4;
      });

  val4Grouping = val4Dimension.group(
      function(v) {
        return v;
      });

  // initialize charts (helper function in chart.js)
  // taken directly from crossfilter's example
  charts = [
    barChart()
      .dimension(val1Dimension)
      .group(val1Grouping)
      .x(d3.scale.linear()
          .domain([0, 5.5])
          .rangeRound([0, 20 * 10])),

    barChart()
      .dimension(val2Dimension)
      .group(val2Grouping)
      .x(d3.scale.linear()
          .domain([0, 500])
          .rangeRound([0, 40 * 10]))
      .filter([75, 525]),

    barChart()
      .dimension(val3Dimension)
      .group(val3Grouping)
      .x(d3.scale.linear()
          .domain([0, 20])
          .rangeRound([0, 20 * 10])),

    barChart()
      .dimension(val4Dimension)
      .group(val4Grouping)
      .x(d3.scale.linear()
          .domain([0, 20])
          .rangeRound([0, 20 * 10]))
  ];

  // bind charts to dom
  domCharts = d3.selectAll(".chart")
      .data(charts)
      .each(function(chart) { chart.on("brush", renderAll).on("brushend", renderAll); });
}

// Renders the specified chart
function render(method) {
  d3.select(this).call(method);
}

// Renders all of the charts
function updateCharts() {
  domCharts.each(render);
}

// set visibility of markers based on crossfilter
function updateMarkers() {
  var pointIds = idGrouping.all();
  for (var i = 0; i < pointIds.length; i++) {
    var pointId = pointIds[i];
    markers[pointId.key].setVisible(pointId.value > 0);
  }
}

// Whenever the brush moves, re-render charts and map markers
function renderAll() {
  updateMarkers();
  updateCharts();
}

// Reset a particular histogram
window.reset = function(i) {
  charts[i].filter(null);
  renderAll();
};
