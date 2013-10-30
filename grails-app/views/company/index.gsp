<!DOCTYPE html>
<html lang="en" ng-app="kimlik">
<head>
    <meta charset="utf-8">
    <title>Mobile first web app theme | first</title>
    <meta name="description" content="mobile first, app, web app, responsive, admin dashboard, flat, flat ui">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/first/css/bootstrap.css">
    <link rel="stylesheet" href="/first/css/font-awesome.min.css">
    <link rel="stylesheet" href="/first/css/font.css" cache="false">
    <link rel="stylesheet" href="/first/css/style.css">
    <link rel="stylesheet" href="/first/css/plugin.css">
    <link rel="stylesheet" href="/first/css/landing.css">

    <r:require modules="company"/>


    <r:layoutResources/>

    <!--[if lt IE 9]>
    <script src="/first/js/ie/respond.min.js" cache="false"></script>
    <script src="/first/js/ie/html5.js" cache="false"></script>
    <script src="/first/js/ie/excanvas.js" cache="false"></script>
  <![endif]-->
    <script type="text/ng-template" id="_template/company.inline">

    <g:render template="/shared/header"/>
    <g:render template="/shared/nav"/>

                <section id="content">
                    <section class="main padder" app-view-segment="1"></section>
                </section>
</script>
</head>

<body>


<div app-view-segment="0"></div>



<!-- .modal -->
<div id="modal" class="modal fade">
    <form class="m-b-none">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><i class="icon-remove"></i></button>
                    <h4 class="modal-title" id="myModalLabel">Post your first idea</h4>
                </div>

                <div class="modal-body">
                    <div class="block">
                        <label class="control-label">Title</label>
                        <input type="text" class="form-control" placeholder="Post title">
                    </div>

                    <div class="block">
                        <label class="control-label">Content</label>
                        <textarea class="form-control" placeholder="Content" rows="5"></textarea>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Share with all memebers of first
                        </label>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Save</button>
                    <button type="button" class="btn btn-sm btn-primary"
                            data-loading-text="Publishing...">Publish</button>
                </div>
            </div><!-- /.modal-content -->
        </div>
    </form>
</div>
<!-- / .modal -->



<g:render template="/shared/footer"/>
<r:layoutResources/>

<a href="#" class="hide slide-nav-block" data-toggle="class:slide-nav slide-nav-left" data-target="body"></a>
<!-- / footer -->
<script src="/first/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/first/js/bootstrap.js"></script>
<!-- app -->
<script src="/first/js/app.js"></script>
<script src="/first/js/app.plugin.js"></script>
<script src="/first/js/app.data.js"></script>

<!-- Sparkline Chart -->
<script src="/first/js/charts/sparkline/jquery.sparkline.min.js"></script>
<!-- Easy Pie Chart -->
<script src="/first/js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
</body>
</html>
