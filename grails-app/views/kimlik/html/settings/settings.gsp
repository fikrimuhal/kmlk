<!-- hr -->
<div class="row">
    <div class="col-lg-12">

        %{--<section class="panel">--}%
            <header class="panel-heading text-right">
                <ul class="nav nav-tabs pull-left">

                    <li ng-class="{active: $routeSegment.contains('general')}"><a href="/kimlik/{{user_name}}/settings/general"> <i class="icon-home icon-large text-default"></i>Hakkımda</a></li>
                    <li ng-class="{active: $routeSegment.contains('history')}"><a href="/kimlik/{{user_name}}/settings/history"> <i class="icon-user icon-large text-default"></i>Eğitim ve İş geçmişi</a></li>
                    <li ng-class="{active: $routeSegment.contains('skills')}"><a href="/kimlik/{{user_name}}/settings/skills"><i class="icon-user icon-large text-default"></i> Beceri ve Yeterlilikler</a></li>
                    <li ng-class="{active: $routeSegment.contains('social')}"><a href="/kimlik/{{user_name}}/settings/social"><i class="icon-user icon-large text-default"></i> Sosyal Hesaplarım</a></li>
                    <li ng-class="{active: $routeSegment.contains('notifications')}"><a href="/kimlik/{{user_name}}/settings/notifications"><i class="icon-user icon-large text-default"></i> Bildirimler</a></li>

                </ul>
                <span class="hidden-sm hidden-xs hidden-phone">Ayarlar</span>
            </header>


            <div class="panel-body">
                <div class="tab-content">
                    <div class="">
                        <div app-view-segment="2"></div>

                    </div>

                </div>
            </div>
        %{--</section>--}%

    </div>
</div>
<!-- / hr -->

