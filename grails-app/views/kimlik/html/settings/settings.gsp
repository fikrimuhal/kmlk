<!-- hr -->
<div class="row">
    <div class="col-lg-12">

        %{--<section class="panel">--}%
            <header class="panel-heading text-right">
                <ul class="nav nav-tabs pull-left">

                    <li ng-class="{active: $routeSegment.contains('general')}"><a href="/kimlik/{{user_name}}/settings/general"> <i class="fa fa-home icon-large text-default"></i>Hakkımda</a></li>
                    <li ng-class="{active: $routeSegment.contains('location')}"><a href="/kimlik/{{user_name}}/settings/location"> <i class="fa fa-map-marker icon-large text-default"></i>Ev adresim</a></li>
                    <li ng-class="{active: $routeSegment.contains('history')}"><a href="/kimlik/{{user_name}}/settings/history"> <i class="fa fa-user icon-large text-default"></i>Eğitim ve İş geçmişi</a></li>
                    <li ng-class="{active: $routeSegment.contains('skills')}"><a href="/kimlik/{{user_name}}/settings/skills"><i class="fa fa-user icon-large text-default"></i> Beceri ve Yeterlilikler</a></li>
                    <li ng-class="{active: $routeSegment.contains('social')}"><a href="/kimlik/{{user_name}}/settings/social"><i class="fa fa-user icon-large text-default"></i> Sosyal Hesaplarım</a></li>
                    %{--<li ng-class="{active: $routeSegment.contains('profilePicture')}"><a href="/kimlik/{{user_name}}/settings/profilePicture"><i class="fa fa-picture icon-large text-default"></i> Profil resmim</a></li>--}%
                    %{--<li ng-class="{active: $routeSegment.contains('notifications')}"><a href="/kimlik/{{user_name}}/settings/notifications"><i class="fa fa-user icon-large text-default"></i> Bildirimler</a></li>--}%

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

