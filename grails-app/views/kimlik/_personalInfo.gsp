
<div class="row ">

    <div class="col-lg-6">
        <h1 class="font-thin">${profile.name}</h1>
        <br/>
            <div class="row">
                <div class="col-lg-3"><strong>Ad</strong></div>

                <div class="col-lg-9">${profile.name}</div>
            </div>

            <div class="row">
                <div class="col-lg-3"><strong>Email</strong></div>

                <div class="col-lg-9"><a href="#">${profile.contactInfo?.publicEmail}</a></div>
            </div>

            <div class="row">
                <div class="col-lg-3"><strong>Doğum Tarihi</strong></div>

                <div class="col-lg-9">${profile.birthDate}</div>
            </div>

            <div class="row">
                <div class="col-lg-3"><strong>Adres</strong></div>

                <div class="col-lg-9"><a href="#">${location.display_address?:' Görebilmek için login olun'}</a></div>
            </div>

            <div class="row">
                <div class="col-lg-3"><strong>Tel</strong></div>

                <div class="col-lg-9">${profile.contactInfo?.publicTel}</div>
            </div>

            <div class="row">
                <div class="col-lg-3"><strong>Web</strong></div>

                <div class="col-lg-9"><a href="${profile?.contactInfo?.webSite}">${profile?.contactInfo?.webSite}</a></div>
            </div>
        <br/>
    </div>
    <div class="col-lg-6">
        <div class="bg-white-desktop m-l-n m-r-n m-b-n m-t-n" style="margin-bottom: -90px;">

            <div id="gmap_geocoding" style="height:305px;"> </div>
        </div>
    </div>
</div>
<br/>


<script src="http://maps.google.com/maps/api/js?sensor=true" cache="false"></script>

<script type="text/javascript">
    //SS BEGIN
    var privacyLevel = ${location.privacyLevel};
    var address = {
        country: '${location.country}',
        city: '${location.city}',
        district: '${location.district}',
        lat: ${location.lat?:'null'},
        lng: ${location.lng?:'null'}
    };
    //SS END
    var map, marker;
    var ADDRESS_PRIVACY_LEVELS = {
        COUNTRY: 100,
        CITY: 200,
        DISTRICT: 300,
        FULL_ADDRESS: 1000}

    function setGeometryForPrivacyLevel(map) {
        var query_Address = '';

        //noinspection FallThroughInSwitchStatementJS
        switch (privacyLevel) {
            case ADDRESS_PRIVACY_LEVELS.DISTRICT:
                console.log('3')
                query_Address += address.district + ', ';
            case ADDRESS_PRIVACY_LEVELS.CITY:
                console.log('2')
                query_Address += address.city + ', ';
            case ADDRESS_PRIVACY_LEVELS.COUNTRY:
                console.log('1')
                query_Address += address.country + ', ';
                break;
            default:
                console.error('getLatLngForPrivacyLevel error');
        }
        console.debug('query_address = ', query_Address);
        geocode(query_Address, map)

    }

    function geocode(address, map) {
        console.log('geocode called')
        var geocoder = new google.maps.Geocoder();

        geocoder.geocode({ 'address': address}, function (results, status) {
            try {
                console.log('geocode try')

                if (status == google.maps.GeocoderStatus.OK) {
                    console.log('results', results);
                    map.panTo(results[0].geometry.location);
                    map.fitBounds(results[0].geometry.bounds);
                    marker.setPosition(results[0].geometry.location);


                } else {
//                    alert("Geocode was not successful for the following reason: " + status);
                }
            } catch (e) {
                throw e;
            } finally {

            }
        });

        return {}
    }

    function initialize() {

        // Create an array of styles.
        var styles = [
            {
                stylers: [
                    { hue: "#428bca" },
                    { saturation: -80 }
                ]
            },
            {
                featureType: "road",
                elementType: "geometry",
                stylers: [
                    { lightness: 100 },
                    { visibility: "simplified" }
                ]
            },
            {
                featureType: "road",
                elementType: "labels",
                stylers: [
                    { visibility: "off" }
                ]
            }
        ];

        var location;
        if (privacyLevel === ADDRESS_PRIVACY_LEVELS.FULL_ADDRESS) {
            location = new google.maps.LatLng(address.lat, address.lng)
        }


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
        map = new google.maps.Map(document.getElementById('gmap_geocoding'),
                mapOptions);

        //marker
        marker = new google.maps.Marker({
            position: location,
            map: map,
            draggable: false,
            animation: google.maps.Animation.DROP,
            title: "Biz"
        });
        //Associate the styled map with the MapTypeId and set it to display.
        map.mapTypes.set('map_style', styledMap);
        map.setMapTypeId('map_style');

    }
    initialize();
    if (privacyLevel !== ADDRESS_PRIVACY_LEVELS.FULL_ADDRESS) {
        setGeometryForPrivacyLevel(map)
    }
</script>
