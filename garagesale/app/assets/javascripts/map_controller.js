
loadMap = function(coords, salesData){
  var valid = coords.length === salesData.length;
  var numSales = coords.length;
  var multi = numSales > 1;
  
    //alert(lat + " " + lng);
    //var latitude = lat || 0
    //var longitude = lng || 0
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    var saleMarkers = [];
    for(var i = 0; i < numSales; i++) {
      var saleMarker = {
        "lat": coords[i].lat,
        "lng": coords[i].lng,
        "picture": {
          "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
          "width":  32,
          "height": 32
        },
        "infowindow": salesData[i].description
      };
      saleMarkers.push(saleMarker);
    }
    markers = handler.addMarkers(
      saleMarkers
    );
    handler.bounds.extendWith(markers);
    //handler.map.centerOn(marker);
    handler.fitMapToBounds();
    if(!multi) {handler.getMap().setZoom(18);}
    /*if(navigator.geolocation)
        navigator.geolocation.getCurrentPosition(displayOnMap);*/
  });
};