
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
    //saleMarkers will hold the data concerning all current sales
    var saleMarkers = [];
    //If there are sales
    if(numSales >= 1) {
      //Loops through sales and add markers for each, including the location and description
      for(var i = 0; i < numSales; i++) {
        var saleMarker = {
          "lat": coords[i].lat,
          "lng": coords[i].lng,
          "picture": {
            "url": defaultPicture,
            "width":  32,
            "height": 32
          },
          //This displays the title of the sale along with the description, formatted in HTML
          "infowindow": ("<b><u>" + salesData[i].title + "</u></b><br/>" + 
                        salesData[i].description + "<br/>" + 
                        "<a href='/sales/" + salesData[i].id + "'>Go to sale</a>")
        };
        saleMarkers.push(saleMarker);
      }
      markers = handler.addMarkers(
        saleMarkers
      );
      //gmaps4rails provides a way to dynamically zoom, allowing all markers to appear within the map bounds
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      //If there is only one sale, the zoom is set accordingly
      if(!multi) {
        handler.getMap().setZoom(18);
      }
    } else {
      //If there are no sales, the zoom is set accordingly
      handler.getMap().setZoom(1);
    }
  });
};