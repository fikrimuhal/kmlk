<div class="row"  ng-controller="NotificationCtrl">
    <div class="col-md-8 ">
        <h4 class="text-center">Bildiriler</h4>


        <section class="panel-body">

            <article class="media" ng-repeat-start="it in items">
                <span class="pull-left thumb-small">
                    <i class="fa text-center fa-2x m-t-small"
                       ng-class="{'fa-check-circle  text-muted' : !it.isRead, 'fa-circle text-primary' : it.isRead}"></i>
                </span>

                <div class="media-body">
                    <div class="pull-right media-mini text-center text-muted">
                        <strong class="h4">{{it.date}}</strong><br>
                        <small class="label bg-light"> feb</small>
                    </div>
                    <a href="#" class="h4"> {{it.title}}</a>
                    <small class="block"><a href="#" class="">John Smith</a> <span
                            class="label label-info">Friends</span></small>
                    <small class="block">{{it.message}}</small>
                </div>
            </article>

            <div class="line pull-in" ng-repeat-end ng-if="!$last"></div>

        </section>
    </div>
</div>
