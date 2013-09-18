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


    <r:require modules="kimlik"/>

    <g:layoutHead/>
    <r:layoutResources/>

    <style type="text/css">
    #currentUser {
        position: fixed;
        top: 5px;
        float: right;
        right: 0px;
        z-index: 9999;
        padding: 5px;
        width: 200px;
        background-color: rgba(188, 188, 188, 0.69);;
    }
    </style>

</head>

<body data-spy="scroll" data-target="#menu" ng-app="kimlik">

<r:script>
    var kimlik = angular.module('kimlik', ['ui.bootstrap', 'ngResource']);
    alert('eloo')
    function UserController($scope, $http, filterFilter, $resource, skillService) {

    }
</r:script>
<div id="currentUser">
    <span class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <div>
                <span class="text-info" style="margin-left: 5px">Ilgaz Şumnulu</span>

                <b class="caret pull-left"></b>
            </div>
        </a>
        <ul class="dropdown-menu">
            <li><a href="/kimlik/sumnulu">Profilime git</a></li>
            <li class="divider"></li>
            <li><a href="#">Oturumu kapat</a></li>
        </ul>
    </span>
</div>
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
                        class="visible-desktop">| ${profile.workHistory?.lastEntity?.position}</span>
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
<script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3.5&amp;sensor=false"></script>

<script>
    var themerPrimaryColor = '#71c39a';
</script>

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
<r:layoutResources/>

</body>
</html>