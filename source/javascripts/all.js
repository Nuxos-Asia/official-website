//= require "jquery"
//= require "bootstrap"
//= require "classie"
//= require "jqBootstrapValidation"
//= require "contact_me"
//= require "agency"


$(function () {
// ------------------------------
// GOOGLE MAP

    function initializeMap() {
        if ($('.map').length) {
            var mapCanvas = $('#map-canvas');
            var myLatlng = new google.maps.LatLng(mapCanvas.data("latitude"), mapCanvas.data("longitude"));
            var mapOptions = {
                zoom: mapCanvas.data("zoom"),
                center: myLatlng
            }
            var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);


            //var marker = new google.maps.Marker({
            //    position: myLatlng,
            //    map: map
            //});

            var infowindow = new google.maps.InfoWindow();
            var service = new google.maps.places.PlacesService(map);

            service.getDetails({
                placeId: 'ChIJv9FDv82Y4jARZ_Z9RfNnies'
            }, function(place, status) {
                if (status === google.maps.places.PlacesServiceStatus.OK) {

                    var marker = new google.maps.Marker({
                        map: map,
                        position: place.geometry.location,
                        disableDefaultUI: true
                    });
                    google.maps.event.addListener(marker, 'click', function() {
                        infowindow.setContent(place.name);
                        infowindow.setContent(place.name);
                        infowindow.setContent(place.name);
                        infowindow.open(map, this);
                    });
                }
            });
        }
    }

    if ($('.map').length) {
        google.maps.event.addDomListener(window, 'load', initializeMap);
    }
// ------------------------------

});
