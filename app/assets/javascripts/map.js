var myDivIcon;
var map;

function initMap() {
	console.log("start loading map");

	// the map
	var london = [51.505, -0.09];
	var kaulsdorf = [52.4775692, 13.5670469];
	var berlin = [52.455095,13.525432];
	map = L.map('map', {zoomControl: false}).setView(london, 12);

	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
		attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	}).addTo(map);

	L.control.zoom({position: 'bottomright'}).addTo(map);

	myDivIcon = L.divIcon({	// automatically gets classes leaflet-marker-icon and leaflet-div-icon
		popupAnchor:  [-3, -76], // point from which the popup should open relative to the iconAnchor
		iconSize:     [44, 52], // size of the icon
		shadowSize:   [60, 60], // size of the shadow
		iconAnchor:   [22, 50], // point of the icon which will correspond to marker's location
		shadowAnchor: [12, 60],  // the same for the shadow
		popupAnchor:  [-3, -52] // point from which the popup should open relative to the iconAnchor
	});

	// for testing
	//L.marker(berlin, {title: 'HTW'}).addTo(map).bindPopup('HTW');
	//
		
	/**
	 * map resize
	 * if sidebar is toggled: wait for 500ms and resize map (keep center)
	 * */
	$(".sidebar-toggle").on("click tap", function() {
		var c = map.getCenter();
		setTimeout( function() { 
				console.log("resize map!");
				map.invalidateSize();
				map.panTo(c);
			}, 500);
	});
	
	// Script for adding marker on map click
	function onMapClick(e) {
		console.log(e.latlng);
		var lnk3 = $("#new-link").attr("href");
		console.log(lnk3);
		var lnk4 = lnk3 + "?latitude=" + e.latlng.lat + "&longitude=" + e.latlng.lng;
		console.log(lnk4);
		
		$("#new-link").attr('href', lnk4);
		$("#new-link")[0].click();
		$("#new-link").attr('href', lnk3);

	}

	map.on('click', onMapClick);
	
	console.log("map loaded!");
}
	
/**
 * get current location (browser) and draw map
 * default to London, if no coordinates present
 * author: Laura
 * */	
function geoFindMe() {
  if (!navigator.geolocation){error();}

  function success(position) {
	var output = [position.coords.latitude, position.coords.longitude]
	var zoom = map.getZoom();
	map.flyTo(output, zoom)
	//map.setView(output, zoom)
	map.panTo(output);
  };

  function error() {
	// do nothing
  };

  navigator.geolocation.getCurrentPosition(success, error);
}

/**
 * wenn alles geladen ist: zentriere map auf derzeitigen Standort
 * */
$(document).ready(function(){
	console.log("do geosearch");
	geoFindMe();
});
	