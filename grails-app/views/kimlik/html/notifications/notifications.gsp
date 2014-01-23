<div class="row"  ng-controller="NotificationCtrl">
    <div class="col-md-9 ">
        <h4 class="text-center">Bildiriler</h4>


        <section class="panel-body">

            <article class="media" ng-repeat-start="it in items">
                <span class="pull-left thumb-small">
                    <i class="fa text-center fa-2x m-t-small"
                       ng-class="{'fa-check-circle  text-muted' : it.isRead, 'fa-circle text-primary' : !it.isRead}"></i>
                </span>

                <div ng-include="notificationBodyTemplate(it)"></div>
            </article>

            <div class="line pull-in" ng-repeat-end ng-if="!$last"></div>

        </section>
    </div>
    <div class="col-md-3 text-center">
        <br/>
        <button ng-click="markAllAsRead()"class="btn btn-default btn-block m-r-mini m-b-mini"><i class="fa fa-eye-o"></i> Hepsini <br/>okundu olarak işaretle</button>
        <button ng-click="deleteNotifications()"class="btn btn-danger btn-block m-r-mini m-b-mini"><i class="fa fa-trash"></i> Hepsini <br/>Sil</button>
    </div>


</div>


