<!-- hr -->
<div class="row">
    <div class="col-lg-12">

        <ul class="breadcrumb hidden-sm hidden-xs hidden-phone">
            <li><a href="#"><i class="fa fa-home"></i>Fikrimuhal</a></li>
            <li><a href="#"><i class="fa fa-list-ul"></i>Ayarlar</a></li>
            <li class="active">Genel</li>
        </ul>
        <section class="panel">
            <header class="panel-heading text-right">
                <ul class="nav nav-tabs pull-left">

                    <li ng-class="{active: $routeSegment.contains('general')}"><a href="/company/{{company_name}}/settings/general">Genel</a></li>
                    <li ng-class="{active: $routeSegment.contains('location')}"><a href="/company/{{company_name}}/settings/location">Lokasyon</a></li>
                    <li ng-class="{active: $routeSegment.contains('images')}"><a href="/company/{{company_name}}/settings/images">Görseller</a></li>
                    <li class="disabled" ng-class="{active: $routeSegment.contains('security')}"><a href="#/company/{{company_name}}/settings/security">Güvenlik ve İzinler</a></li>
                    <li class="disabled" ng-class="{active: $routeSegment.contains('notifications')}"><a href="#/company/{{company_name}}/settings/notifications">Bildirimler</a></li>
                    <li class="disabled" ng-class="{active: $routeSegment.contains('social')}"><a href="#/company/{{company_name}}/settings/social">Sosyal</a></li>
                    <li ng-class="{active: $routeSegment.contains('www')}"><a href="/company/{{company_name}}/settings/www">Web Sayfası</a></li>

                </ul>
                <span class="hidden-sm hidden-xs hidden-phone">Ayarlar</span>
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
