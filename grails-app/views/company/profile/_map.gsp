<div class="bg-white-desktop" id="contact">

    <div id="gmap_geocoding" style="height:500px;"> </div>
</div>


<script src="http://maps.google.com/maps/api/js?sensor=true" cache="false"></script>

<script type="text/javascript">
    function initialize() {

        // Create an array of styles.
        var styles = [
            {
                stylers: [
                    { hue: "#0000" },
                    { saturation: -80 }
                ]
            },{
                featureType: "road",
                elementType: "geometry",
                stylers: [
                    { lightness: 100 },
                    { visibility: "simplified" }
                ]
            },{
                featureType: "road",
                elementType: "labels",
                stylers: [
                    { visibility: "off" }
                ]
            }
        ];
         var location = new google.maps.LatLng(${company.location?.latLng?.lat}, ${company.location?.latLng?.lng})
        // Create a new StyledMapType object, passing it the array of styles,
        // as well as the name to be displayed on the map type control.
        var styledMap = new google.maps.StyledMapType(styles,
                {name: "Styled Map"});

        // Create a map object, and include the MapTypeId to add
        // to the map type control.
        var mapOptions = {
            zoom: 11,
            center: location,
            scaleControl: false,
            draggable: false,
            scrollwheel: false,
            disableDoubleClickZoom: true,
            disableDefaultUI: true

        };
        var map = new google.maps.Map(document.getElementById('gmap_geocoding'),
                mapOptions);

        //marker
       var marker = new google.maps.Marker({
            position: location,
            map: map,
            draggable: true,
            animation: google.maps.Animation.DROP,
            title: "Biz"
        });
        //Associate the styled map with the MapTypeId and set it to display.
        map.mapTypes.set('map_style', styledMap);
        map.setMapTypeId('map_style');
    }
    initialize()
</script>