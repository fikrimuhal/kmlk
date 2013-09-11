<!DOCTYPE html>
<!--[if lt IE 7]> <html class="ie lt-ie9 lt-ie8 lt-ie7 fluid top-full menuh-top"> <![endif]-->
<!--[if IE 7]>    <html class="ie lt-ie9 lt-ie8 fluid top-full menuh-top"> <![endif]-->
<!--[if IE 8]>    <html class="ie lt-ie9 fluid top-full menuh-top"> <![endif]-->
<!--[if gt IE 8]> <html class="animations ie gt-ie8 fluid top-full menuh-top"> <![endif]-->
<!--[if !IE]><!--><html class="animations fluid top-full menuh-top"><!-- <![endif]-->
<head>
    <title>Kurumsal.io</title>

    <!-- Meta -->
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>


    <g:render template="/shared/flat/styles"/>
</head>

<body class="document-body">

<!-- Main Container Fluid -->
<div class="container-fluid menu-hidden sidebar-hidden-phone fluid menu-left">

    <!-- Content -->
    <div id="content">

    %{--<g:render template="/shared/flat/navbar"/>--}%
        <g:layoutBody></g:layoutBody>
    </div>
    <!-- // Content END -->
    <g:render template="/shared/flat/footer"/>
    %{--<g:render template="/shared/front/footerBig"/>--}%


</div>
<!-- // Main Container Fluid END -->


%{--<g:render template="/shared/flat/themer"/>--}%
<g:render template="/shared/flat/modal-gallery"/>
<g:render template="/shared/flat/javascipts"/>




</body>
</html>