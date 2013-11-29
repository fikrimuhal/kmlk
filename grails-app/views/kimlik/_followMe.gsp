<h3 class="font-thin"><i class="fa fa-share"></i>Takip et <small> Bana ulasabiliceğiniz sosyal ağlar.</small> </h3>
<div class="separator line"></div>

<br/>
<div class="row">
    <div class="col-lg-6">
        <g:if test="${profile?.accounts?.hasFacebook()}">
            <a href="http://facebook.com/${profile.accounts.facebook.remoteId}"
               class="btn btn-circle btn-sm btn-facebook"><i class="fa fa-facebook"></i></a>
        </g:if>
        <g:if test="${profile?.accounts?.hasTwitter()}">
            <a class="btn btn-circle btn-sm btn-twitter"><i class="fa fa-twitter"></i></a>
        </g:if>
        <g:if test="${profile?.accounts?.hasGoogle()}">
            <button class="btn btn-circle btn-sm btn-gplus"><i class="fa fa-google-plus"></i></button>
        </g:if>
        <g:if test="${profile?.accounts?.hasLinkedin()}">
            <a href="http://www.linkedin.com/profile/view?id=${profile.accounts.linkedin.remoteId}" class="btn btn-circle btn-sm "><i class="fa fa-linkedin"></i></a>
        </g:if>

    %{--<button class="btn btn-action btn-primary btn-large glyphicons tumblr"><i></i></button>--}%

    %{----}%
    %{--<button class="btn btn-action btn-primary btn-large glyphicons dribbble"><i></i></button>--}%
    %{--<button class="btn btn-action btn-primary btn-large glyphicons deviantart"><i></i></button>--}%
    %{--<button class="btn btn-action btn-primary btn-large glyphicons picasa"><i></i></button>--}%
    </div>

    <div class="col-lg-6">
        %{--<p class="lead">Takip ettigim ve bana ulasabiliceginiz sosyal aglar.</p>--}%
        <blockquote class="pull-right">
            <p>${profile.aboutText}</p>
            %{--<small>${profile.name}</small>--}%
        </blockquote>
    </div>
</div>
<br/>


<script src="http://maps.google.com/maps/api/js?sensor=true" cache="false"></script>

<script type="text/javascript">
    function initialize() {

        // Create an array of styles.
        var styles = [
            {
                stylers: [
                    { hue: "#428bca" },
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
        var location = new google.maps.LatLng(41.01, 28.981)
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
            draggable: false,
            animation: google.maps.Animation.DROP,
            title: "Biz"
        });
        //Associate the styled map with the MapTypeId and set it to display.
        map.mapTypes.set('map_style', styledMap);
        map.setMapTypeId('map_style');
    }
    initialize()
</script>
