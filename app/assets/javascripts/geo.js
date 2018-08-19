$(function() {
  $(document).on("click", "button#delivery", function() {
    var options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };
    $("div#delivery-msg").html("");
    $("button.delib").toggleClass("is-loading");
    $("a#gmap").addClass("in-active");
    navigator.geolocation.getCurrentPosition(geosuccess, geoerror, options);
  });
});

function geosuccess(pos) {
  var crd = pos.coords;

  console.log('Your current position is:');
  console.log(`Latitude : ${crd.latitude}`);
  console.log(`Longitude: ${crd.longitude}`);
  console.log(`More or less ${crd.accuracy} meters.`);
  $("a#gmap").attr("href", "https://www.google.com/maps/?q="+crd.latitude+","+crd.longitude);

  var parsed_data = {
    lat: crd.latitude,
    long: crd.longitude
  }

  $.ajax({
    url: "/carts/location/",
    type: "GET",     
    dataType: 'script', 
    data: parsed_data
  });

  $("div#delivery-msg").html('<span class="tag is-success is-large" id="dev-error">Location received &nbsp<button class="delete" id="dev-dismiss"></button></span>')
  $("button.delib").toggleClass("is-loading");
  $("a#gmap").removeClass("in-active");

  url = $("a#pay-ctrl").attr("data-temp");
  $("a#pay-ctrl").attr("href", url);
  $("a#pay-ctrl").removeAttr("disabled");
}

function geoerror(err) {
  console.warn(`ERROR(${err.code}): ${err.message}`);
  $("div#delivery-msg").html('<span class="tag is-danger is-large" id="dev-error">Error getting location &nbsp<button class="delete" id="dev-dismiss"></button></span>')
  $("button.delib").toggleClass("is-loading");
}