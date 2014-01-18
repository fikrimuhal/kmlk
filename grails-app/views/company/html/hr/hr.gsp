<!-- hr -->
<div class="row">
    <div class="col-lg-12">

        <ul class="breadcrumb hidden-sm hidden-xs hidden-phone">
            <li><a href="#"><i class="fa fa-home"></i>Fikrimuhal</a></li>
            <li><a href="#"><i class="fa fa-list-ul"></i>İnsan Kaynakları</a></li>
            <li class="active">Çalışanlar</li>
        </ul>
        <section class="panel">
            <header class="panel-heading text-right">
                <ul class="nav nav-tabs pull-left">
                    <li ng-class="{active: $routeSegment.contains('employees')}"><a
                            href="/company/{{company_name}}/hr/employees"><i
                                class="fa fa-home icon-large text-default"></i>Çalışanlar</a></li>
                    %{--<li ng-class="{active: $routeSegment.contains('positions')}"><a--}%
                            %{--href="/company/{{company_name}}/hr/positions"><i--}%
                                %{--class="fa fa-group icon-large text-default"></i>Pozisyonlar</a></li>--}%
                    <li ng-class="{active: $routeSegment.contains('applicants')}"><a
                            href="/company/{{company_name}}/hr/applicants"><i
                                class="fa fa-user icon-large text-default"></i>Adaylar</a></li>
                    %{--<li ng-class="{active: $routeSegment.contains('notifications')}"><a--}%
                            %{--href="/company/{{company_name}}/hr/notifications"><i--}%
                                %{--class="fa fa-comments icon-large text-default"></i>Bildiriler</a></li>--}%
                </ul>
                <span class="hidden-sm hidden-xs hidden-phone">İnsan Kaynakları</span>
            </header>

            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane fade active in">
                        <div app-view-segment="2"></div>

                    </div>

                </div>
            </div>
        </section>

    </div>
</div>
<!-- / hr -->
