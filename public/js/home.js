$(document).ready(function(){
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        console.log("Geolocation is not supported by this browser.");
    }

});

function showPosition(position) {
    console.log(position.coords.latitude);
    console.log(position.coords.longitude);

    var lat = position.coords.latitude;
    var lng = position.coords.longitude;


    var params = {
        latlng: position.coords.latitude+","+position.coords.longitude,
        sensor: 'true'
    };

    $.get('http://maps.googleapis.com/maps/api/geocode/json', params, function(result) {
        //console.log(result.results[0].address_components.length);
        var address_length = result.results[0].address_components.length;
        var zipcode = result.results[0].address_components[address_length-1].long_name;
        console.log(zipcode);
    });


}

function showError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            console.log("User denied the request for Geolocation.");
            break;
        case error.POSITION_UNAVAILABLE:
            console.log("Location information is unavailable.");
            break;
        case error.TIMEOUT:
            console.log("The request to get user location timed out.");
            break;
        case error.UNKNOWN_ERROR:
            console.log("An unknown error occurred.");
            break;
    }
}