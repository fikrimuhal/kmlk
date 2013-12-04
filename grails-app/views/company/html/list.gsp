<div class="page-header">

    <h2>Şirket listesi <small class="pull-right"><a href="/company/my/new"><i class="fa fa-plus"></i>
        Yeni şirket ekle</a></small></h2>
</div>

<div class="row">
    <div class="col-sm-4 col-md-3" ng-repeat="c in companies">
        <a href="/company/{{c.name.pageName}}/hr">

        <div class="thumbnail text-center" >
            <br/>

            <i class="fa fa-cog fa-5x "></i>

            <div class="caption">
                <h3>{{c.short_name}}</h3> <small>{{c.full_name}}</small>
            </div>
        </div>
        </a>
    </div>

</div>