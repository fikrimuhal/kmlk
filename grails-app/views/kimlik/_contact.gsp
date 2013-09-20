<r:script >

    /* Google Maps API */
    if (typeof google != 'undefined')
    {
        var map_latlng = new google.maps.LatLng(${profile.contactInfo.address.googleMapsCoordinates.latitude?:0},${profile.contactInfo.address.googleMapsCoordinates.longitude?:0});
        var map_options = {
            zoom: ${profile.contactInfo.address.googleMapsCoordinates.zoomLevel},
            center: map_latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            panControl: false,
            zoomControl: false,
            scaleControl: false,
            mapTypeControl: false,
            disableDefaultUI: true,
            styles: [
                {
                    stylers: [
                        { saturation: -100 }
                        //{ hue: "#ffffff" }
                    ]
                },
                {
                    elementType: "labels.text.fill",
                    stylers: [{ color: themerPrimaryColor }]
                }
            ]
        };

        var markerIconDefault_image = new google.maps.MarkerImage("theme/images/marker.png",
                // This marker is 44 pixels wide by 56 pixels tall.
                new google.maps.Size(44, 56),
                // The origin for this image is 0,0.
                new google.maps.Point(0, 0),
                // The anchor for this image is the base of the flagpole at 0,32.
                new google.maps.Point(22, 56));

        var markerIconDefault_shadow = new google.maps.MarkerImage("theme/images/marker_shadow.png",
                // This marker is 44 pixels wide by 56 pixels tall.
                new google.maps.Size(37, 21),
                // The origin for this image is 0,0.
                new google.maps.Point(0,0),
                // The anchor for this image is the base of the flagpole at 0,32.
                new google.maps.Point(20, 10));

        var markerIconDefault_shape = {
            coord: [1, 1, 1, 52, 42, 52, 42 , 1],
            type: 'poly'
        };

    }

    function initializeMap(el, options)
    {
        if (typeof google == 'undefined')
            return false;

        var map = new google.maps.Map(document.getElementById(el), options);
        var marker = new google.maps.Marker({
            position: map_latlng,
            title: 'My Location',
          //  shadow: markerIconDefault_shadow,
           // icon: markerIconDefault_image,
            map: map
        });
    }
</r:script>
<div class="separator line" id="contact"></div>

<h3 class="glyphicons envelope"><i></i>Contact me</h3>
<div class="row-fluid">
    <div class="span6">
        <div class="well" id="contact_gmap"></div>
    </div>
    <div class="span6">
        <h4>Send me a message</h4>
        <form class="row-fluid">
            <input type="text" class="span12" name="name" placeholder="YOUR NAME" /><br/>
            <input type="text" class="span12" name="phone" placeholder="PHONE" /><br/>
            <textarea name="message" class="span12" rows="5" placeholder="YOUR MESSAGE"></textarea><br/>
            <button class="btn btn-primary btn-large btn-icon glyphicons envelope">
                <i></i> Send message
            </button>
        </form>
    </div>
</div>