loadMap = function(lat, lng){
    //alert(lat + " " + lng);
    var latitude = lat || 0
    var longitude = lng || 0
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([
      {
        "lat": latitude,
        "lng": longitude,
        "picture": {
          "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
          "width":  32,
          "height": 32
        },
        "infowindow": "hello!"
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    if(navigator.geolocation)
        navigator.geolocation.getCurrentPosition(displayOnMap);
  });
 };