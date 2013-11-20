<!DOCTYPE html>
<!--@Deprecated-->
<!--suppress CheckTagEmptyBody -->

<html lang="en" ng-app="kimlik">
<head>
    <meta charset="utf-8">
    <title>Kimlik.io</title>
    <meta name="description"
          content="app, kimlik, mobile, fikrimuhal, sumnulu, ilgaz sumnulu, ilgaz, kurumsal, startup, girişim, girisim, şirket">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <r:require modules="first,company,fileUpload"/>

    <script type="text/javascript">
        /**
         * child page should set/override these settings
         * this block should be before 'layoutHead' (these are the defaults!)
         * @type {{}}
         * @private
         */
        var _settings = {
            staticMode:true,
            debug:false,
            baseUrl: '${g.createLink([absolute:true, uri:"/" ])}'
        };
    </script>

    <g:layoutHead/>

    <r:layoutResources/>

    <!--[if lt IE 9]>
    <script src="/first/js/ie/respond.min.js"></script>
    <script src="/first/js/ie/html5.js"></script>
    <script src="/first/js/ie/excanvas.js"></script>
  <![endif]-->

    <style type="text/css">
    [ng\:cloak], [ng-cloak], .ng-cloak {
        display: none !important;
    }
    </style>


</head>

<body data-spy="${pageProperty(name: 'body.data-spy')}"
      data-target="${pageProperty(name: 'body.data-target')}"
      data-offset-top="${pageProperty(name: 'body.data-offset-top')}"
      class="${pageProperty(name: 'body.class')}"
      id="body"

>

<g:layoutBody></g:layoutBody>





<r:layoutResources/>

</body>
</html>
