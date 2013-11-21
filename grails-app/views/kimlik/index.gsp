<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="first"/>


    <script type="text/ng-template" id="_template/kimlik.inline">
                    <section class="main" app-view-segment="1"></section>
    </script>

    <script type="text/javascript">
        _settings.staticMode = false; // i.e. locationProvider should USE html5Mode
    </script>


</head>

<body>

<g:render template="/shared/header"/>

<section id="content" class="content-sidebar bg-white">

    <!-- .sidebar -->
    <aside class="sidebar bg-lighter sidebar">
        <div class="text-center clearfix bg-white">
            <img src="http://s3.amazonaws.com/kimlik/photos/525bee2aef869502d11cc461.jpg">
        </div>

        <div class="bg-light padder padder-v">
            <span class="h4">Ilgaz şumnulu </span>
            <small class="block m-t-mini">CTO</small>
            <button class="btn btn-primary btn-sm active" data-toggle="button">
                <span class="text">
                    <i class="icon-eye-open"></i> TODO
                </span>
                <span class="text-active">
                    <i class="icon-eye-open"></i> ODOT
                </span>
            </button>
        </div>
    <g:render template="leftNav"/>

    </aside>
    <!-- /.sidebar -->

<div app-view-segment="0"></div>
</section>



<g:render template="/shared/footer"/>

<a href="#" class="hide slide-nav-block" data-toggle="class:slide-nav slide-nav-left" data-target="body"></a>
<!-- / footer -->
</body>
</html>
