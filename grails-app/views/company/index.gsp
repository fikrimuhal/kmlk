<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="first"/>

    <r:require modules="company,first_deprecated,sparkline,easypiechart,googleMaps, landing,fileUpload"/>

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
                    <h4 class="modal-title" id="myModalLabel">Geri bildirim ve İstekler</h4>
                </div>

                <div class="modal-body">
                    <div class="block">
                        <label class="control-label">Kısaca...</label>
                        <input type="text" class="form-control" placeholder="Konu başlığı">
                    </div>

                    <div class="block">
                        <label class="control-label">Mesaj</label>
                        <textarea class="form-control" placeholder="Size çok daha iyi hizmet verebilmek için istek, önerileri ve şikayetlerinizi dinliyoruz." rows="5"></textarea>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Vazgeçtim</button>
                    <button type="button" class="btn btn-sm btn-primary"
                            data-loading-text="Publishing...">Gönder</button>
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
