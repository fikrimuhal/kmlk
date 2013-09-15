<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html><!--<![endif]-->
<head>
    <title>Kimlik.io</title>

    <!-- Meta -->
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Bootstrap -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Bootstrap Extended -->
    <link href="/bootstrap/extend/jasny-bootstrap/css/jasny-bootstrap.min.css" rel="stylesheet">
    <link href="/bootstrap/extend/jasny-bootstrap/css/jasny-bootstrap-responsive.min.css" rel="stylesheet">

    <!-- JQueryUI v1.9.2 -->
    <link rel="stylesheet" href="/kimlik/scripts/jquery-ui-1.9.2.custom/css/smoothness/jquery-ui-1.9.2.custom.min.css"/>

    <!-- Glyphicons -->
    <link rel="stylesheet" href="/kimlik/css/glyphicons.css"/>

    <!-- Bootstrap Extended -->
    <link rel="stylesheet" href="/bootstrap/extend/bootstrap-select/bootstrap-select.css"/>
    <link rel="stylesheet"
          href="/bootstrap/extend/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css"/>

    <!-- Uniform -->
    <link rel="stylesheet" media="screen" href="/kimlik/scripts/pixelmatrix-uniform/css/uniform.default.css"/>

    <!-- JQuery v1.8.2 -->
    <script src="/kimlik/scripts/jquery-1.8.2.min.js"></script>

    <!-- Modernizr -->
    <script src="/kimlik/scripts/modernizr.custom.76094.js"></script>

    <!-- MiniColors -->
    <link rel="stylesheet" media="screen" href="/kimlik/scripts/jquery-miniColors/jquery.miniColors.css"/>

    <!-- JQuery Lightbox -->
    <script type="text/javascript" src="/kimlik/scripts/jquery-lightbox/js/jquery.lightbox-0.5.js"></script>
    <link rel="stylesheet" type="text/css" href="/kimlik/scripts/jquery-lightbox/css/jquery.lightbox-0.5.css"
          media="screen"/>

    <!-- PrettyPhoto -->
    <script type="text/javascript" src="/kimlik/scripts/prettyphoto/js/jquery.prettyPhoto.js"></script>
    <link rel="stylesheet" type="text/css" href="/kimlik/scripts/prettyphoto/css/prettyPhoto.css" media="screen"/>

    <!-- Theme -->
    <link rel="stylesheet" href="/kimlik/css/style.min.css?1363976729"/>

    <!-- LESS 2 CSS -->
    <script src="/kimlik/scripts/less-1.3.3.min.js"></script>
    <!--[if lt IE 8]><script type="text/javascript" src="/kimlik/scripts/json2.js"></script><![endif]-->

    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body data-spy="scroll" data-target="#menu" ng-app="kimlik">

<!-- Start Content -->
<div class="container left-menu">

    <div id="wrapper">

        <g:render template="/kimlik/leftMenu"></g:render>

        <div id="content">
            <!-- Menu Toggle on mobile -->
            <button type="button" class="btn btn-navbar main" data-spy="affix" data-offset-top="50">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>

            </button>

            <div class="separator"></div>

            %{--<g:render template="/kimlik/alerts"></g:render>--}%
            <div class="heading-buttons">
                <h2 class="glyphicons user"><i></i>${profile.name}<span
                        class="visible-desktop">| ${profile.workHistory.lastEntity.position}</span>
                </h2>

                <div class="buttons pull-right">
                    <a href="#" class="btn-action border-only circle glyphicons print btn-primary"><i></i></a>
                    <a href="#" class="btn-action border-only circle glyphicons download btn-primary"><i></i></a>
                </div>

                <div class="clearfix"></div>
            </div>

            <g:layoutBody></g:layoutBody>

        </div> <!-- content END-->

    </div> <!-- wrapper END-->

</div> <!-- container END-->

%{--<g:render template="/kimlik/themer"/>--}%


<!-- JQueryUI v1.9.2 -->
<script src="/kimlik/scripts/jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.min.js"></script>

<!-- JQueryUI Touch Punch -->
<!-- small hack that enables the use of touch events on sites using the jQuery UI user interface library -->
<script src="/kimlik/scripts/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<!-- MiniColors -->
<script src="/kimlik/scripts/jquery-miniColors/jquery.miniColors.js"></script>

<!-- Themer -->
<script>
    var themerPrimaryColor = '#71c39a';
</script>
<script src="/kimlik/scripts/jquery.cookie.js"></script>
%{--<script src="/kimlik/scripts/themer.js"></script>--}%

<!-- Resize Script -->
<script src="/kimlik/scripts/jquery.ba-resize.js"></script>

<!-- Uniform -->
<script src="/kimlik/scripts/pixelmatrix-uniform/jquery.uniform.min.js"></script>

<!-- Bootstrap Script -->
<script src="/bootstrap/js/bootstrap.min.js"></script>

<!-- Bootstrap Extended -->
<script src="/bootstrap/extend/bootstrap-select/bootstrap-select.js"></script>
<script src="/bootstrap/extend/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js"></script>
%{--<script src="/bootstrap/extend/jasny-bootstrap/js/jasny-bootstrap.min.js" type="text/javascript"></script>--}%
<script src="/bootstrap/extend/jasny-bootstrap/js/bootstrap-fileupload.js" type="text/javascript"></script>

%{--Alert box's--}%
%{--<script src="/bootstrap/extend/bootbox.js" type="text/javascript"></script>--}%

<!-- JQuery Quicksand -->
<script src="/kimlik/scripts/jquery-animate-css-rotate-scale/jquery-css-transform/jquery-css-transform.js"></script>
<script src="/kimlik/scripts/jquery-animate-css-rotate-scale/jquery-animate-css-rotate-scale.js"></script>
<script src="/kimlik/scripts/jquery.quicksand.js"></script>
<script src="/kimlik/scripts/jquery.easing.1.3.js"></script>

<!-- Google Maps API -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3.5&amp;sensor=false"></script>

<!-- Custom Onload Script -->
<script src="/kimlik/scripts/load.js"></script>


<!-- Masonry -->
<script src="/kimlik/scripts/jquery.masonry.min.js"></script>
<script>
    function masonryGallery() {
        var $container = $('.quicksand-gallery ul');
        $container.each(function () {
            var c = $(this);

            if (c.is('.masonry'))
                c.masonry('reload');

            c.imagesLoaded(function () {
                c.masonry({
                    gutterWidth: 18,
                    itemSelector: 'li',
                    columnWidth: c.find('li:first').width() - 5,
                    isAnimated: true,
                    animationOptions: {
                        duration: 250,
                        easing: 'linear',
                        queue: true
                    }
                });
            });
        });
    }
    $(function () {
        masonryGallery();

        $(window).resize(function (e) {
            masonryGallery();
        });
    });
</script>

%{--<!-- Twitter -->--}%
%{--<script src="/kimlik/scripts/twitter.js"></script>--}%
<r:layoutResources/>

</body>
</html>