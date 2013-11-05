<!DOCTYPE html>
<html lang="en" ng-app="kimlik">
<head>
    <meta charset="utf-8">
    <title>Kimlik.io</title>
    <meta name="description"
          content="app, kimlik, mobile, fikrimuhal, sumnulu, ilgaz sumnulu, ilgaz, kurumsal, startup, girişim, girisim, şirket">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <r:require modules="first,company"/>

    <g:layoutHead/>

    <r:layoutResources/>

    <!--[if lt IE 9]>
    <script src="/first/js/ie/respond.min.js" cache="false"></script>
    <script src="/first/js/ie/html5.js" cache="false"></script>
    <script src="/first/js/ie/excanvas.js" cache="false"></script>
  <![endif]-->

    <style type="text/css">
    [ng\:cloak], [ng-cloak], .ng-cloak {
        display: none !important;
    }
    </style>

    <script type="text/javascript">
        /**
         * child page should set settings
         * @type {{}}
         * @private
         */
        var _settings = {};
    </script>
</head>

<body data-spy="${pageProperty(name: 'body. data-spy')}"
      data-target="${pageProperty(name: 'body.data-target')}"
      data-offset-top="${pageProperty(name: 'body.data-offset-top')}"
      class="${pageProperty(name: 'body.class')}">

<g:layoutBody></g:layoutBody>




<r:layoutResources/>

</body>
</html>
