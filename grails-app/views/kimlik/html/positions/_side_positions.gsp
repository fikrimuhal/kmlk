<aside class="sidebar sidebar-large">
    <div class="padder header-bar bg clearfix">
        <div class="btn-group m-t pull-right">
            <button type="button" class="btn btn-sm btn-white"><i class="fa fa-chevron-left"></i></button>
            <button type="button" class="btn btn-sm btn-white"><i class="fa fa-chevron-right"></i></button>
        </div>

        <div class="btn-group m-t m-b">
            <button class="btn btn-white btn-sm dropdown-toggle" data-toggle="dropdown">Filter <span
                    class="caret"></span></button>
            <ul class="dropdown-menu text-left text-small">
                <li><a href="#">Read</a></li>
                <li><a href="#">Unread</a></li>
                <li><a href="#">Starred</a></li>
                <li><a href="#">Unstarred</a></li>
            </ul>
        </div>
        <button class="btn btn-sm btn-white" data-toggle="tooltip" data-title="Refresh" data-original-title=""
                title=""><i class="fa fa-refresh"></i></button>
    </div>

    <div class="list-group list-normal m-t-n-xmini" style="max-height:1000px">
        <a ng-repeat="it in inbox" ng-cloak  ng-click="toggleDetails(it)" href="#" class="list-group-item"><small
                class="pull-right text-muted">3 minuts ago</small><strong>{{it.company.short_name}}</strong><br><small>{{it.position.title}}</small>
        </a>
        <a href="#"  class="list-group-item active"><small
                class="pull-right text-muted">1 hour ago</small><strong>Test Co.</strong><br><small>Position test 0 active</small>
        </a>

    </div>
</aside>