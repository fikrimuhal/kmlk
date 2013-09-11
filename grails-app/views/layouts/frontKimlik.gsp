<!DOCTYPE html>
<!--[if lt IE 7]> <html class="front ie lt-ie9 lt-ie8 lt-ie7 fluid top-full menuh-top"> <![endif]-->
<!--[if IE 7]>    <html class="front ie lt-ie9 lt-ie8 fluid top-full menuh-top sticky-top"> <![endif]-->
<!--[if IE 8]>    <html class="front ie lt-ie9 fluid top-full menuh-top sticky-top"> <![endif]-->
<!--[if gt IE 8]> <html class="animations front ie gt-ie8 fluid top-full menuh-top sticky-top"> <![endif]-->
<!--[if !IE]><!--><html class="animations front fluid top-full menuh-top sticky-top"><!-- <![endif]-->
<head>
    <title>Kimlik.io</title>

    <!-- Meta -->
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>

    <!-- Bootstrap -->
    <link href="/common/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="/common/bootstrap/css/responsive.css" rel="stylesheet" type="text/css"/>

    <!-- Glyphicons Font Icons -->
    <link href="/common/theme/fonts/glyphicons/css/glyphicons.css" rel="stylesheet"/>

    <link rel="stylesheet" href="/common/theme/fonts/font-awesome/css/font-awesome.min.css">
    <!--[if IE 7]><link rel="stylesheet" href="/common/theme/fonts/font-awesome/css/font-awesome-ie7.min.css"><![endif]-->

    <!-- Uniform Pretty Checkboxes -->
    %{--<link href="/common/theme/scripts/plugins/forms/pixelmatrix-uniform/css/uniform.default.css" rel="stylesheet" />--}%

    <!-- Main Theme Stylesheet :: CSS -->
    <link href="/common/theme/css/style-default-menus-dark.css" rel="stylesheet"/>


    <!-- LESS.js Library -->
    <script src="/common/theme/scripts/plugins/system/less.min.js"></script>

    %{--<r:require modules=" fresh,freshServices,freshControllers"/>--}%

    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body class="login " ng-app='kimlikFront'>

<!-- Main Container Fluid -->
<div class="container-fluid menu-hidden">

    <!-- Content -->
    <div id="content" style="padding-top: 0px;">
        %{--<g:render template="/shared/front/navbar"/>--}%

        <g:layoutBody></g:layoutBody>
    </div>
    <!-- // Content END -->

    <g:render template="/shared/front/footerBig"/>

</div>
<!-- // Main Container Fluid END -->

<!-- JQuery -->
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- Code Beautify -->
<script src="/common/theme/scripts/plugins/other/js-beautify/beautify.js"></script>
<script src="/common/theme/scripts/plugins/other/js-beautify/beautify-html.js"></script>

<!-- Global -->
<script>
    var basePath = '',
            commonPath = '/common/';
</script>


<!-- Modernizr -->
<script src="/common/theme/scripts/plugins/system/modernizr.js"></script>

<!-- Bootstrap -->
<script src="/common/bootstrap/js/bootstrap.min.js"></script>

%{--<!-- SlimScroll Plugin -->--}%
%{--<script src="/common/theme/scripts/plugins/other/jquery-slimScroll/jquery.slimscroll.js"></script>--}%

%{--<!-- MegaMenu -->--}%
%{--<script src="/common/theme/scripts/demo/megamenu.js?1374506533"></script>--}%

%{--<!-- jQuery ScrollTo Plugin -->--}%
%{--<!--[if gt IE 8]><!--><script src="http://balupton.github.io/jquery-scrollto/lib/jquery-scrollto.js"></script><!--<![endif]-->--}%

<!-- History.js -->
%{--<!--[if gt IE 8]><!--><script src="http://browserstate.github.io/history.js/scripts/bundled/html4+html5/jquery.history.js"></script><!--<![endif]-->--}%

<!-- jQuery Ajaxify -->
%{--<!--[if gt IE 8]><!--><script src="/common/theme/scripts/plugins/system/jquery-ajaxify/ajaxify-html5.js"></script><!--<![endif]-->--}%


%{--<!-- Holder Plugin -->--}%
%{--<script src="/common/theme/scripts/plugins/other/holder/holder.js?1374506533"></script>--}%

%{--<!-- Uniform Forms Plugin -->--}%
%{--<script src="/common/theme/scripts/plugins/forms/pixelmatrix-uniform/jquery.uniform.min.js"></script>--}%

%{--<!-- Common Demo Script -->--}%
%{--<script src="/common/theme/scripts/demo/common.js?1374506533"></script>--}%
<r:layoutResources/>

</body>
</html>