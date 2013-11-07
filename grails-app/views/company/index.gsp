<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="first"/>

    <r:require modules="company,first_deprecated,sparkline,easypiechart,googleMaps, landing"/>

    <script type="text/ng-template" id="_template/company.inline">

        <g:render template="/shared/header"/>
        <g:render template="/shared/nav"/>

                <section id="content">
                    <section class="main padder" app-view-segment="1"></section>
                </section>

    </script>
    <script type="text/javascript">
        _settings.staticMode = false // i.e. locationProvider should USE html5Mode
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

<a href="#" class="hide slide-nav-block" data-toggle="class:slide-nav slide-nav-left" data-target="body"></a>
<!-- / footer -->

</body>
</html>
