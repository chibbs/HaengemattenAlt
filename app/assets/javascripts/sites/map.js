var layer = new ol.layer.Tile({
        source: new ol.source.OSM()
      });

      var london = ol.proj.transform([-0.12755, 51.507222], 'EPSG:4326', 'EPSG:3857');

      var view = new ol.View({
        center: london,
        zoom: 6
      });

      var map = new ol.Map({
        target: 'map',
        layers: [layer],
        view: view
      });

      // create an Overlay using the div with id location.
      var marker = new ol.Overlay({
        element: document.getElementById('location'),
        positioning: 'bottom-left',
        stopEvent: false
      });

      // add it to the map
      map.addOverlay(marker);

      // create a Geolocation object setup to track the position of the device
      var geolocation = new ol.Geolocation({
        tracking: true
      });

      // bind the projection to the view so that positions are reported in the
      // projection of the view
      geolocation.bindTo('projection', view);

      // bind the marker's position to the geolocation object, the marker will
      // move automatically when the GeoLocation API provides position updates
      marker.bindTo('position', geolocation);

      // when the GeoLocation API provides a position update, center the view
      // on the new position
      geolocation.on('change:position', function() {
        var p = geolocation.getPosition();
        console.log(p[0] + ' : ' + p[1]);
        view.setCenter([parseFloat(p[0]), parseFloat(p[1])]);
      });