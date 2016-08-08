
var defaultPicture = "";

setDefaultPicture = function(pictureURL) {
  defaultPicture = pictureURL;
};

loadMap = function(coords, salesData){
  var valid = coords.length === salesData.length;
  var numSales = coords.length;
  var multi = numSales > 1;
  
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    var saleMarkers = [];
    for(var i = 0; i < numSales; i++) {
      var saleMarker = {
        "lat": coords[i].lat,
        "lng": coords[i].lng,
        "picture": {
          "url": defaultPicture,
          "width":  32,
          "height": 32
        },
        "infowindow": ("<b><u>" + salesData[i].title + "</u></b><br/>" + 
                      salesData[i].description + "<br/>" + 
                      "<a href='/sales/" + salesData[i].id + "'>Go to sale</a>")
      };
      saleMarkers.push(saleMarker);
    }
    markers = handler.addMarkers(
      saleMarkers
    );
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    if(!multi) {
      handler.getMap().setZoom(18);
    }
  });
};