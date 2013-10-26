<div class="row">
    <div class="col-sm-4 col-md-4">

        <div class="list-group">
            <a ng-repeat="p in positions"
               href="/company/{{company_name}}/hr/positions/{{p._id}}"
               class="list-group-item"
               ng-class="{active: $routeSegment.$routeParams.pid ==p._id }">
                {{p.title}}
            </a>

        </div>
        <a href="/company/{{company_name}}/hr/positions/new"
           ng-class="{'active': isNew }"
           class="btn btn-default pull-right">Yeni pozisyon ekle</a>

    </div>

    <div class="col-sm-4 col-md-8">
        <div ng-show="position_id" class="panel panel-primary">
            <div class="panel-heading">Panel heading without title</div>

            <div class="panel-body">
                Basic panel example
                {{$routeSegment.$routeParams | json}}
            </div>
        </div>

        <div ng-show="isNew" class="panel panel-primary">
            <div class="panel-heading">Yeni Pozisyon Ekle</div>

            <div class="panel-body">
                new position
                {{$routeSegment.$routeParams | json}}
            </div>
        </div>
    </div>
</div>
