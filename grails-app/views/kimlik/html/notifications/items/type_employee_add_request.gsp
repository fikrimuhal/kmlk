<div class="media-body" ng-controller="notificationEmployeeAddRequest">
    <div class="pull-right media-mini text-center text-muted">
        %{--<strong class="h4">{{it.date}}</strong><br>--}%
        <div class="text-right"> <button class="btn btn-default btn-primary m-r-mini m-b-mini" ng-click="iWorkHere(it.from.id)"><i class="fa fa-check-circle-o "></i> Onayla <br/><small>Evet bu Şirketde çalışıyorum</small></button></div>
    </div>
    <a href="#" class="h4"> {{it.title}}</a>
    <a href="{{it.data.company_url}}" target="_self"><small class="block">{{it.data.company_name}} <span
            class="label label-info">Şirket sayfasına git</span></small> </a>
    <small class="block">{{it.message}}</small>
</div>