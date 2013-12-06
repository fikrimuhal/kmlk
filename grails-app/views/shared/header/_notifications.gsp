<li>
    <div class="m-t m-b-small" id="panel-notifications" ng-controller="NotificationCtrl" >
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <b class="badge badge-notes bg-danger count-n" ng-show="(getNumberOfNewNotifications() > 0)">{{getNumberOfNewNotifications()}}</b>
            <i class="fa fa-comment-o icon-xlarge text-default"></i>
        </a>


        <section class="dropdown-menu m-l-small m-t-mini">
            <section class="panel panel-large arrow arrow-top">
                <header class="panel-heading bg-white"><span class="h5"><strong><span
                        class="count-n">{{getNumberOfNewNotifications()}}</span> yeni bildiriminiz var</strong></span></header>

                <div class="list-group">

                    %{--repeat start--}%
                    <a href="#" class="media list-group-item" ng-repeat="it in items | limitTo:8">
                    <i class="fa pull-right active " ng-class="{'fa-check-circle  text-muted' : it.isRead, 'fa-circle text-primary' : !it.isRead}"></i>
                        <span class="pull-left thumb-small">
                            <i class="fa" ng-class="{'fa-envelope-o text-muted' : it.isRead, 'fa-envelope' : !it.isRead}"></i>
                        </span>
                        <span class="media-body block m-b-none">
                            {{it.title}}<br>
                            <small class="text-muted">{{it.date}}</small>
                        </span>
                    </a>
                    %{--repeat end--}%

                </div>


                <a href="/kimlik/{{user_name}}/notifications"><footer class="panel-footer text-small">
                    Bütün bildirimleri gör <i class="fa fa-inbox pull-right"></i>
                </footer></a>
            </section>
        </section>
    </div>
</li>